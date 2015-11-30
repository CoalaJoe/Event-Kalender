<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * Class EventController
 *
 * @package AppBundle\Controller
 */
class AppController extends Controller
{
    /**
     * @Route("/", name="homepage")
     * @Template()
     *
     * @param Request $request
     *
     * @return array
     */
    public function indexAction(Request $request)
    {

        return array();
    }

    /**
     * @Route("/events/{page}", name="events_route", defaults={"page" = 1}, requirements={
     *     "page": "\d+"
     * })
     * @Template()
     *
     * @param Request $request
     * @param int     $page
     *
     * @return array
     */
    public function showEventsAction(Request $request, $page)
    {
        $queryBuilder = $this->get('doctrine.orm.entity_manager')->createQueryBuilder();
        $events       = $queryBuilder->select('e')->from('AppBundle:Event', 'e')->where('e.date > :today'
        )->orderBy('e.date')->setFirstResult(5 * $page - 5)->setMaxResults(5)->setParameter('today', new \DateTime()
        )->getQuery()->getResult();

        return array('page' => $page, 'events' => $events);
    }

    /**
     * @Route("/archive/{page}", name="archive_route", defaults={"page" = 1}, requirements={
     *     "page": "\d+"
     * })
     * @Template()
     *
     * @param Request $request
     * @param int     $page
     *
     * @return array
     */
    public function showArchiveAction(Request $request, $page)
    {
        $queryBuilder  = $this->get('doctrine.orm.entity_manager')->createQueryBuilder();
        $amount        = $queryBuilder->select('count(e.id)')->from('AppBundle:Event', 'e')->where('e.date < :today'
        )->setParameter('today', new \DateTime()
        )->getQuery()->getSingleScalarResult();
        $amountOfPages = $amount / 5;
        $events        = $queryBuilder->select('e')->where('e.date < :today'
        )->orderBy('e.date')->setFirstResult(5 * $page - 5)->setMaxResults(5)->setParameter('today', new \DateTime()
        )->getQuery()->getResult();

        return array('page' => $page, 'amountOfPages' => (int)round($amountOfPages), 'events' => $events);
    }

}
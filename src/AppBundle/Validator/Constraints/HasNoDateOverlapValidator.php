<?php
/**
 * Created by PhpStorm.
 * User: Ashura
 * Date: 25.11.15
 * Time: 07:52
 */

namespace AppBundle\Validator\Constraints;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Query\ResultSetMapping;
use Symfony\Component\Validator\Constraint;
use AppBundle\Entity\Event;
use Symfony\Component\Validator\ConstraintValidator;
use AppBundle\Validator\Constraints\HasNoDateOverlap;

/**
 * Class HasNoDateOverlapValidator
 *
 * @package AppBundle\Validator\Constraints
 */
class HasNoDateOverlapValidator extends ConstraintValidator
{
    /** @var EntityManager */
    protected $em;

    /**
     * @param Event      $event
     * @param Constraint $constraint
     */
    public function validate($event, Constraint $constraint)
    {
        $eventEndDate = $event->getDate()->format('Y-m-d H:i:s');
        $eventEndDate = new \DateTime($eventEndDate);
        $eventEndDate->modify("+".$event->getDuration()." minutes")->format('Y-m-d H:i:s');

        // Map result set to my Entity.
        $rsm = new ResultSetMapping();
        $rsm->addEntityResult('AppBundle\Entity\Event', 'e');
        $rsm->addFieldResult('e', 'termin', 'date');
        $rsm->addFieldResult('e', 'dauer', 'duration');

        // Using MySQL for better DateTime handling
        $query = $this->em->createNativeQuery("SELECT * FROM veranstaltung e
            WHERE e.termin < :endDate
            AND e.termin + INTERVAL e.dauer MINUTE > :startDate", $rsm
        );
        $query->setParameters(array("endDate" => $eventEndDate, 'startDate' => $event->getDate()->format('Y-m-d H:i:s'))
        );

        $overlappingEntities = $query->getResult();


        /** @var $constraint HasNoDateOverlap */
        if ($overlappingEntities){
            $this->context->addViolation($constraint->message);
        }
    }

    /**
     * @param EntityManager $em
     */
    public function setEntityManager(EntityManager $em)
    {
        $this->em = $em;
    }
}
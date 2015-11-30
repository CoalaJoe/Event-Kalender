<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class SecurityController. I am using a different controller for security task to ensure logic encapsulation.
 *
 * @package AppBundle\Controller
 */
class SecurityController extends Controller
{
    /**
     * @Route("/login", name="login_route")
     * @Template()
     * @param Request $request
     *
     * @return array
     */
    public function loginAction(Request $request)
    {
        if (!$this->get('security.context')->isGranted('ROLE_USER')){
            $authenticationUtils = $this->get('security.authentication_utils');
            $error               = $authenticationUtils->getLastAuthenticationError();
            $lastUsername        = $authenticationUtils->getLastUsername();

            return array(
                'last_username' => $lastUsername,
                'error'         => $error
            );
        }

        return $this->redirectToRoute('homepage');
    }

    /**
     * @Route("/login_check", name="login_check")
     * @param Request $request
     */
    public function loginCheckAction(Request $request)
    {

    }

    /**
     * @Route("/logout", name="logout_route")
     */
    public function logoutAction()
    {

    }
}

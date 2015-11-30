<?php

namespace AppBundle\Controller;

use AppBundle\Form\Model\ChangePassword;
use AppBundle\Form\Type\ChangePasswordType;
use AppBundle\Entity\User;
use AppBundle\Form\Type\UserType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Component\Security\Core\Encoder\PasswordEncoderInterface;

/**
 * Class AdminController
 *
 * @Route("/admin")
 * @Security("has_role('ROLE_USER')")
 *
 * @package AppBundle\Controller
 */
class AdminController extends Controller
{
    /**
     * @Route("/", name="dashboard_route")
     * @Template()
     *
     * @param Request $request
     *
     * @return array
     */
    public function dashboardAction(Request $request)
    {
        return array();
    }

    /**
     * @Route("/changePassword", name="password_change_route")
     * @Template()
     *
     */
    public function changePasswordAction(Request $request)
    {
        $feedback       = '';
        $changePassword = new ChangePassword(); // Data will be stored in this Object.
        $form           = $this->createForm(new ChangePasswordType(), $changePassword);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()){
            $data    = $form->getData();
            $factory = $this->container->get('security.encoder_factory');
            /** @var PasswordEncoderInterface $encoder */
            $encoder = $factory->getEncoder(new User());
            /** @var User $user */
            $user = $this->getUser();
            $user->setPassword($encoder->encodePassword($data->getNewPassword(), $user->getSalt()));
            $em = $this->get('doctrine.orm.entity_manager');
            $em->persist($user);
            $em->flush();

            $feedback = 'You successfully changed your password.';
        }

        return array('form' => $form->createView(), 'feedback' => $feedback);
    }

    /**
     * @Route("/newUser", name="new_user_route")
     * @Template()
     *
     * @param Request $request
     *
     * @return array
     */
    public function createUserAction(Request $request)
    {
        $feedback = '';
        $username = '';
        $form     = $this->createForm(new UserType());
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()){
            $em      = $this->get('doctrine.orm.entity_manager');
            $factory = $this->container->get('security.encoder_factory');
            /** @var PasswordEncoderInterface $encoder */
            $encoder = $factory->getEncoder(new User());
            /** @var User $user */
            $user = $form->getData();
            $user->setPassword($encoder->encodePassword($user->getPassword(), $user->getSalt()));
            $em->persist($user);
            $em->flush();
            $username = $user->getUsername();
            $feedback = 'User %username% has been created.';
        }

        return array('form' => $form->createView(), 'feedback' => $feedback, 'username' => $username);
    }

}
<?php
/**
 * Created by PhpStorm.
 * User: Ashura
 * Date: 19.11.15
 * Time: 16:16
 */

namespace AppBundle\Form\Type;


use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

/**
 * Class ChangePasswordType
 *
 * @package AppBundle\Form\Type
 */
class ChangePasswordType extends AbstractType
{
    /**
     * Build components of a base user form.
     *
     * @param FormBuilderInterface $builder
     * @param array                $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('oldPassword', new PasswordType(), array(
                'label' => 'Altes Passwort:'
            )
        )->add('newPassword', new RepeatedType(), array(
                'error_bubbling'  => true,
                'property_path'   => 'newPassword',
                'invalid_message' => 'The password fields must match.',
                'first_options'   => array('label' => 'Neues Passwort:'),
                'second_options'  => array('label' => 'Passwort wiederholen:'),
                'type'            => new PasswordType()
            )
        )->add('submit', new SubmitType(), array(
                'label' => 'Ändern',
                'attr'  => array(
                    'class' => 'btn btn-default'
                )
            )
        );
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
                'csrf_protection' => true,
                'csrf_field_name' => '_csrf_token',
                'intention'       => 'skdfj"*r23rdsflkhjsdf2r',
                'data_class'      => 'AppBundle\Form\Model\ChangePassword'
            )
        );
    }

    /**
     * I added this method to support older versions of the Symfony2 Framework
     *
     * @return string
     */
    public function getName()
    {
        return $this->getBlockPrefix();
    }

    /**
     * @return string
     */
    public function getBlockPrefix()
    {
        return 'app_bundle_change_password_type';
    }

}
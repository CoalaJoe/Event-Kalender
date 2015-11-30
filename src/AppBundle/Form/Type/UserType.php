<?php

namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;

/**
 * Class UserType
 *
 * @package AppBundle\Form\Type
 */
class UserType extends AbstractType
{
    /**
     * Build components of a base user form.
     *
     * @param FormBuilderInterface $builder
     * @param array                $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('username', new TextType(), array('label' => 'Benutzername:'))->add('password',
            new PasswordType(), array('label' => 'Passwort:')
        )->add('Senden', new SubmitType(), array('attr' => array('class' => 'btn btn-default')));
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
                'data_class'      => 'AppBundle\Entity\User'
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
        return 'app_bundle_user_type';
    }
}

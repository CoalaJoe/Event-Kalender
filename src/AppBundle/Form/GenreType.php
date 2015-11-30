<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

/**
 * Class GenreType
 *
 * @package AppBundle\Form
 */
class GenreType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array                $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('name');
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
                'csrf_protection' => true,
                'csrf_field_name' => '_csrf_token',
                'intention'       => 'sklkjsdfljks3rdsflkhjsr',
                'data_class'      => 'AppBundle\Entity\Genre'
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
        return 'appbundle_genre';
    }
}

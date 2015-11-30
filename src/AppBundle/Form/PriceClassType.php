<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

/**
 * Class PriceClassType
 *
 * @package AppBundle\Form
 */
class PriceClassType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array                $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('name')->add('price')->add('events');
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
                'csrf_protection' => true,
                'csrf_field_name' => '_csrf_token',
                'intention'       => 'sklkj09josifusokhjsr',
                'data_class'      => 'AppBundle\Entity\PriceClass'
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

    public function getBlockPrefix()
    {
        return 'appbundle_priceclass';
    }
}

<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class EventType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array                $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('name')->add('cast')->add('description')->add('date', 'datetime')->add('duration', 'integer')->add('file', 'file',
            array('label' => 'Image')
        )->add('imageDescription')->add('link')->add('linkDescription')->add('genre')->add('priceClasses');
    }

    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
                'data_class' => 'AppBundle\Entity\Event'
            )
        );
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'appbundle_event';
    }
}

<?php

namespace App\Form;

use App\Entity\Provider;
use App\Entity\ProviderType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EditProviderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombre')
            ->add('email')
            ->add('telefono', IntegerType::class)
            ->add('activo', ChoiceType::class, [
                'choices' => [
                    'Seleccione el estado' => null,
                    'Si' => true,
                    'No' => false,
                ],
            ])
            ->add('tipoProveedor', EntityType::class, [
                'class' => ProviderType::class,
                'choice_label' => 'nombre',
                'placeholder' => 'Seleccione tipo de proveedor',
                'choice_value' => 'id',
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Enviar',
                'attr' => [ 'class' => 'btn__primary form__btn'],
            ])
            ->add('cancelar', ButtonType::class, [
                'label' => 'Cancelar',
                'attr' => [
                    'class' => 'btn__primary form__btn form__btn--red',
                    'onclick' => 'window.location.href="../manager"'
                ]
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Provider::class,
        ]);
    }
}

<?php

namespace App\Controller;

use App\Entity\Provider;
use App\Entity\ProviderType;
use App\Form\EditProviderType;
use App\Form\NewProviderType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProviderManagerController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(): Response
    {
        return $this->render('provider_manager/index.html.twig', [
            'controller_name' => 'ProviderManagerController',
        ]);
    }

    /**
     *  @Route("/manager", name="manager")
     */
    public function manager()
    {
        $em = $this->getDoctrine()->getManager();
        $proveedores = $em->getRepository(Provider::class)->findAll();
        return $this->render('provider_manager/manager.html.twig', array(
            'listaProveedores' => $proveedores)
        );
    }

    /**
     *  @Route("/add-provider", name="addProvider")
     */
    public function addProvider(Request $request)
    {
        $proveedor = new Provider();
        $form = $this->createForm(NewProviderType::class, $proveedor);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $proveedor = $form->getData();
            $proveedor->setFechaAlta(new \DateTimeImmutable());
            $proveedor->setUltimaModificacion(new \DateTime());

            $em = $this->getDoctrine()->getManager();
            $em->persist($proveedor);
            $em->flush();

            return $this->redirectToRoute('manager');
        }

        return $this->render('provider_manager/add-provider.html.twig', [
            'add_provider' => $form->createView(),
        ]
        );
    }

     /**
     * @Route("/edit-provider/{idProveedor}", name="editProvider")
     */
    public function editProvider($idProveedor, Request $request)
    {

        $em = $this->getDoctrine()->getManager();
        $proveedor = $em->getRepository(Provider::class)->find($idProveedor);
        $form = $this->createForm(EditProviderType::class, $proveedor);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $proveedor = $form->getData();
            $proveedor->setUltimaModificacion(new \DateTime());

            $em->persist($proveedor);
            $em->flush();

            return $this->redirectToRoute('manager');
        }
        return $this->render('provider_manager/edit-provider.html.twig', array(
            'edit_provider' => $form->createView(),
        )
        );
    }

    /**
     *  @Route("/remove-provider/{idProveedor}", name="removeProvider")
     */
    public function removeProvider($idProveedor)
    {
        $em = $this->getDoctrine()->getManager();
        $proveedor = $em->getRepository(Provider::class)->find($idProveedor);

        if (!$proveedor) {
            throw new \Error('Error con el identificador del proveedor');
        }

        try {
            $em->remove($proveedor);
            $em->flush();
        } catch (\Exception $error) {
            throw new \Error('Error al eliminar el provedor');
        }


        return $this->redirectToRoute('manager');
    }
}

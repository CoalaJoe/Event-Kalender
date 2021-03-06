<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use AppBundle\Entity\PriceClass;
use AppBundle\Form\PriceClassType;

/**
 * PriceClass controller.
 *
 * @Route("/priceClass")
 * @Security("has_role('ROLE_USER')")
 *
 * @package AppBundle\Controller
 */
class PriceClassController extends Controller
{

    /**
     * Lists all PriceClass entities.
     *
     * @Route("/", name="api_priceClass")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('AppBundle:PriceClass')->findAll();

        return array(
            'entities' => $entities,
        );
    }

    /**
     * Creates a new PriceClass entity.
     *
     * @Route("/", name="api_priceClass_create")
     * @Method("POST")
     * @Template("AppBundle:PriceClass:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new PriceClass();
        $form   = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()){
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('api_priceClass_show', array('id' => $entity->getId())));
        }

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Creates a form to create a PriceClass entity.
     *
     * @param PriceClass $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(PriceClass $entity)
    {
        $form = $this->createForm(new PriceClassType(), $entity, array(
                'action' => $this->generateUrl('api_priceClass_create'),
                'method' => 'POST',
            )
        );

        $form->add('submit', 'submit', array('label' => 'Erstellen', 'attr' => array('class' => 'btn btn-default')));

        return $form;
    }

    /**
     * Displays a form to create a new PriceClass entity.
     *
     * @Route("/new", name="api_priceClass_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $entity = new PriceClass();
        $form   = $this->createCreateForm($entity);

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Finds and displays a PriceClass entity.
     *
     * @Route("/{id}", name="api_priceClass_show")
     * @Method("GET")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:PriceClass')->find($id);

        if (!$entity){
            throw $this->createNotFoundException('Unable to find PriceClass entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Creates a form to delete a PriceClass entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()->setAction($this->generateUrl('api_priceClass_delete', array('id' => $id))
        )->setMethod('DELETE')->add('submit', 'submit',
            array('label' => 'Löschen', 'attr' => array('class' => 'btn btn-danger'))
        )->getForm();
    }

    /**
     * Displays a form to edit an existing PriceClass entity.
     *
     * @Route("/{id}/edit", name="api_priceClass_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:PriceClass')->find($id);


        if (!$entity){
            throw $this->createNotFoundException('Unable to find PriceClass entity.');
        }

        $editForm   = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Creates a form to edit a PriceClass entity.
     *
     * @param PriceClass $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createEditForm(PriceClass $entity)
    {
        $form = $this->createForm(new PriceClassType(), $entity, array(
                'action' => $this->generateUrl('api_priceClass_update', array('id' => $entity->getId())),
                'method' => 'PUT',
            )
        );

        $form->add('submit', 'submit', array('label' => 'Übernehmen', 'attr' => array('class' => 'btn btn-default')));

        return $form;
    }

    /**
     * Edits an existing PriceClass entity.
     *
     * @Route("/{id}", name="api_priceClass_update")
     * @Method("PUT")
     * @Template("AppBundle:PriceClass:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:PriceClass')->find($id);

        if (!$entity){
            throw $this->createNotFoundException('Unable to find PriceClass entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm   = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()){
            $em->flush();

            return $this->redirect($this->generateUrl('api_priceClass_edit', array('id' => $id)));
        }

        return array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Deletes a PriceClass entity.
     *
     * @Route("/{id}", name="api_priceClass_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()){
            $em     = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('AppBundle:PriceClass')->find($id);

            if (!$entity){
                throw $this->createNotFoundException('Unable to find PriceClass entity.');
            }

            if (count($entity->getEvents()) !== 0){
                $deleteForm = $this->createDeleteForm($id);

                return $this->render('AppBundle:PriceClass:show.html.twig', array(
                        'entity'       => $entity,
                        'delete_form'  => $deleteForm->createView(),
                        'errorMessage' => '%object% is in use.'
                    )
                );
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('api_priceClass'));
    }
}

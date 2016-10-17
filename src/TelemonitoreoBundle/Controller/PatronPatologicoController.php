<?php
/**
 * Created by PhpStorm.
 * User: luisc
 * Date: 17/10/2016
 * Time: 12:19 PM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use FOS\RestBundle\View\View;
use TelemonitoreoBundle\Entity\PatronPatologico;

class PatronPatologicoController extends FOSRestController {

    /**
     * @Rest\GET("/patronpatologico")
     */
    public function getAllAction(){
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:PatronPatologico")->findAll();
    }

    /**
     * @Rest\GET("patronpatologico/{id}")
     */
    public function getPatronPatologicoAction($id){
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:PatronPatologico")->find($id);
    }

    /**
     * @Rest\POST("/patronpatologico/")
     */
    public function addPatronPatologicoAction(Request $request){
        $data = new PatronPatologico();
        $data->setTipoequipo($request->headers->get("tipoEquipo"));
        $data->setDescripcion($request->headers->get("descripcion"));
        $data->setVariables($request->headers->get("variables"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return new View("patron patologico added succefully", Response::HTTP_OK);
    }

    /**
     * @Rest\PUT("patronpatologico/{id}")
     */
    public function updatePatronPatologico($id, Request $request){
        $tipoEquipo = $request->headers->get("tipoEquipo");
        $descripcion = $request->headers->get("descripcion");
        $variables = $request->headers->get("variables");

        $em = $this->getDoctrine()->getManager();
        $patronPatologico = $this->getDoctrine()->getRepository("TelemonitoreoBundle:PatronPatologico")->find($id);
        if(empty($patronPatologico)){
            return new View("patron patologico not found", Response::HTTP_NOT_FOUND);
        }else{
            if(!empty($tipoEquipo)){
                $patronPatologico->setTipoequipo($tipoEquipo);
            }
            if(!empty($descripcion)){
                $patronPatologico->setDescripcion($descripcion);
            }
            if(!empty($variables)){
                $patronPatologico->setVariables($variables);
            }

            $em->flush();
            return new View("patron patologico Updated Successfully", Response::HTTP_OK);
        }
    }

    /**
     * @Rest\DELETE("/patronpatologico/{id}")
     */
    public function deletePatronPatologico($id){
        $em = $this->getDoctrine()->getManager();
        $patronPatologico = $this->getDoctrine()->getRepository("TelemonitoreoBundle:PatronPatologico")->find($id);
        $em->remove($patronPatologico);
        $em->flush();
        return new View("deleted succefully", Response::HTTP_OK);
    }
}
<?php
/**
 * Created by PhpStorm.
 * User: tuti-
 * Date: 17/10/2016
 * Time: 4:58 PM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use FOS\RestBundle\View\View;
use TelemonitoreoBundle\Entity\Registro;

class RegistroController extends FOSRestController{

    /**
     * @Rest\GET("/registro")
     */
    public function getAllAction(){
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Registro")->findAll();
    }

    /**
     * @Rest\GET("/registro/{id}")
     */
    public function getRegistroAction($id){
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Registro")->find($id);
    }

    /**
     * @Rest\POST("/registro/")
     */
    public function addRegistro(Request $request){
        $data = new Registro();
        $data->setIdequipo($request->headers->get("idEquipo"));
        $data->setfecha(new \DateTime($request->headers->get("fecha")));
        $data->setDuracion(new \DateTime($request->headers->get("duracion")));
        $data->setTipoarchivo($request->headers->get("tipoArchivo"));
        $data->setUriarchivo($request->headers->get("uriArchivo"));
        $data->setModulovisualizacion($request->headers->get("moduloVisualizacion"));
        $data->setIdhistoriaclinica($request->headers->get("idHistoriaClinica"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return new View("Historia clinica added succefully", Response::HTTP_OK);
    }

    /**
     * @Rest\DELETE("/registro/{id}")
     */
    public function deleteRegistro($id){
        $em = $this->getDoctrine()->getManager();
        $registro = $this->getDoctrine()->getRepository("TelemonitoreoBundle:Registro")->find($id);
        $em->remove($registro);
        $em->flush();
        return new View("deleted succefully", Response::HTTP_OK);
    }
}
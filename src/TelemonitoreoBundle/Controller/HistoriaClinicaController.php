<?php
/**
 * Created by PhpStorm.
 * User: luisc
 * Date: 16/10/2016
 * Time: 7:43 PM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use FOS\RestBundle\View\View;
use TelemonitoreoBundle\Entity\HistoriaClinica;

class HistoriaClinicaController extends FOSRestController{

    /**
     * @Rest\GET("/historiaclinica")
     */
    public function getAllAction(){
        return $this->getDoctrine()->getRepository('TelemonitoreoBundle:HistoriaClinica')->findAll();
    }

    /**
     * @Rest\GET("/historiaclinica/{id}")
     */
    public function getHistoriaClinicaAction($id){
       return $this->getDoctrine()->getRepository("TelemonitoreoBundle:HistoriaClinica")->find($id);
    }

    /**
     * @Rest\POST("/historiaclinica/")
     */
    public function addHistoriaClinicaAction(Request $request){
        $data = new HistoriaClinica();
        $data->setCodigo($request->headers->get("codigo"));
        $data->setCedulaPaciente($request->headers->get("cedula"));
        $data->setNombrePaciente($request->headers->get("nombre"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return new View("Historia clinica added succefully", Response::HTTP_OK);
    }

    /**
     * @Rest\PUT("/historiaclinica/{id}")
     */
    public function updateHistoriaClinicaAction($id, Request $request){
        $nombre = $request->headers->get("nombre");
        $cedula = $request->headers->get("cedula");
        $codigo = $request->headers->get("codigo");

        $em = $this->getDoctrine()->getManager();
        $historiaClinica = $this->getDoctrine()->getRepository("TelemonitoreoBundle:HistoriaClinica")->find($id);
        if(empty($historiaClinica)){
            return new View("historia clinica not found", Response::HTTP_NOT_FOUND);
        }else{
            if(!empty($nombre)){
                $historiaClinica->setNombrePaciente($nombre);
            }
            if(!empty($cedula)){
                $historiaClinica->setCedulaPaciente($cedula);
            }
            if(!empty($codigo)){
                $historiaClinica->setCodigo($codigo);
            }

            $em->flush();
            return new View("Historia clinica Updated Successfully", Response::HTTP_OK);
        }
    }

    /**
     * @Rest\DELETE("/historiaclinica/{id}")
     */
    public function deleteHistoriaClinica($id){
        $em = $this->getDoctrine()->getManager();

        $historiaClinica = $this->getDoctrine()->getRepository("TelemonitoreoBundle:HistoriaClinica")->find($id);

        $data = $this->getDoctrine()->getRepository("TelemonitoreoBundle:EquipoMedico")->findBy(array('idhistoriaclinica' => $historiaClinica->getId()));
        foreach ($data as &$valor) {
            $valor->setIdhistoriaclinica(null);
            $em->flush();
        }

        $em->remove($historiaClinica);
        $em->flush();
        return new View("deleted succefully", Response::HTTP_OK);
    }
}
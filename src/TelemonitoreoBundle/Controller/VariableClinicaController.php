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
use TelemonitoreoBundle\Entity\VariableClinica;

class VariableClinicaController extends FOSRestController {

    /**
     * @Rest\GET("/variableclinica")
     */
    public function getAllAction(){
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableClinica")->findAll();
    }

    /**
     * @Rest\GET("variableclinica/{id}")
     * @param $id
     * @return null|object|VariableClinica
     */
    public function getVariableClinicaAction($id){
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableClinica")->find($id);
    }

    /**
     * @Rest\POST("/variableclinica/")
     * @param Request $request
     * @return VariableClinica
     */
    public function addVariableClinicaAction(Request $request){
        $data = new VariableClinica();
        $data->setNombre($request->headers->get("nombre"));
        $data->setRango($request->headers->get("rango"));
        $data->setRangoParticular($request->headers->get("rangoparticular"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return $data;
    }

    /**
     * @Rest\PUT("variableclinica/{id}")
     * @param $id
     * @param Request $request
     * @return null|object|VariableClinica
     */
    public function updateVariableClinica($id, Request $request){
        $nombre = $request->headers->get("nombre");
        $rango = $request->headers->get("rango");
        $rangoparticular = $request->headers->get("rangoparticular");

        $em = $this->getDoctrine()->getManager();
        $variableClinica = $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableClinica")->find($id);
        if(empty($variableClinica)){
            return new View("variable clinica not found", Response::HTTP_NOT_FOUND);
        }else{
            if(!empty($nombre)){
                $variableClinica->setNombre($nombre);
            }
            if(!empty($rango)){
                $variableClinica->setRango($rango);
            }
            if(!empty($rangoparticular)){
                $variableClinica->setRangoParticular($rangoparticular);
            }

            $em->flush();

            $variableClinicaHasHistoriaClinica = $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableHasPaciente")->findBy(array("idVariableClinica" => $variableClinica->getId()));
            foreach ($variableClinicaHasHistoriaClinica as &$valor) {
                $em->remove($valor);
                $em->flush();
            }
            return $variableClinica;
        }
    }

    /**
     * @Rest\DELETE("/variableclinica/{id}")
     * @param $id
     * @return View
     */
    public function deleteVariableClinica($id){
        $em = $this->getDoctrine()->getManager();
        $variableClinica = $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableClinica")->find($id);
        $em->remove($variableClinica);
        $em->flush();
        return new View("deleted succefully", Response::HTTP_OK);
    }
}
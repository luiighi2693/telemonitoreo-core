<?php
/**
 * Created by PhpStorm.
 * User: luisc
 * Date: 22/10/2016
 * Time: 6:14 PM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use FOS\RestBundle\View\View;
use TelemonitoreoBundle\Entity\VariableHasPaciente;

class VariableHasPacienteController extends FOSRestController
{
    /**
     * @Rest\GET("/variablehaspaciente")
     */
    public function getAllAction(Request $request){
        if($request->headers->get("idvariableclinica")!=null){
            return $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableHasPaciente")->findBy(array("idVariableClinica" => $request->headers->get("idvariableclinica")));
        }
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableHasPaciente")->findAll();
    }

    /**
     * @Rest\POST("/variablehaspaciente/")
     */
    public function addVariableHasPacienteAction(Request $request){
        $data = new VariableHasPaciente();
        $data->setIdHistoriaClinica($request->headers->get("idhistoriaclinica"));
        $data->setIdVariableClinica($request->headers->get("idvariableclinica"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return $data;
    }
}
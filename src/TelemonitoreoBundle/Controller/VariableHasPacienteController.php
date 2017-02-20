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
use TelemonitoreoBundle\Entity\VariableHasPaciente;

class VariableHasPacienteController extends FOSRestController
{
    /**
     * @Rest\GET("/variablehaspaciente")
     * @param Request $request
     * @return array|\TelemonitoreoBundle\Entity\VariableHasPaciente[]
     */
    public function getAllAction(Request $request){
        if($request->headers->get("idvariableclinica")!=null){
            return $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableHasPaciente")->findBy(array("idVariableClinica" => $request->headers->get("idvariableclinica")));
        }
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableHasPaciente")->findAll();
    }

    /**
     * @Rest\POST("/variablehaspaciente/")
     * @param Request $request
     * @return VariableHasPaciente
     */
    public function addVariableHasPacienteAction(Request $request){
        $data = new VariableHasPaciente();
        $data->setIdHistoriaClinica($request->headers->get("idhistoriaclinica"));
        $data->setIdVariableClinica($request->headers->get("idvariableclinica"));
        $data->setRangoParticular($request->headers->get("rangoParticular"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return $data;
    }
}
<?php
/**
 * Created by PhpStorm.
 * User: luis
 * Date: 16/2/2017
 * Time: 11:00 PM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use TelemonitoreoBundle\Entity\VariableHasEquipo;

class VariableHasEquipoController extends FOSRestController
{
    /**
     * @Rest\GET("/variablehasequipo")
     * @param Request $request
     * @return array|\TelemonitoreoBundle\Entity\VariableHasEquipo[]
     */
    public function getAllAction(Request$request){
        if($request->headers->get("idvariableclinica")!=null){
            return $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableHasEquipo")->findBy(array("idVariableClinica" => $request->headers->get("idvariableclinica")));
        }
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:VariableHasEquipo")->findAll();
    }

    /**
     * @Rest\POST("/variablehasequipo/")
     * @param Request $request
     * @return VariableHasEquipo
     */
    public function addVariableHasEquipoAction(Request $request){
        $data = new VariableHasEquipo();
        $data->setIdEquipoMedico($request->headers->get("idequipomedico"));
        $data->setIdVariableClinica($request->headers->get("idvariableclinica"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return $data;
    }
}
<?php
/**
 * Created by PhpStorm.
 * User: luisc
 * Date: 17/10/2016
 * Time: 10:31 AM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use FOS\RestBundle\View\View;

class EquipoMedicoController extends FOSRestController{

    /**
     * @Rest\GET("/equipomedico")
     */
    public function getAllAction(){
        return $this->getDoctrine()->getRepository('TelemonitoreoBundle:EquipoMedico')->findAll();
    }

    /**
     * @Rest\GET("/equipomedico/{id}")
     */
    public function getEquipoMedico($id){
//        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:EquipoMedico")->find($id);
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:EquipoMedico")->findBy(array('idhistoriaclinica' => $id));
    }

}
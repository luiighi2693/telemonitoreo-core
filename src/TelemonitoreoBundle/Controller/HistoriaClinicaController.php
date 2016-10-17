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
use AppBundle\Entity\User;

class HistoriaClinicaController extends FOSRestController{

    /**
     * @Rest\GET("/historiaclinica")
     */
    public function getAllAction(){
        return $this->getDoctrine()->getRepository('TelemonitoreoBundle:HistoriaClinica')->findAll();
    }
}
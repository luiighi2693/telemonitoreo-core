<?php
/**
 * Created by PhpStorm.
 * User: luis
 * Date: 19/2/2017
 * Time: 1:47 PM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use TelemonitoreoBundle\Entity\UsuarioHasPaciente;

class UsuarioHasPacienteController extends FOSRestController
{
    /**
     * @Rest\GET("/usuariohaspaciente")
     * @return array|\TelemonitoreoBundle\Entity\UsuarioHasPaciente[]
     */
    public function getAllAction(){
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:UsuarioHasPaciente")->findAll();
    }
}
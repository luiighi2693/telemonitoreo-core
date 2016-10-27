<?php
/**
 * Created by PhpStorm.
 * User: LRodriguez
 * Date: 26/10/2016
 * Time: 12:36 PM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;

class UsuarioController extends FOSRestController
{
    /**
     * @Rest\GET("/usuario")
     * @param Request $request
     * @return array|null|\TelemonitoreoBundle\Entity\Usuario[]
     */
    public function getAllAction(Request $request){
        if($request->headers->get("username")!=null || $request->headers->get("password")!=null){
            $data = $this->getDoctrine()->getRepository('TelemonitoreoBundle:Usuario')->findBy(array("nombre" => $request->headers->get("username"), "password" => $request->headers->get("password")));
            if($data != null){
                return $data;
            }else{
                return null;
            }
        }
        return null;
    }
}
<?php
/**
 * Created by PhpStorm.
 * User: luisc
 * Date: 21/10/2016
 * Time: 12:43 AM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use FOS\RestBundle\View\View;
use TelemonitoreoBundle\Entity\Parametro;

class ParametroController extends FOSRestController
{
    /**
     * @Rest\GET("/parametro")
     * @param Request $request
     * @return array|\TelemonitoreoBundle\Entity\Parametro[]
     */
    public function getAllAction(Request $request){
        if($request->headers->get("codigo")!=null){
            return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Parametro")->findBy(array("codigo" => $request->headers->get("codigo")));
        }
        if($request->headers->get("nombre")!=null){
            return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Parametro")->findBy(array("nombre" => $request->headers->get("nombre")));
        }
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Parametro")->findAll();
    }

    /**
     * @Rest\GET("parametro/{id}")
     * @param $id
     * @return null|object|Parametro
     */
    public function getParametroAction($id){
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Parametro")->find($id);
    }

    /**
     * @Rest\POST("/parametro/")
     * @param Request $request
     * @return View
     */
    public function addParametroAction(Request $request){
        $data = new Parametro();
        $data->setNombre($request->headers->get("nombre"));
        $data->setCodigo($request->headers->get("codigo"));
        $data->setValor($request->headers->get("valor"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return new View("parametro added succefully", Response::HTTP_OK);
    }

    /**
     * @Rest\PUT("parametro/{id}")
     * @param $id
     * @param Request $request
     * @return View
     */
    public function updateParametro($id, Request $request){
        $nombre = $request->headers->get("nombre");
        $codigo = $request->headers->get("codigo");
        $valor = $request->headers->get("valor");

        $em = $this->getDoctrine()->getManager();
        $parametro = $this->getDoctrine()->getRepository("TelemonitoreoBundle:Parametro")->find($id);
        if(empty($parametro)){
            return new View("variable clinica not found", Response::HTTP_NOT_FOUND);
        }else{
            if(!empty($nombre)){
                $parametro->setNombre($nombre);
            }
            if(!empty($codigo)){
                $parametro->setCodigo($codigo);
            }
            if(!empty($valor)){
                $parametro->setValor($valor);
            }

            $em->flush();
            return new View("parametro Updated Successfully", Response::HTTP_OK);
        }
    }

    /**
     * @Rest\DELETE("/parametro/{id}")
     * @param $id
     * @return View
     */
    public function deleteParametro($id){
        $em = $this->getDoctrine()->getManager();
        $parametro = $this->getDoctrine()->getRepository("TelemonitoreoBundle:Parametro")->find($id);
        $em->remove($parametro);
        $em->flush();
        return new View("deleted succefully", Response::HTTP_OK);
    }
}
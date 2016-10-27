<?php
/**
 * Created by PhpStorm.
 * User: tuti-
 * Date: 17/10/2016
 * Time: 3:15 PM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use FOS\RestBundle\View\View;
use TelemonitoreoBundle\Entity\Historicos;

class HistoricosController extends FOSRestController{

    /**
     * @Rest\GET("/historicos")
     * @param Request $request
     * @return array|\TelemonitoreoBundle\Entity\Historicos[]
     */
    public function getAllAction(Request $request){
        //para el medico
        if($request->headers->get("idhistoriaclinica")!=null){
            return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Historicos")->findBy(array("idhistoriaclinica" => $request->headers->get("idhistoriaclinica")));
        }

        if($request->headers->get("nombreusuario")!=null){
            if($request->headers->get("cedulapaciente")!=null && intval($request->headers->get("cedulapaciente"))!=0){
                return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Historicos")->findBy(array("nombreusuario" => $request->headers->get("nombreusuario"), "cedulaPaciente" => $request->headers->get("cedulapaciente")));
            }
            return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Historicos")->findBy(array("nombreusuario" => $request->headers->get("nombreusuario")));
        }

        //para el administrador
        if($request->headers->get("cedulapaciente")!=null && intval($request->headers->get("cedulapaciente"))!=0){
            return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Historicos")->findBy(array("cedulaPaciente" => $request->headers->get("cedulapaciente")));
        }

        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Historicos")->findAll();
    }

    /**
     * @Rest\GET("/historicos/{id}")
     * @param $id
     * @return null|object|Historicos
     */
    public function getHistorico($id){
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Historicos")->find($id);
    }

    /**
     * @Rest\POST("/historicos/")
     * @param Request $request
     * @return View
     */
    public function addHistorico(Request $request){
        $data = new Historicos();
        $data->setObservacionPaciente($request->headers->get("observacionpaciente"));
        $data->setNombreusuario($request->headers->get("nombreusuario"));
        $data->setAccion($request->headers->get("accion"));
        $data->setFecha($request->headers->get("fecha"));
        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return new View("Historico added succefully", Response::HTTP_OK);
    }

//    /**
//     * @Rest\PUT("/historicos/{id}")
//     */
//    public function updateHistorico($id, Request $request){
//        $nombreusuario = $request->headers->get("nombreusuario");
//        $accion = $request->headers->get("accion");
//        $fecha = $request->headers->get("fecha");
//
//        $em = $this->getDoctrine()->getManager();
//        $historico = $this->getDoctrine()->getRepository("TelemonitoreoBundle:Historicos")->find($id);
//        if(empty($historico)){
//            return new View("historeico not found", Response::HTTP_NOT_FOUND);
//        }else{
//            if(!empty($nombreusuario)){
//                $historico->setNombreusuario($nombreusuario);
//            }
//            if(!empty($accion)){
//                $historico->setAccion($accion);
//            }
//            if(!empty($fecha)){
//                $historico->setFecha(new \DateTime($fecha));
//            }
//
//            $em->flush();
//            return new View("historico Updated Successfully", Response::HTTP_OK);
//        }
//    }

    /**
     * @Rest\DELETE("/historicos/{id}")
     * @param $id
     * @return View
     */
    public function deleteHistorico($id){
        $em = $this->getDoctrine()->getManager();
        $historico = $this->getDoctrine()->getRepository("TelemonitoreoBundle:Historicos")->find($id);
        $em->remove($historico);
        $em->flush();
        return new View("deleted succefully", Response::HTTP_OK);
    }
}
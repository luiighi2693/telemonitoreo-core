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
use TelemonitoreoBundle\Entity\EquipoMedico;

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
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:EquipoMedico")->find($id);
//        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:EquipoMedico")->findBy(array('idhistoriaclinica' => $id));
    }

    /**
     * @Rest\POST("/equipomedico/")
     */
    public function addEquipoMedicoAction(Request $request){
        $data = new EquipoMedico();
        $data->setIdhistoriaclinica($request->headers->get("idHistoriaClinica"));
        $data->setTipoequipo($request->headers->get("tipoEquipo"));
        $data->setNombre($request->headers->get("nombre"));
        $data->setMarca($request->headers->get("marca"));
        $data->setModelo($request->headers->get("modelo"));
        $data->setTipoconexion($request->headers->get("tipoConexion"));
        $data->setIp($request->headers->get("ip"));
        $data->setModuloconexion($request->headers->get("moduloConexion"));
        $data->setSerial($request->headers->get("serial"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return new View("Equipo medico added succefully", Response::HTTP_OK);
    }

    /**
     * @Rest\PUT("/equipomedico/{id}")
     */
    public function updateEquipoMedicoAction($id, Request $request){
        $tipoEquipo = $request->headers->get("tipoEquipo");
        $nombre = $request->headers->get("nombre");
        $marca = $request->headers->get("marca");
        $modelo = $request->headers->get("modelo");
        $tipoConexion = $request->headers->get("tipoConexion");
        $ip = $request->headers->get("ip");
        $moduloConexion = $request->headers->get("moduloConexion");
        $serial = $request->headers->get("serial");

        $em = $this->getDoctrine()->getManager();
        $equipoMedico = $this->getDoctrine()->getRepository("TelemonitoreoBundle:EquipoMedico")->find($id);

        if (empty($equipoMedico)){
            return new View("equipo medico not found", Response::HTTP_NOT_FOUND);
        }else{
            if(!empty($tipoEquipo)){
                $equipoMedico->setTipoequipo($tipoEquipo);
            }
            if(!empty($nombre)){
                $equipoMedico->setNombre($nombre);
            }
            if(!empty($marca)){
                $equipoMedico->setMarca($marca);
            }
            if(!empty($modelo)){
                $equipoMedico->setModelo($modelo);
            }
            if(!empty($tipoConexion)){
                $equipoMedico->setTipoconexion($tipoConexion);
            }
            if(!empty($ip)){
                $equipoMedico->setIp($ip);
            }
            if(!empty($moduloConexion)){
                $equipoMedico->setModuloconexion($moduloConexion);
            }
            if(!empty($serial)){
                $equipoMedico->setSerial($serial);
            }

            $em->flush();
            return new View("equipo medico Updated Successfully", Response::HTTP_OK);
        }
    }

    /**
     * @Rest\DELETE("/equipomedico/{id}")
     */
    public function deleteEquipoMedicoAction($id){
        $em = $this->getDoctrine()->getManager();
        $equipoMedico = $this->getDoctrine()->getRepository("TelemonitoreoBundle:EquipoMedico")->find($id);
        $em->remove($equipoMedico);
        $em->flush();
        return new View("deleted succefully", Response::HTTP_OK);
    }
}
<?php
/**
 * Created by PhpStorm.
 * User: tuti-
 * Date: 17/10/2016
 * Time: 4:58 PM
 */

namespace TelemonitoreoBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use FOS\RestBundle\View\View;
use TelemonitoreoBundle\Entity\Historicos;
use TelemonitoreoBundle\Entity\Registro;

class RegistroController extends FOSRestController{

    /**
     * @Rest\GET("/registro")
     */
    public function getAllAction(Request $request){
        if($request->headers->get("idhistoriaclinica")!=null){
            return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Registro")->findBy(array("idhistoriaclinica" =>$request->headers->get("idhistoriaclinica")));
        }
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Registro")->findAll();
    }

    /**
     * @Rest\GET("/registro/{id}")
     */
    public function getRegistroAction($id){
        return $this->getDoctrine()->getRepository("TelemonitoreoBundle:Registro")->find($id);
    }

    /**
     * @Rest\POST("/registro/")
     */
    public function addRegistro(Request $request){
        $data = new Registro();
        $data->setIdequipo($request->headers->get("idEquipo"));
        $data->setFecha($request->headers->get("fecha"));
        $data->setTipoarchivo($request->headers->get("tipoArchivo"));
        $data->setUriarchivo($request->headers->get("uriArchivo"));
        $data->setModulovisualizacion($request->headers->get("moduloVisualizacion"));
        $data->setIdhistoriaclinica($request->headers->get("idHistoriaClinica"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return new View("Historia clinica added succefully", Response::HTTP_OK);
    }

    /**
     * @Rest\DELETE("/registro/{id}")
     */
    public function deleteRegistro($id, Request $request){
        $em = $this->getDoctrine()->getManager();
        $registro = $this->getDoctrine()->getRepository("TelemonitoreoBundle:Registro")->find($id);
        $historiaClinica = $this->getDoctrine()->getRepository("TelemonitoreoBundle:HistoriaClinica")->find($registro->getIdhistoriaclinica());
        $equipoMedico = $this->getDoctrine()->getRepository("TelemonitoreoBundle:EquipoMedico")->find($registro->getIdequipo());

        $historico = new Historicos();
        $historico->setNombreusuario($request->headers->get("usuario"));
        $historico->setFecha($request->headers->get("fecha"));
        $historico->setAccion("DELETE");
        $historico->setObservacionPaciente("Se ha Elminado el Registro de la fecha: ".$registro->getFecha()." modulo de visualizacion: ".$registro->getModulovisualizacion()." ubicacion: ".$registro->getUriarchivo()." con el equipo: ".$equipoMedico->getNombre().", marca: ".$equipoMedico->getMarca().", modelo: ".$equipoMedico->getModelo().", serial: ".$equipoMedico->getSerial()." y referente al paciente: ".$historiaClinica->getNombrePaciente().", cedula: ".$historiaClinica->getCedulaPaciente().", historia clinica: ".$historiaClinica->getCodigo());
        $historico->setIdhistoriaclinica($historiaClinica->getId());
        $historico->setCedulaPaciente($historiaClinica->getCedulaPaciente());
        $em->persist($historico);
        $em->flush();

        $em->remove($registro);
        $em->flush();
        return new View("deleted succefully", Response::HTTP_OK);
    }
}
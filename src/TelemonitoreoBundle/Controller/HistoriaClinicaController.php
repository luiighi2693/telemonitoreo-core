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
use TelemonitoreoBundle\Entity\HistoriaClinica;
use TelemonitoreoBundle\Entity\Historicos;
use TelemonitoreoBundle\Entity\UsuarioHasPaciente;

class HistoriaClinicaController extends FOSRestController{

    /**
     * @Rest\GET("/historiaclinica")
     * @param Request $request
     * @return array|\TelemonitoreoBundle\Entity\HistoriaClinica[]
     */
    public function getAllAction(Request $request){
        $usuario =$this->getDoctrine()->getRepository('TelemonitoreoBundle:Usuario')->findOneBy(array("nombre" => $request->headers->get("usuario")));
        $pacientesAsociados = $this->getDoctrine()->getRepository('TelemonitoreoBundle:UsuarioHasPaciente')->findBy(array("idUsuario" => $usuario->getId()));

        $arreglo = array();
        foreach ($pacientesAsociados as &$valor) {
            array_push($arreglo, $this->getDoctrine()->getRepository('TelemonitoreoBundle:HistoriaClinica')->findOneBy(array("id" => $valor->getIdHistoriaClinica())));
        }
        return $arreglo;
    }

    /**
     * @Rest\GET("/historiaclinica/{id}")
     * @param $id
     * @return null|object|HistoriaClinica
     */
    public function getHistoriaClinicaAction($id){
       return $this->getDoctrine()->getRepository("TelemonitoreoBundle:HistoriaClinica")->find($id);
    }

    /**
     * @Rest\POST("/historiaclinica/")
     * @param Request $request
     * @return View
     */
    public function addHistoriaClinicaAction(Request $request){
        $data = new HistoriaClinica();
        $data->setCodigo($request->headers->get("codigo"));
        $data->setCedulaPaciente($request->headers->get("cedula"));
        $data->setNombrePaciente($request->headers->get("nombre"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        $usuario = $this->getDoctrine()->getRepository('TelemonitoreoBundle:Usuario')->findOneBy(array("nombre" => $request->headers->get("usuario")));
        $usuarioAsociadoPaciente = new UsuarioHasPaciente();
        $usuarioAsociadoPaciente->setIdUsuario($usuario->getId());
        $usuarioAsociadoPaciente->setIdHistoriaClinica($data->getId());
        $em->persist($usuarioAsociadoPaciente);
        $em->flush();

        $historico = new Historicos();
        $historico->setNombreusuario($request->headers->get("usuario"));
        $historico->setAccion("CREATE");
        $historico->setFecha($request->headers->get("fecha"));
        $historico->setObservacionPaciente("Se ha Creado el usuario: ".$data->getNombrePaciente().", cedula: ".$data->getCedulaPaciente().", historia clinica: ".$data->getCodigo());
        $historico->setIdhistoriaclinica($data->getId());
        $historico->setCedulaPaciente($data->getCedulaPaciente());
        $em->persist($historico);
        $em->flush();

        return new View("Historia clinica added succefully", Response::HTTP_OK);
    }

    /**
     * @Rest\PUT("/historiaclinica/{id}")
     * @param $id
     * @param Request $request
     * @return View
     */
    public function updateHistoriaClinicaAction($id, Request $request){
        $nombre = $request->headers->get("nombre");
        $cedula = $request->headers->get("cedula");
        $codigo = $request->headers->get("codigo");

        $em = $this->getDoctrine()->getManager();
        $historiaClinica = $this->getDoctrine()->getRepository("TelemonitoreoBundle:HistoriaClinica")->find($id);
        if(empty($historiaClinica)){
            return new View("historia clinica not found", Response::HTTP_NOT_FOUND);
        }else{
            if(!empty($nombre)){
                $historiaClinica->setNombrePaciente($nombre);
            }
            if(!empty($cedula)){
                $historiaClinica->setCedulaPaciente($cedula);
            }
            if(!empty($codigo)){
                $historiaClinica->setCodigo($codigo);
            }

            $em->flush();
            return new View("Historia clinica Updated Successfully", Response::HTTP_OK);
        }
    }

    /**
     * @Rest\DELETE("/historiaclinica/{id}")
     * @param $id
     * @param Request $request
     * @return View
     */
    public function deleteHistoriaClinica($id, Request $request){
        $em = $this->getDoctrine()->getManager();

        $historiaClinica = $this->getDoctrine()->getRepository("TelemonitoreoBundle:HistoriaClinica")->find($id);

        $data = $this->getDoctrine()->getRepository("TelemonitoreoBundle:EquipoMedico")->findBy(array('idhistoriaclinica' => $historiaClinica->getId()));
        foreach ($data as &$valor) {
            $valor->setIdhistoriaclinica(null);
            $em->flush();
        }

        $pacientesAsociados = $this->getDoctrine()->getRepository('TelemonitoreoBundle:UsuarioHasPaciente')->findBy(array("idHistoriaClinica" => $historiaClinica->getId()));
        foreach ($pacientesAsociados as &$valor) {
            $em->remove($valor);
            $em->flush();
        }

        $historico = new Historicos();
        $historico->setNombreusuario($request->headers->get("usuario"));
        $historico->setAccion("DELETE");
        $historico->setFecha($request->headers->get("fecha"));
        $historico->setObservacionPaciente("Se ha Elminado el usuario: ".$historiaClinica->getNombrePaciente().", cedula: ".$historiaClinica->getCedulaPaciente().", historia clinica: ".$historiaClinica->getCodigo());
        $historico->setIdhistoriaclinica($historiaClinica->getId());
        $historico->setCedulaPaciente($historiaClinica->getCedulaPaciente());
        $em->persist($historico);
        $em->flush();

        $em->remove($historiaClinica);
        $em->flush();
        return new View("deleted succefully", Response::HTTP_OK);
    }
}
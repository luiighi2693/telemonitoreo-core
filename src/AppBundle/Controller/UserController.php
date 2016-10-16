<?php
/**
 * Created by PhpStorm.
 * User: luisc
 * Date: 16/10/2016
 * Time: 4:22 PM
 */
namespace AppBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use FOS\RestBundle\View\View;
use AppBundle\Entity\User;

class UserController extends FOSRestController{

    /***
     * @Rest\GET("/user")
     */
    public function getAction(){
        $restresult = $this->getDoctrine()->getRepository('AppBundle:User')->findAll();
        if($restresult === null){
            return new View("no existe usuarios", Response::HTTP_NOT_FOUND);
        }
        return $restresult;
    }

    /**
     * @Rest\GET("/user/{id}")
     */
    public function idAction($id){
        $singleResult = $this->getDoctrine()->getRepository('AppBundle:User')->find($id);
        if($singleResult === null){
            return new View("no existe usuarios", Response::HTTP_NOT_FOUND);
        }
        return $singleResult;
    }

    /**
     * @Rest\POST("/user/")
     */
    public function postAction(Request $request){
        $data = new User();
        $data->setName($request->headers->get("name"));
        $data->setRole($request->headers->get("role"));

        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();

        return new View("User added succefully", Response::HTTP_OK);
    }

    /**
     * @Rest\PUT("/user/{id}")
     */
    public function updateAction($id, Request $request){
        $name = $request->headers->get("name");
        $role = $request->headers->get("role");
        $em = $this->getDoctrine()->getManager();
        $user = $this->getDoctrine()->getRepository("AppBundle:User")->find($id);

        if (empty($user)) {
            return new View("user not found", Response::HTTP_NOT_FOUND);
        }
        elseif(!empty($name) && !empty($role)){
            $user->setName($name);
            $user->setRole($role);
            $em->flush();
            return new View("User Updated Successfully", Response::HTTP_OK);
        }
        elseif(empty($name) && !empty($role)){
            $user->setRole($role);
            $em->flush();
            return new View("role Updated Successfully", Response::HTTP_OK);
        }
        elseif(!empty($name) && empty($role)){
            $user->setName($name);
            $em->flush();
            return new View("User Name Updated Successfully", Response::HTTP_OK);
        }
        else return new View("User name and role cannot be empty", Response::HTTP_NOT_ACCEPTABLE);
    }

    /**
     * @Rest\DELETE("/user/{id}")
     */
    public function deleteAction($id){
        $em = $this->getDoctrine()->getManager();
        $user = $this->getDoctrine()->getRepository("AppBundle:User")->find($id);
        if(empty($user)){
            return new View("user not found", Response::HTTP_NOT_FOUND);
        }else{
            $em->remove($user);
            $em->flush();
        }
        return new View("deleted succefully", Response::HTTP_OK);
    }
}
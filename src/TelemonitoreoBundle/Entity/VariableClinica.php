<?php

namespace TelemonitoreoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PatronPatologico
 *
 * @ORM\Table(name="variableclinica")
 * @ORM\Entity(repositoryClass="TelemonitoreoBundle\Repository\VariableClinicaRepository")
 */
class VariableClinica
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="VC_nombre", type="string", length=100)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="VC_rango", type="string", length=50)
     */
    private $rango;

    /**
     * @var string
     *
     * @ORM\Column(name="VC_rangoparticular", type="string", length=50)
     */
    private $rangoParticular;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * @param string $nombre
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    }

    /**
     * @return string
     */
    public function getRango()
    {
        return $this->rango;
    }

    /**
     * @param string $rango
     */
    public function setRango($rango)
    {
        $this->rango = $rango;
    }

    /**
     * @return string
     */
    public function getRangoParticular()
    {
        return $this->rangoParticular;
    }

    /**
     * @param string $rangoParticular
     */
    public function setRangoParticular($rangoParticular)
    {
        $this->rangoParticular = $rangoParticular;
    }


}


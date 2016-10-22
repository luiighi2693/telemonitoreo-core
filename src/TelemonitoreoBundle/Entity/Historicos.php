<?php

namespace TelemonitoreoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Historicos
 *
 * @ORM\Table(name="historicos")
 * @ORM\Entity(repositoryClass="TelemonitoreoBundle\Repository\HistoricosRepository")
 */
class Historicos
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
     * @ORM\Column(name="HI_observacionpaciente", type="string", length=300)
     */
    private $observacionPaciente;

    /**
     * @var string
     *
     * @ORM\Column(name="HI_nombreusuario", type="string", length=100)
     */
    private $nombreusuario;

    /**
     * @var string
     *
     * @ORM\Column(name="HI_accion", type="string", length=100)
     */
    private $accion;

    /**
     * @var string
     *
     * @ORM\Column(name="HI_fecha", type="string", length=100)
     */
    private $fecha;

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
     * Set nombreusuario
     *
     * @param string $nombreusuario
     *
     * @return Historicos
     */
    public function setNombreusuario($nombreusuario)
    {
        $this->nombreusuario = $nombreusuario;

        return $this;
    }

    /**
     * Get nombreusuario
     *
     * @return string
     */
    public function getNombreusuario()
    {
        return $this->nombreusuario;
    }

    /**
     * Set accion
     *
     * @param string $accion
     *
     * @return Historicos
     */
    public function setAccion($accion)
    {
        $this->accion = $accion;

        return $this;
    }

    /**
     * Get accion
     *
     * @return string
     */
    public function getAccion()
    {
        return $this->accion;
    }

    /**
     * @return string
     */
    public function getObservacionPaciente()
    {
        return $this->observacionPaciente;
    }

    /**
     * @param string $observacionPaciente
     */
    public function setObservacionPaciente($observacionPaciente)
    {
        $this->observacionPaciente = $observacionPaciente;
    }

    /**
     * @return string
     */
    public function getFecha()
    {
        return $this->fecha;
    }

    /**
     * @param string $fecha
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;
    }
}


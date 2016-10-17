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
     * @var int
     *
     * @ORM\Column(name="HI_idhistoriaclinica", type="integer")
     */
    private $idhistoriaclinica;

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
     * @var \DateTime
     *
     * @ORM\Column(name="HI_fecha", type="date")
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
     * Set idhistoriaclinica
     *
     * @param string $idhistoriaclinica
     *
     * @return Historicos
     */
    public function setIdhistoriaclinica($idhistoriaclinica)
    {
        $this->idhistoriaclinica = $idhistoriaclinica;

        return $this;
    }

    /**
     * Get idhistoriaclinica
     *
     * @return string
     */
    public function getIdhistoriaclinica()
    {
        return $this->idhistoriaclinica;
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
     * Set fecha
     *
     * @param \DateTime $fecha
     *
     * @return Historicos
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;

        return $this;
    }

    /**
     * Get fecha
     *
     * @return \DateTime
     */
    public function getFecha()
    {
        return $this->fecha;
    }
}


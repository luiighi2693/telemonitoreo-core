<?php

namespace TelemonitoreoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Registro
 *
 * @ORM\Table(name="registro")
 * @ORM\Entity(repositoryClass="TelemonitoreoBundle\Repository\RegistroRepository")
 */
class Registro
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
     * @ORM\Column(name="RE_idequipo", type="integer")
     */
    private $idequipo;

    /**
     * @var int
     *
     * @ORM\Column(name="RE_idhistoriaclinica", type="integer")
     */
    private $idhistoriaclinica;

    /**
     * @var string
     *
     * @ORM\Column(name="RE_fecha", type="string", length=100)
     */
    private $fecha;

    /**
     * @var string
     *
     * @ORM\Column(name="RE_duracion", type="string", length=50)
     */
    private $duracion;

    /**
     * @var string
     *
     * @ORM\Column(name="RE_tipoarchivo", type="string", length=50)
     */
    private $tipoarchivo;

    /**
     * @var string
     *
     * @ORM\Column(name="RE_uriarchivo", type="string", length=100)
     */
    private $uriarchivo;

    /**
     * @var string
     *
     * @ORM\Column(name="RE_modulovisualizacion", type="string", length=255)
     */
    private $modulovisualizacion;


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
     * Set idequipo
     *
     * @param integer $idequipo
     *
     * @return Registro
     */
    public function setIdequipo($idequipo)
    {
        $this->idequipo = $idequipo;

        return $this;
    }

    /**
     * Get idequipo
     *
     * @return int
     */
    public function getIdequipo()
    {
        return $this->idequipo;
    }

    /**
     * Set idhistoriaclinica
     *
     * @param integer $idhistoriaclinica
     *
     * @return Registro
     */
    public function setIdhistoriaclinica($idhistoriaclinica)
    {
        $this->idhistoriaclinica = $idhistoriaclinica;

        return $this;
    }

    /**
     * Get idhistoriaclinica
     *
     * @return int
     */
    public function getIdhistoriaclinica()
    {
        return $this->idhistoriaclinica;
    }

    /**
     * Set tipoarchivo
     *
     * @param string $tipoarchivo
     *
     * @return Registro
     */
    public function setTipoarchivo($tipoarchivo)
    {
        $this->tipoarchivo = $tipoarchivo;

        return $this;
    }

    /**
     * Get tipoarchivo
     *
     * @return string
     */
    public function getTipoarchivo()
    {
        return $this->tipoarchivo;
    }

    /**
     * Set uriarchivo
     *
     * @param string $uriarchivo
     *
     * @return Registro
     */
    public function setUriarchivo($uriarchivo)
    {
        $this->uriarchivo = $uriarchivo;

        return $this;
    }

    /**
     * Get uriarchivo
     *
     * @return string
     */
    public function getUriarchivo()
    {
        return $this->uriarchivo;
    }

    /**
     * Set modulovisualizacion
     *
     * @param string $modulovisualizacion
     *
     * @return Registro
     */
    public function setModulovisualizacion($modulovisualizacion)
    {
        $this->modulovisualizacion = $modulovisualizacion;

        return $this;
    }

    /**
     * Get modulovisualizacion
     *
     * @return string
     */
    public function getModulovisualizacion()
    {
        return $this->modulovisualizacion;
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

    /**
     * @return string
     */
    public function getDuracion()
    {
        return $this->duracion;
    }

    /**
     * @param string $duracion
     */
    public function setDuracion($duracion)
    {
        $this->duracion = $duracion;
    }


}


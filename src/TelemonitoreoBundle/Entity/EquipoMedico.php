<?php

namespace TelemonitoreoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * EquipoMedico
 *
 * @ORM\Table(name="equipomedico")
 * @ORM\Entity(repositoryClass="TelemonitoreoBundle\Repository\EquipoMedicoRepository")
 */
class EquipoMedico
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
     * @ORM\Column(name="EM_idhistoriaclinica", type="integer")
     */
    private $idhistoriaclinica;

    /**
     * @var string
     *
     * @ORM\Column(name="EM_tipoequipo", type="string", length=100)
     */
    private $tipoequipo;

    /**
     * @var string
     *
     * @ORM\Column(name="EM_nombre", type="string", length=100)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="EM_marca", type="string", length=100)
     */
    private $marca;

    /**
     * @var string
     *
     * @ORM\Column(name="EM_modelo", type="string", length=100)
     */
    private $modelo;

    /**
     * @var string
     *
     * @ORM\Column(name="EM_tipoconexion", type="string", length=50)
     */
    private $tipoconexion;

    /**
     * @var string
     *
     * @ORM\Column(name="ip", type="string", length=100)
     */
    private $ip;

    /**
     * @var string
     *
     * @ORM\Column(name="moduloconexion", type="string", length=100)
     */
    private $moduloconexion;


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
     * @param integer $idhistoriaclinica
     *
     * @return EquipoMedico
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
     * Set tipoequipo
     *
     * @param string $tipoequipo
     *
     * @return EquipoMedico
     */
    public function setTipoequipo($tipoequipo)
    {
        $this->tipoequipo = $tipoequipo;

        return $this;
    }

    /**
     * Get tipoequipo
     *
     * @return string
     */
    public function getTipoequipo()
    {
        return $this->tipoequipo;
    }

    /**
     * Set nombre
     *
     * @param string $nombre
     *
     * @return EquipoMedico
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre
     *
     * @return string
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set marca
     *
     * @param string $marca
     *
     * @return EquipoMedico
     */
    public function setMarca($marca)
    {
        $this->marca = $marca;

        return $this;
    }

    /**
     * Get marca
     *
     * @return string
     */
    public function getMarca()
    {
        return $this->marca;
    }

    /**
     * Set modelo
     *
     * @param string $modelo
     *
     * @return EquipoMedico
     */
    public function setModelo($modelo)
    {
        $this->modelo = $modelo;

        return $this;
    }

    /**
     * Get modelo
     *
     * @return string
     */
    public function getModelo()
    {
        return $this->modelo;
    }

    /**
     * Set tipoconexion
     *
     * @param string $tipoconexion
     *
     * @return EquipoMedico
     */
    public function setTipoconexion($tipoconexion)
    {
        $this->tipoconexion = $tipoconexion;

        return $this;
    }

    /**
     * Get tipoconexion
     *
     * @return string
     */
    public function getTipoconexion()
    {
        return $this->tipoconexion;
    }

    /**
     * Set ip
     *
     * @param string $ip
     *
     * @return EquipoMedico
     */
    public function setIp($ip)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip
     *
     * @return string
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set moduloconexion
     *
     * @param string $moduloconexion
     *
     * @return EquipoMedico
     */
    public function setModuloconexion($moduloconexion)
    {
        $this->moduloconexion = $moduloconexion;

        return $this;
    }

    /**
     * Get moduloconexion
     *
     * @return string
     */
    public function getModuloconexion()
    {
        return $this->moduloconexion;
    }
}


<?php

namespace TelemonitoreoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * HistoriaClinica
 *
 * @ORM\Table(name="historiaclinica")
 * @ORM\Entity(repositoryClass="TelemonitoreoBundle\Repository\HistoriaClinicaRepository")
 */
class HistoriaClinica
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
     * @ORM\Column(name="HC_codigo", type="string", length=50)
     */
    private $codigo;

    /**
     * @var string
     *
     * @ORM\Column(name="HC_nombrePaciente", type="string", length=100)
     */
    private $nombrePaciente;

    /**
     * @var string
     *
     * @ORM\Column(name="HC_cedulaPaciente", type="string", length=100)
     */
    private $cedulaPaciente;


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
     * Set codigo
     *
     * @param string $codigo
     *
     * @return HistoriaClinica
     */
    public function setCodigo($codigo)
    {
        $this->codigo = $codigo;

        return $this;
    }

    /**
     * Get codigo
     *
     * @return string
     */
    public function getCodigo()
    {
        return $this->codigo;
    }

    /**
     * Set nombrePaciente
     *
     * @param string $nombrePaciente
     *
     * @return HistoriaClinica
     */
    public function setNombrePaciente($nombrePaciente)
    {
        $this->nombrePaciente = $nombrePaciente;

        return $this;
    }

    /**
     * Get nombrePaciente
     *
     * @return string
     */
    public function getNombrePaciente()
    {
        return $this->nombrePaciente;
    }

    /**
     * Set cedulaPaciente
     *
     * @param string $cedulaPaciente
     *
     * @return HistoriaClinica
     */
    public function setCedulaPaciente($cedulaPaciente)
    {
        $this->cedulaPaciente = $cedulaPaciente;

        return $this;
    }

    /**
     * Get cedulaPaciente
     *
     * @return string
     */
    public function getCedulaPaciente()
    {
        return $this->cedulaPaciente;
    }
}


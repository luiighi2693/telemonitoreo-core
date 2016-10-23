<?php

namespace TelemonitoreoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * VariableHasPaciente
 *
 * @ORM\Table(name="variable_has_paciente")
 * @ORM\Entity(repositoryClass="TelemonitoreoBundle\Repository\VariableHasPacienteRepository")
 */
class VariableHasPaciente
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
     * @ORM\Column(name="VP_idvariableclinica", type="integer")
     */
    private $idVariableClinica;

    /**
     * @var int
     *
     * @ORM\Column(name="VP_idhistoriaclinica", type="integer")
     */
    private $idHistoriaClinica;


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
     * Set idVariableClinica
     *
     * @param integer $idVariableClinica
     *
     * @return VariableHasPaciente
     */
    public function setIdVariableClinica($idVariableClinica)
    {
        $this->idVariableClinica = $idVariableClinica;

        return $this;
    }

    /**
     * Get idVariableClinica
     *
     * @return int
     */
    public function getIdVariableClinica()
    {
        return $this->idVariableClinica;
    }

    /**
     * Set idHistoriaClinica
     *
     * @param integer $idHistoriaClinica
     *
     * @return VariableHasPaciente
     */
    public function setIdHistoriaClinica($idHistoriaClinica)
    {
        $this->idHistoriaClinica = $idHistoriaClinica;

        return $this;
    }

    /**
     * Get idHistoriaClinica
     *
     * @return int
     */
    public function getIdHistoriaClinica()
    {
        return $this->idHistoriaClinica;
    }
}


<?php
/**
 * Created by PhpStorm.
 * User: luis
 * Date: 16/2/2017
 * Time: 10:51 PM
 */

namespace TelemonitoreoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Class VariableHasEquipo
 *
 * @ORM\Table(name="variable_has_equipo")
 * @ORM\Entity(repositoryClass="TelemonitoreoBundle\Repository\VariableHasEquipoRepository")
 */
class VariableHasEquipo
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
     * @ORM\Column(name="VE_idVariableClinica", type="integer")
     */
    private $idVariableClinica;

    /**
     * @var int
     *
     * @ORM\Column(name="VE_idequipomedico", type="integer")
     */
    private $idEquipoMedico;

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return int
     */
    public function getIdVariableClinica()
    {
        return $this->idVariableClinica;
    }

    /**
     * Set idVariableClinica
     *
     * @param integer $idVariableClinica
     *
     * @return VariableHasEquipo
     */
    public function setIdVariableClinica($idVariableClinica)
    {
        $this->idVariableClinica = $idVariableClinica;

        return $this;
    }

    /**
     * @return int
     */
    public function getIdEquipoMedico()
    {
        return $this->idEquipoMedico;
    }

    /**
     * Set idEquipoMedico
     *
     * @param integer $idEquipoMedico
     *
     * @return VariableHasEquipo
     */
    public function setIdEquipoMedico($idEquipoMedico)
    {
        $this->idEquipoMedico = $idEquipoMedico;

        return $this;
    }


}
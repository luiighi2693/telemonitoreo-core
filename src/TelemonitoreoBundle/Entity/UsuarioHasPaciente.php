<?php
/**
 * Created by PhpStorm.
 * User: luis
 * Date: 19/2/2017
 * Time: 1:43 PM
 */

namespace TelemonitoreoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Class VariableHasEquipo
 *
 * @ORM\Table(name="usuario_has_paciente")
 * @ORM\Entity(repositoryClass="TelemonitoreoBundle\Repository\UsuarioHasPacienteRepository")
 */
class UsuarioHasPaciente
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
     * @ORM\Column(name="UP_idhistoriaclinica", type="integer")
     */
    private $idHistoriaClinica;

    /**
     * @var int
     *
     * @ORM\Column(name="UP_idusuario", type="integer")
     */
    private $idUsuario;

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
    public function getIdHistoriaClinica()
    {
        return $this->idHistoriaClinica;
    }

    /**
     * @param int $idHistoriaClinica
     */
    public function setIdHistoriaClinica($idHistoriaClinica)
    {
        $this->idHistoriaClinica = $idHistoriaClinica;
    }

    /**
     * @return int
     */
    public function getIdUsuario()
    {
        return $this->idUsuario;
    }

    /**
     * @param int $idUsuario
     */
    public function setIdUsuario($idUsuario)
    {
        $this->idUsuario = $idUsuario;
    }
}
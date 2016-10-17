<?php

namespace TelemonitoreoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PatronPatologico
 *
 * @ORM\Table(name="patronpatologico")
 * @ORM\Entity(repositoryClass="TelemonitoreoBundle\Repository\PatronPatologicoRepository")
 */
class PatronPatologico
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
     * @ORM\Column(name="PP_descripcion", type="string", length=500)
     */
    private $descripcion;

    /**
     * @var string
     *
     * @ORM\Column(name="PP_variables", type="string", length=100)
     */
    private $variables;

    /**
     * @var string
     *
     * @ORM\Column(name="PP_tipoequipo", type="string", length=50)
     */
    private $tipoequipo;


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
     * Set descripcion
     *
     * @param string $descripcion
     *
     * @return PatronPatologico
     */
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    /**
     * Get descripcion
     *
     * @return string
     */
    public function getDescripcion()
    {
        return $this->descripcion;
    }

    /**
     * Set variables
     *
     * @param string $variables
     *
     * @return PatronPatologico
     */
    public function setVariables($variables)
    {
        $this->variables = $variables;

        return $this;
    }

    /**
     * Get variables
     *
     * @return string
     */
    public function getVariables()
    {
        return $this->variables;
    }

    /**
     * Set tipoequipo
     *
     * @param string $tipoequipo
     *
     * @return PatronPatologico
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
}


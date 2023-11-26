<?php

namespace App\Entity;

use App\Repository\ProviderRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ProviderRepository::class)
 */
class Provider
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nombre;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $email;

    /**
     * @ORM\Column(type="integer")
     */
    private $telefono;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\ProviderType", inversedBy="proveedores")
     */
    private $tipoProveedor;

    /**
     * @ORM\Column(type="boolean")
     */
    private $activo;

    /**
     * @ORM\Column(type="datetime_immutable")
     */
    private $fecha_alta;

    /**
     * @ORM\Column(type="datetime")
     */
    private $ultima_modificacion;

    /**
     * @param $nombre
     * @param $email
     * @param $telefono
     * @param $tipoProveedor
     * @param $activo
     */
    public function __construct($nombre=null, $email=null, $telefono=null, $tipoProveedor=null, $activo=null)
    {
        $this->nombre = $nombre;
        $this->email = $email;
        $this->telefono = $telefono;
        $this->tipoProveedor = $tipoProveedor;
        $this->activo = $activo;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getTelefono(): ?int
    {
        return $this->telefono;
    }

    public function setTelefono(int $telefono): self
    {
        $this->telefono = $telefono;

        return $this;
    }

    public function getActivo(): ?bool
    {
        return $this->activo;
    }

    public function setActivo(bool $activo): self
    {
        $this->activo = $activo;

        return $this;
    }

    /**
     * @return mixed|null
     */
    public function getTipoProveedor(): ?ProviderType
    {
        return $this->tipoProveedor;
    }

    /**
     * @param mixed|null $tipoProveedor
     */
    // Método consultado al no conseguir que enviara la id en lugar del nombre
    public function setTipoProveedor(?ProviderType $tipoProveedor): self
    {
        $this->tipoProveedor = $tipoProveedor;

        return $this;
    }

    public function getFechaAlta(): ?\DateTimeImmutable
    {
        return $this->fecha_alta;
    }

    public function setFechaAlta(\DateTimeImmutable $fecha_alta): self
    {
        $this->fecha_alta = $fecha_alta;

        return $this;
    }

    public function getUltimaModificacion(): ?\DateTimeInterface
    {
        return $this->ultima_modificacion;
    }

    public function setUltimaModificacion(\DateTimeInterface $ultima_modificacion): self
    {
        $this->ultima_modificacion = $ultima_modificacion;

        return $this;
    }
}

<?php
/**
 * Created by PhpStorm.
 * User: Ashura
 * Date: 11.11.15
 * Time: 07:07
 */

namespace AppBundle\Entity;


use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Class Genre
 *
 * @ORM\Entity()
 * @ORM\Table(name="genre")
 *
 * @package AppBundle\Entity
 */
class Genre
{
    /**
     * @var int
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id()
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     * @ORM\Column(name="name", type="string", length=45)
     */
    protected $name;

    /**
     * @var Event
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\Event", mappedBy="genre")
     */
    private $events;

    public function __construct()
    {
        $this->events = new ArrayCollection();
    }

    /**
     * @return int
     */
    public function getId()
    {

        return $this->id;
    }

    /**
     * @return string
     */
    public function getName()
    {

        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * @return Event
     */
    public function getEvents()
    {

        return $this->events;
    }

    /**
     * @param Event $events
     */
    public function setEvents($events)
    {
        $this->events = $events;
    }

    /**
     * Implemented for use in template
     *
     * @return string
     */
    function __toString()
    {
        return $this->name;
    }
}
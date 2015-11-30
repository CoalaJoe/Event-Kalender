<?php
/**
 * Created by PhpStorm.
 * User: Ashura
 * Date: 11.11.15
 * Time: 07:10
 */

namespace AppBundle\Entity;


use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Class PriceClass
 *
 * @ORM\Entity()
 * @ORM\Table(name="preisgruppe")
 *
 * @package AppBundle\Entity
 */
class PriceClass
{
    /**
     * @var int
     * @ORM\Column(name="ID", type="integer")
     * @ORM\Id()
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     * @ORM\Column(name="name", type="string", length=20)
     */
    protected $name;

    /**
     * @var string
     * @ORM\Column(name="preis", type="string", length=20)
     */
    protected $price;

    /**
     * @var Event
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Event", mappedBy="priceClasses")
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
     * Implemented for use in template
     *
     * @return string
     */
    function __toString()
    {
        return $this->name." ($this->price)";
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
     * @return string
     */
    public function getPrice()
    {

        return $this->price;
    }

    /**
     * @param string $price
     */
    public function setPrice($price)
    {
        $this->price = $price;
    }

    /**
     * @param Event $event
     */
    public function addEvent(Event $event)
    {
        $this->events[] = $event;
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
}
<?php
/**
 * Created by PhpStorm.
 * User: Ashura
 * Date: 10.11.15
 * Time: 18:56
 */

namespace AppBundle\Entity;

use AppBundle\Validator\Constraints\HasNoDateOverlap;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Class Event
 *
 * @ORM\Entity()
 * @ORM\Table(name="veranstaltung")
 * @ORM\HasLifecycleCallbacks
 * @HasNoDateOverlap()
 *
 * @package AppBundle\Entity
 */
class Event
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
     * @ORM\Column(name="name", type="string", length=100)
     */
    protected $name;

    /**
     * @var string
     * @ORM\Column(name="besetzung", type="string", nullable=true)
     */
    protected $cast;

    /**
     * @var string
     * @ORM\Column(name="beschreibung", type="text")
     */
    protected $description;

    /**
     * @var \DateTime
     * @ORM\Column(name="termin", type="datetime")
     */
    protected $date;

    /**
     * @var int
     * @ORM\Column(name="dauer", type="smallint")
     */
    protected $duration;

    /**
     * @var string
     * @Assert\NotNull()
     * @ORM\Column(name="bild", type="string", length=100)
     */
    protected $image;

    /**
     * @var string
     * @ORM\Column(name="bildbeschreibung", type="string")
     */
    protected $imageDescription;

    /**
     * @var string
     * @ORM\Column(name="link", type="string", length=100, nullable=true)
     */
    protected $link;

    /**
     * @var string
     * @ORM\Column(name="linkbeschreibung", type="string", nullable=true)
     */
    protected $linkDescription;

    /**
     * @var Genre
     * @Assert\NotNull()
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Genre", inversedBy="events")
     * @ORM\JoinColumn(name="fk_genre_id", referencedColumnName="id", nullable=true)
     */
    private $genre;

    /**
     * @Assert\File(maxSize="6000000")
     *
     * @var UploadedFile
     */
    private $file;

    private $tmp;

    /**
     * @var PriceClass
     * @Assert\NotNull()
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\PriceClass", inversedBy="events")
     * @ORM\JoinTable(
     *     name="veranstaltung_hat_preisgruppe", joinColumns={
     *          @ORM\JoinColumn("fk_veranstaltung_id", referencedColumnName="id")
     *     },inverseJoinColumns={
     *          @ORM\JoinColumn("fk_preisgruppe_id", referencedColumnName="ID")
     *     }
     *
     * )
     */
    private $priceClasses;

    /**
     * Event constructor.
     */
    public function __construct()
    {
        $this->priceClasses = new ArrayCollection();
    }

    /**
     * @return null|string
     */
    public function getWebPath()
    {
        return null === $this->image ? null : $this->getUploadDir().'/'.$this->image;
    }

    /**
     * @return string
     */
    protected function getUploadDir()
    {
        // get rid of the __DIR__ so it doesn't screw up
        // when displaying uploaded doc/image in the view.
        return 'uploads/documents';
    }

    /**
     * @ORM\PrePersist()
     * @ORM\PreUpdate()
     */
    public function preUpload()
    {
        if (null !== $this->getFile()){
            $filename    = sha1(uniqid(mt_rand(), true));
            $this->image = $filename.'.'.$this->getFile()->guessExtension();
        }
    }

    /**
     * @return UploadedFile
     */
    public function getFile()
    {
        return $this->file;
    }

    /**
     * @param UploadedFile $file
     */
    public function setFile(UploadedFile $file)
    {
        $this->file = $file;

        if (isset($this->image)){
            $this->tmp   = $this->image;
            $this->image = null;
        } else{
            $this->image = 'initial';
        }
    }

    /**
     * @ORM\PostPersist()
     * @ORM\PostUpdate()
     */
    public function upload()
    {
        if (null === $this->getFile()){
            return;
        }

        $this->getFile()->move($this->getUploadRootDir(), $this->image);

        if (isset($this->tmp)){
            unlink($this->getUploadRootDir().'/'.$this->tmp);
            $this->tmp = null;
        }

        $this->file = null;
    }

    /**
     * @return string
     */
    protected function getUploadRootDir()
    {
        // the absolute directory path where uploaded
        // documents should be saved
        return __DIR__.'/../../../web/'.$this->getUploadDir();
    }

    /**
     * @ORM\PostRemove()
     */
    public function removeUpload()
    {
        $file = $this->getAbsolutePath();
        if ($file && file_exists($file)){
            unlink($file);
        }
    }

    /**
     * @return null|string
     */
    public function getAbsolutePath()
    {
        return null === $this->image ? null : $this->getUploadRootDir().'/'.$this->image;
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
    function __toString()
    {
        return "($this->id) ".$this->name;
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
    public function getCast()
    {

        return $this->cast;
    }

    /**
     * @param string $cast
     */
    public function setCast($cast)
    {
        $this->cast = $cast;
    }

    /**
     * @return string
     */
    public function getDescription()
    {

        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * @param \DateTime $date
     */
    public function setDate($date)
    {
        $this->date = $date;
    }

    /**
     * @return int
     */
    public function getDuration()
    {

        return $this->duration;
    }

    /**
     * @param int $duration
     */
    public function setDuration($duration)
    {
        $this->duration = $duration;
    }

    /**
     * @return string
     */
    public function getImage()
    {

        return $this->image;
    }

    /**
     * @param string $image
     */
    public function setImage($image)
    {
        $this->image = $image;
    }

    /**
     * @return string
     */
    public function getImageDescription()
    {

        return $this->imageDescription;
    }

    /**
     * @param string $imageDescription
     */
    public function setImageDescription($imageDescription)
    {
        $this->imageDescription = $imageDescription;
    }

    /**
     * @return string
     */
    public function getLink()
    {

        return $this->link;
    }

    /**
     * @param string $link
     */
    public function setLink($link)
    {
        $link       = (preg_match('/^https?:\/\//', $link) === 1) ? $link : 'http://'.$link; // Small link normalization
        $this->link = $link;
    }

    /**
     * @return string
     */
    public function getLinkDescription()
    {

        return $this->linkDescription;
    }

    /**
     * @param string $linkDescription
     */
    public function setLinkDescription($linkDescription)
    {
        $this->linkDescription = $linkDescription;
    }

    /**
     * @return Genre
     */
    public function getGenre()
    {

        return $this->genre;
    }

    /**
     * @param Genre $genre
     */
    public function setGenre($genre)
    {
        $this->genre = $genre;
    }

    /**
     * @return PriceClass
     */
    public function getPriceClasses()
    {
        return $this->priceClasses;
    }

    /**
     * @param PriceClass $priceClasses
     */
    public function setPriceClasses($priceClasses)
    {
        $this->priceClasses = $priceClasses;
    }

    /**
     * @param PriceClass $priceClass
     */
    public function addPriceClass(PriceClass $priceClass)
    {
        $priceClass->addEvent($this);
        $this->priceClasses[] = $priceClass;
    }
}
<?php
/**
 * Created by PhpStorm.
 * User: Ashura
 * Date: 10.11.15
 * Time: 18:49
 */

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * Class User
 *
 * @ORM\Entity()
 * @ORM\Table(name="benutzer")
 *
 * @package AppBundle\Entity
 */
class User implements UserInterface, \Serializable
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
     * @ORM\Column(name="benutzername", type="string", length=45)
     */
    protected $username;

    /**
     * @var string
     * @ORM\Column(name="passwort", type="string")
     */
    protected $password;

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
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * @param string $username
     */
    public function setUsername($username)
    {
        $this->username = $username;
    }

    /**
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password = $password;
    }

    /**
     * String representation of object
     *
     * @link  http://php.net/manual/en/serializable.serialize.php
     * @return string the string representation of the object or null
     * @since 5.1.0
     */
    public function serialize()
    {
        return serialize(array(
            $this->id,
            $this->username,
            $this->password
        ));
    }

    /**
     * Constructs the object
     *
     * @link  http://php.net/manual/en/serializable.unserialize.php
     *
     * @param string $serialized <p>
     *                           The string representation of the object.
     *                           </p>
     *
     * @return void
     * @since 5.1.0
     */
    public function unserialize($serialized)
    {
        list(
            $this->id,
            $this->username,
            $this->password
        ) = unserialize($serialized);
    }

    /**
     * Returns roles of the user. Roles should be defined in the security.yml
     *
     * @return array
     */
    public function getRoles()
    {
        return array('ROLE_USER');
    }

    /**
     * Get password salt. I am using bcrypt so this value can be null.
     *
     * @return null
     */
    public function getSalt()
    {
        return null;
    }

    /**
     * Method to ensure privacy. When storing critical data on the database, this is a must for inactive users.
     *
     * @return null
     */
    public function eraseCredentials()
    {
        return null;
    }

}
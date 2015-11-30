<?php
/**
 * Created by PhpStorm.
 * User: Ashura
 * Date: 19.11.15
 * Time: 16:11
 */

namespace AppBundle\Form\Model;


use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Security\Core\Validator\Constraints as SecurityAssert;

/**
 * Class ChangePassword. This model is for storing and validating user input.
 *
 * @package AppBundle\Form\Model
 */
class ChangePassword
{
    /**
     * @SecurityAssert\UserPassword()
     * @Assert\NotBlank()
     *
     * @var string
     */
    protected $oldPassword;

    /**
     * @Assert\NotBlank()
     *
     * @var string
     */
    protected $newPassword;

    /**
     * @return string
     */
    public function getNewPassword()
    {
        return $this->newPassword;
    }

    /**
     * @param string $newPassword
     */
    public function setNewPassword($newPassword)
    {
        $this->newPassword = $newPassword;
    }

    /**
     * @return string
     */
    public function getOldPassword()
    {
        return $this->oldPassword;
    }

    /**
     * @param string $oldPassword
     */
    public function setOldPassword($oldPassword)
    {
        $this->oldPassword = $oldPassword;
    }
}
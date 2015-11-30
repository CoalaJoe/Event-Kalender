<?php
/**
 * Created by PhpStorm.
 * User: Ashura
 * Date: 17.11.15
 * Time: 06:27
 */

namespace AppBundle\DataFixtures\ORM;


use AppBundle\Entity\User;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\Security\Core\Encoder\PasswordEncoderInterface;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Class LoadUserData
 *
 * @package AppBundle\DataFixtures\ORM
 */
class LoadUserData extends AbstractFixture implements ContainerAwareInterface
{
    /**
     * @var ContainerInterface
     */
    private $container;

    /**
     * Loads predefined users into database.
     *
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {
        $factory = $this->container->get('security.encoder_factory');

        /** @var PasswordEncoderInterface $encoder */
        $encoder = $factory->getEncoder(new User());

        $admin = new User();
        $admin->setUsername('admin');
        $admin->setPassword($encoder->encodePassword('admin', $admin->getSalt()));

        // Persists object
        $manager->persist($admin);
        // Generates SQL and executes it on server
        $manager->flush();
    }

    /**
     * Injects DependencyInjection container into DataFixtures.
     *
     * @param ContainerInterface|null $container
     */
    public function setContainer(ContainerInterface $container = null)
    {
        $this->container = $container;
    }
}
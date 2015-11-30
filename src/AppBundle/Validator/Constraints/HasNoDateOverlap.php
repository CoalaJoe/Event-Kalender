<?php
/**
 * Created by PhpStorm.
 * User: Ashura
 * Date: 25.11.15
 * Time: 07:51
 */

namespace AppBundle\Validator\Constraints;

use Symfony\Component\Validator\Constraint;

/**
 * Class HasNoDateOverlap
 *
 * @Annotation
 *
 * @package AppBundle\Validator\Constraints
 */
class HasNoDateOverlap extends Constraint
{
    /**
     * Error message if the constraint generates a violation.
     *
     * @var string
     */
    public $message = "Es können nicht 2 oder mehr Veranstaltungen zur gleichen Zeit statfinden.";

    /**
     * Returns service string of it's validator.
     *
     * @return string
     */
    public function validatedBy()
    {
        return 'date_overlap_validator';
    }

    /**
     * Defines it as a class constraint.
     *
     * @return string
     */
    public function getTargets()
    {
        return self::CLASS_CONSTRAINT;
    }
}
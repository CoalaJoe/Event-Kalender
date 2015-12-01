Event-Kalender
==============

A Symfony project created on November 10, 2015, 10:00 am.

# Installation

* Navigate into my project: `cd Event-Kalender`
* Install vendors (install composer if not installed): `composer install`
* Check for symfony compatability: `php app/check.php`
* Run PHP build-in server: `php app/console server:run 127.0.0.1:12345`
* Load admin-user into database(will erase existing data in database): `php app/console doctrine:fixtures:load`
* For productive testing use domain.tld/app.php/
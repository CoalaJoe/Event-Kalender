<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Class UsabilityController
 *
 * @package AppBundle\Controller
 */
class UsabilityController extends Controller
{
    /**
     * This method ensures to find the typed-in url even when it ends with a slash.
     *
     * @param Request $request
     *
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function removeTrailingSlashAction(Request $request)
    {
        $pathInfo   = $request->getPathInfo();
        $requestUri = $request->getRequestUri();

        $url = str_replace($pathInfo, rtrim($pathInfo, ' /'), $requestUri);

        // Redirect to route without trailing slash
        return $this->redirect($url, 301);
    }

    /**
     * Handles 404-Errors
     *
     * @param Request $request
     *
     * @return array
     */
    public function missingHandlerAction(Request $request)
    {
        // Gets Template from app/Resources becaus I overwrite the default Twig templates.
        return new Response($this->renderView('@Twig/Exception/error404.html.twig', array()), 404);
    }

}

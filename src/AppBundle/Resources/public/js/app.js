/**
 * @author Dominik Müller
 * @since 10.11.2015
 */

"use strict";

$('[data-toggle="tooltip"]').tooltip(); // Enables Bootstrap tooltips

var ready     = true;
var bttButton = false;
var $main     = $('main');
var image = document.getElementById('appbundle_event_file');

// Set interval for optimal scroll event
setInterval(function(){
    ready = true;
}, 16);


$(document).ready(function(){
    checkForBackToTop();

    // Functionality for BackToTop-Button
    $main.on('click', '#bttButton', function(){
        scrollTo(0, 0);
        $(this).fadeOut(500, function(){
            $(this).remove();
        });
        bttButton = false;
    });

    // Made with pure JavaScript because of performance issues.
    window.addEventListener('scroll', function(){
        if (ready){
            checkForBackToTop();
        }
    });

    if (image !== null){
        image.required = false; // Removes required attr from image on event
    }
});

// Check for scroll position
function checkForBackToTop(){
    var isScrolledDown = window.innerHeight / 2 < pageYOffset;
    if (!bttButton && isScrolledDown){
        $('main').children('.container').append('<div id="bttButton" class="btn btn-default" style="display: none;"><span class="glyphicon glyphicon-arrow-up"></span></div>');
        $('#bttButton').fadeIn();
        bttButton = true;
    } else if (bttButton && !isScrolledDown){
        $('#bttButton').remove();
        bttButton = false;
    }
}
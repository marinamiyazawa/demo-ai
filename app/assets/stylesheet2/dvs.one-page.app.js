/*  
Theme Name: Visio - Responsive Website Template     
Theme URI: http://preview.devisio.ro/visio-v1.2/ 
Description: Visio - Responsive Website Template is a responsive website template based on the well known Bootstrap framework. Easy to work with, easy to customize and infinite solutions that can be implemented in your project are just a few attributes that recommend Visio to be one of the most complete template.
Author: Devisio
Author URI: http://www.devisio.ro
Version: 1.2   
File version: 1.0                        
License URI: http://wrapbootstrap.com                  
*/

$(document).ready(function () {
    var Scroll = function  () {
        $('html, body').stop(true, true).animate({scrollTop: $(this.hash).offset().top - navHeight + 1}, 600);
        return false;
    };
    $winWidth = $(window).width()
    nav = $(".navbar-main");
    if($winWidth > 767){
        nav.stick_in_parent({
            'parent': '.body-wrap',
            'recalc_every': 1
        });      
        navHeight = $(".navbar-main").height();
        $('.navbar-nav li a').on('click', function  () {
            $('html, body').stop(true, true).animate({scrollTop: $(this.hash).offset().top - navHeight + 1}, 600);
            return false;
        });
    }
})

$(window).bind('scroll resize', function() {
    $winWidth = $(window).width()
    if($winWidth > 767){
        var nav = $(".navbar-main");
        var currentSection = null;
        $('[data-target]').each(function(){
            var element = $(this).attr('id');   
            if ($('#'+element).is('*')){
                if($(window).scrollTop() >= $('#'+element).offset().top - nav.height())
                {
                    currentSection = element;
                }
            }
        });
        $('.navbar-nav li').removeClass('active').find('a[href="#'+currentSection+'"]').parent().addClass('active');
    }
});

$(window).load(function (argument) {  
    // Fancybox - default loading
    $(".theater").fancybox({
        helpers: {
            overlay: {
              locked: false
            }
        }
    });
    // Fancybox - load content in iframe 
    $(".ext-source").fancybox({
        'transitionIn'      : 'none',
        'transitionOut'     : 'none',
        'autoScale'         : false,
        'type'              : 'iframe',
        'width'             : '50%',
        'height'            : '60%',
        'scrolling'         : 'no'
    });
})
// Bootstrap Carousel and Animate.css

(function($) {

	// Function to animate slider captions 
	function doAnimations(elems) {
		//Cache the animationend event in a variable
		var animEndEv = 'webkitAnimationEnd animationend';
		
		elems.each(function () {
			var $this = $(this),
				$animationType = $this.data('animation');
			$this.addClass($animationType).one(animEndEv, function () {
				$this.removeClass($animationType);
			});
		});
	}
	
	// Variables on page load 
	var $myCarousel = $('.carousel-animated'),
		$firstAnimatingElems = $myCarousel.find('.item:first').find("[data-animation ^= 'animated']");
		
	// Initialize carousel 
	$myCarousel.carousel();
	
	// Animate captions in first slide on page load 
	doAnimations($firstAnimatingElems);
	
	// Pause carousel  
	$myCarousel.carousel('pause');
	
	// Other slides to be animated on carousel slide event 
	$myCarousel.on('slide.bs.carousel', function (e) {
		var $animatingElems = $(e.relatedTarget).find("[data-animation ^= 'animated']");
		doAnimations($animatingElems);
	});  
	
	// Function to hide the navigation if there is only one slide available
	function hideCarouselNav(){
		var carouselItems = $myCarousel.find('.item').length;
		
		if(carouselItems == 1){
			$('.carousel-control').hide();
		}
	}

	// Call hideCarouselNav function
	hideCarouselNav();

	//
	function resizeCarouselObjectsDiv(){
		var newHeight = $('.objects').find('img').height();
		$('.objects').css({'height': newHeight+'px'});
	}

	resizeCarouselObjectsDiv()

	// Resize event
	$(window).on('resize', function() {
	    resizeCarouselObjectsDiv();
	});
	
})(jQuery);
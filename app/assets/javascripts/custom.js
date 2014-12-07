/*
---------------------------------------------------
Made with love by ThemeBang | http://themebang.com
---------------------------------------------------
1) CONTACT FORM
2) HOME SECTION HEIGHT
3) CAROUSELS
4) BOOTSTRAP 3 LIGHTBOX
5) SKROLLR
6) IE 10 FIX
----------------------------
7) PAGE LOADER
8) SMOOTH SCROLL ON ANCHORS
9) RESPONSIVE VIDEOS
10) COLLAPSE MENU ON CLICK
11) HREF # FIX FOR DEMO
----------------------------
*/

$(document).ready(function() {
	'use strict';

/*-----------------------------------------------------------------------------------*/
/*  1) CONTACT FORM
/*-----------------------------------------------------------------------------------*/

	$('.flowuplabels').FlowupLabels({
		feature_onInitLoad: false, 
		class_focused: 'focused',
		class_populated: 'populated' 
	});

	var options = {
		target: '.message .alert',
		beforeSubmit: showRequest,
		success: showResponse
	};

	$('#contactForm').ajaxForm(options);
	function showRequest(formData, jqForm, options) {
		var queryString = $.param(formData);
			return true;
		}
	function showResponse(responseText, statusText) {
		}

/*-----------------------------------------------------------------------------------*/
/*  2) HOME SECTION HEIGHT
/*-----------------------------------------------------------------------------------*/

	$(function(){
		$('#home .item').css({'height':($(window).height())+'px'});
	});

/*-----------------------------------------------------------------------------------*/
/*  3) CAROUSELS
/*-----------------------------------------------------------------------------------*/

	$('#carousel_fade_home').carousel({
		interval: 2500,
		pause: "false"
	})

	$('#carousel-1 #carousel-2 #carousel-3').carousel({
		interval: false
	})

/*-----------------------------------------------------------------------------------*/
/*  4) BOOTSTRAP 3 LIGHTBOX
/*-----------------------------------------------------------------------------------*/

	$(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
		event.preventDefault();
		$(this).ekkoLightbox();
	});

/*-----------------------------------------------------------------------------------*/
/*  5) SKROLLR
/*-----------------------------------------------------------------------------------*/

	imagesLoaded(document.body, function(){
		if ($('.no-touch').length) {
			skrollr.init({
				smoothScrolling: false,
				forceHeight: false
			});
		}
	});

/*-----------------------------------------------------------------------------------*/
/*  6) IE 10 FIX
/*-----------------------------------------------------------------------------------*/

	if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
		var msViewportStyle = document.createElement("style")
		msViewportStyle.appendChild(
			document.createTextNode(
				"@-ms-viewport{width:auto!important}"
			)
		)
		document.getElementsByTagName("head")[0].appendChild(msViewportStyle)
	}

});

/*-----------------------------------------------------------------------------------*/

$(window).load(function() {
	'use strict';

/*-----------------------------------------------------------------------------------*/
/*  7) PAGE LOADER
/*-----------------------------------------------------------------------------------*/

	$('.load2').fadeOut('fast');
	$('.load').delay(0).fadeOut('fast');

/*-----------------------------------------------------------------------------------*/
/*  8) SMOOTH SCROLL ON ANCHORS
/*-----------------------------------------------------------------------------------*/

	$.localScroll.hash();
	$('#more, .hidden-xs, .nav, .navbar-header, #footer').localScroll({
		target: 'body',
		queue: true,
		duration: 1000,
		hash: false,
		offset: -73,
		easing: 'easeInOutExpo'
	});

/*-----------------------------------------------------------------------------------*/
/*  9) RESPONSIVE VIDEOS
/*-----------------------------------------------------------------------------------*/

	$('.fit-video').fitVids();

/*-----------------------------------------------------------------------------------*/
/*  10) COLLAPSE MENU ON CLICK
/*-----------------------------------------------------------------------------------*/

	if ($('.navbar-toggle:visible').length) {
		$('.navbar a').click(function () { $(".navbar-collapse").collapse("hide") });
	}

/*-----------------------------------------------------------------------------------*/
/*  11) HREF # FIX FOR DEMO
/*-----------------------------------------------------------------------------------*/

	$('a[href="#"]').click(function() {
		return false;
	});

});
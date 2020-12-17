(function ($) {
	
	"use strict";

	// Window Resize Mobile Menu Fix
	mobileNav();


	// Scroll animation init
	window.sr = new scrollReveal();
	

	// Menu Dropdown Toggle
	if($('.menu-trigger').length){
		$(".menu-trigger").on('click', function() {	
			$(this).toggleClass('active');
			$('.header-area .nav').slideToggle(200);
		});
	}


	// Menu elevator animation
	$('a[href*=\\#]:not([href=\\#])').on('click', function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			if (target.length) {
				var width = $(window).width();
				if(width < 991) {
					$('.menu-trigger').removeClass('active');
					$('.header-area .nav').slideUp(200);	
				}				
				$('html,body').animate({
					scrollTop: (target.offset().top) - 130
				}, 700);
				return false;
			}
		}
	});

$(document).ready(function () {
	$(document).on("scroll", onScroll);
	
	//smoothscroll
	$('a[href^="#"]').on('click', function (e) {
		e.preventDefault();
		$(document).off("scroll");
		
		$('a').each(function () {
			$(this).removeClass('active');
		})
		$(this).addClass('active');
		
		var target = this.hash,
		menu = target;
		var target = $(this.hash);
		$('html, body').stop().animate({
			scrollTop: (target.offset().top) - 130
		}, 500, 'swing', function () {
			window.location.hash = target;
			$(document).on("scroll", onScroll);
		});
	});
});

	function onScroll(event){
	    var scrollPos = $(document).scrollTop();
	    $('.nav a').each(function () {
	        var currLink = $(this);
	        var refElement = $(currLink.attr("href"));
	        if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
	            $('.nav ul li a').removeClass("active");
	            currLink.addClass("active");
	        }
	        else{
	            currLink.removeClass("active");
	        }
	    });
	}


	if($('.home-seperator').length) {
		$('.home-seperator .left-item, .home-seperator .right-item').imgfix();
	}


	if($('.count-item').length){
		$('.count-item strong').counterUp({
			delay: 10,
			time: 1000
		});
	}


	$(window).on('load', function() {
		if($('.cover').length){
			$('.cover').parallax({
				imageSrc: $('.cover').data('image'),
				zIndex: '1'
			});
		}

		$("#preloader").animate({
			'opacity': '0'
		}, 1500, function(){
			setTimeout(function(){
				$("#preloader").css("visibility", "hidden").fadeOut();
			}, 1300);
		});
	});


	$(window).on('resize', function() {
		mobileNav();
	});


	function mobileNav() {
		var width = $(window).width();
		$('.submenu').on('click', function() {
			if(width < 992) {
				$('.submenu ul').removeClass('active');
				$(this).find('ul').toggleClass('active');
			}
		});
	}


})(window.jQuery);

$(document).ready(function () {
	//Home images carousel
	$(".carousel-bg").slick({
		dots: false,
		infinite: true,
		speed: 7000,
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 100
	});
});

$(document).ready(function () {
	//Product images carousel
	$('.product-carousel').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: true,
		dots: true,
	});
});

$(window).scroll(function(){
	var boxje = $("#boxje").offset().top;
	if (boxje>0) {
		$("#boxje").css({"display":"none"});
	} else {
		$("#boxje").css({"display":"block"});
		
	}
});

window.onscroll = function(){
	var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
	var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
	var scrolled = (winScroll / height) * 100;
	document.getElementById("progressbar").style.height = scrolled + "%";}
	const buttons = document.querySelectorAll("li");
const section = document.querySelectorAll(".thumb");
let values = "All"; 
filter(values);

function filter(values){
section.forEach(show =>{
show.style.display = "none";
if(show.getAttribute("data-id") === values || values === "All")
{
	show.style.display = "block";
}
});
}

buttons.forEach(item => 
{
item.addEventListener('click', () => 
{
buttons.forEach(item =>
	{
	item.className = ""
	});
	item.className= "active";
	
	let values = item.textContent;
	filter(values);
});
});
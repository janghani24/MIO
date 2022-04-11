$(document).ready(function() {

		$('.subMenu').hide();

		$('#topMenu').mouseover(function() {
			$('.subMenu').slideDown();
			$('.subMenu').mouseover(function() {
				$('.subMenu').stop();

			});

		});

		$('.subMenu').mouseleave(function() {
			$('.subMenu').slideUp();
		});

	});
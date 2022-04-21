$(function () {
	
	$('#star a').click(function(){ 
		
		 $(this).parent().children("a").removeClass("on");    
		 $(this).addClass("on").prevAll("a").addClass("on");
		 console.log($(this).attr("value"));
		 let rate = $(this).attr("value");
		  document.productReply.r_rate.value=rate;
		  return false;
		});
	
	let rate;
	$('.starRate').each(function (i,s) {
		rate = $(this).attr('value');
		let starResult = $('<span class="starRateResult"></span>')
		
		if(rate == 1){
			 $(this).append(starResult)
			 starResult.text('★☆☆☆☆')
		}else if(rate == 2){
			 $(this).append(starResult)
			 starResult.text('★★☆☆☆')
		}else if(rate == 3){
			 $(this).append(starResult)
			 starResult.text('★★★☆☆')
		}else if(rate == 4){
			 $(this).append(starResult)
			 starResult.text('★★★★☆')
		}else if(rate == 5){
			 $(this).append(starResult)
			 starResult.text('★★★★★')
		}
	});
});

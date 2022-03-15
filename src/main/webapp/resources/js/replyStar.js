$(function () {
	
	$('#star a').click(function(){ 
		
		 $(this).parent().children("a").removeClass("on");    
		 $(this).addClass("on").prevAll("a").addClass("on");
		 console.log($(this).attr("value"));
		 let rate = $(this).attr("value");
		  document.productReply.r_rate.value=rate;
		  return false;
		});
	
	let aa;
	$('.starR1').each(function (i,s) {
		aa = $(this).attr('value');
		let aaa = $('<span class="starR22"></span>')
		
		console.log(aa);
		if(aa == 1){
			 $(this).append(aaa)
			 aaa.text('★☆☆☆☆')
		}else if(aa == 2){
			 $(this).append(aaa)
			 aaa.text('★★☆☆☆')
		}else if(aa == 3){
			 $(this).append(aaa)
			 aaa.text('★★★☆☆')
		}else if(aa == 4){
			 $(this).append(aaa)
			 aaa.text('★★★★☆')
		}else if(aa == 5){
			 $(this).append(aaa)
			 aaa.text('★★★★★')
			
		}
		
	});
	
	
	
});
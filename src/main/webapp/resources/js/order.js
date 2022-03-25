function productorder(no, id) {

	let ok = confirm("구매?")
	if (ok) {
		let cnt = $("#amount").val()
		location.href = "product.order?p_num=" + no + "&id=" + id +"&cnt=" +cnt;

		

	
		}


}


function testorder() {
	$("#check_module").click(function () {
		
		 
		let id = $("#id").val()
		let productname = $("#productname").val()
		let price = $("#price").val()
		let amount = $("#amount").val()
		let addr3 = $("#jm_addr3Input").val()	//주소번호
		let addr1 = $("#jm_addr1Input").val()	//실제주소
		let p_num = $("#p_num").val()
		let price2 = price * amount;
		let email = "test@naver.com";	//나중에 진짜이메일넣기
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp43556283'); 
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: productname,
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: price2,
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: id,
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			
			buyer_email: email,
			buyer_addr: addr1,
	       
			buyer_postcode: addr3,
			}, function (rsp) {
			
				  if ( rsp.success ) {
		                
			//		 alert("완료 -> imp_uid : "+rsp.imp_uid+"name: "+rsp.name+"price:"+rsp.amount)
		               console.log(rsp);
		                //성공시 이동할 페이지 가져가야할꺼 rsp 전부+ pnum
					 
	  location.href="product.orderbuy?p_num="+p_num+"&productname="+productname+
	  "&price="+price+"&orderid="+rsp.merchant_uid+"&amount="+amount+
	  "&id="+rsp.buyer_name+"&email="+rsp.buyer_email+"&addr1="+rsp.buyer_addr+"&addr2="+rsp.buyer_postcode;
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg)
			}
			
		});
	});
		
}

function testorder2() {
	$("#check_module2").click(function () {
		
		 
		let id = $("#id").val()
		let productname = $("#productname").val()
		let price = $("#price").val()
		let amount = $("#amount").val()
		let addr3 = $("#jm_addr3Input").val()	//주소번호
		let addr1 = $("#jm_addr1Input").val()	//실제주소
	
		let email = "test@naver.com";	//나중에 진짜이메일넣기
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp43556283'); 
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: productname,
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: price,
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: id,
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			
			buyer_email: email,
			buyer_addr: addr1,
	       
			buyer_postcode: addr3,
			}, function (rsp) {
			
				  if ( rsp.success ) {
		  
					 
		               location.href="product.cartorderbuy?productname="+productname+
	  "&price="+price+"&orderid="+rsp.merchant_uid+"&amount="+amount+
	  "&id="+rsp.buyer_name+"&email="+rsp.buyer_email+"&addr1="+rsp.buyer_addr+"&addr2="+rsp.buyer_postcode;
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg)
			}
			
		});
	});
		
}
$(function() {
	testorder();
	testorder2();
	
});


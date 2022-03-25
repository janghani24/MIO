function productorder(no, id) {

	let ok = confirm("구매하시겠습니까?")
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
		
	

		if (addr3=="") {
			alert("주소를 입력해주세요.");
			return false;
		}
			
		
		
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp43556283'); 
			IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
		
			name: productname,
		
			amount: price2,
			
			buyer_name: id,
			
			buyer_email: email,
			buyer_addr: addr1,
	       
			buyer_postcode: addr3,
			}, function (rsp) {
			
				  if ( rsp.success ) {

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
		
	//	var addr1Input = document.cart.a_addr3;
	
		 
		let id = $("#id").val()
		let productname = $("#productname").val()
		let price = $("#price").val()
		let amount = $("#amount").val()
		let addr3 = $("#jm_addr3Input").val()	//주소번호
		let addr1 = $("#jm_addr1Input").val()	//실제주소
		let email = "test@naver.com";	//나중에 진짜이메일넣기
		
		
		if (addr3=="") {
			alert("주소를 입력해주세요.");
			return false;
		}
			
		
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp43556283'); 
	
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
		
			name: productname,
		
			amount: price,
		
			buyer_name: id,
		
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


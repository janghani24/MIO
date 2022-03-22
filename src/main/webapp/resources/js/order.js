function productorder(no, id) {

	let ok = confirm("찜할래요?")
	if (ok) {
		location.href = "product.zzim?p_num=" + no + "&id=" + id;

		alert("찜하기 완료")

		let ok2 = confirm("찜목록으로 이동할래요?aa")
		if (ok2) {
			window.location.href='account.Wishlist';
			return;
		}else{
			window.location.reload();
		}

		}


}


function testorder() {
	$("#check_module").click(function () {
		
		alert("결제시작")
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
			name: '주문명 : 테스트',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: 100,
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: '이름',
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_addr: "서울특별시 강남구 신사동",
	       
			buyer_postcode: '123-456',
			}, function (rsp) {
			
				  if ( rsp.success ) {
		                
					 alert("완료 -> imp_uid : "+rsp.imp_uid+"name: "+rsp.name+"price:"+rsp.amount)
		                
		                //성공시 이동할 페이지
		             //   location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
		                window.location.href="product.orderbuy?name="+rsp.name+"&price="+rsp.amount;
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			
		});
	});
		
}

$(function() {
	testorder();
	
});


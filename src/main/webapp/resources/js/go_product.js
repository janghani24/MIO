// 회원가입 창으로


function zzim(no, id) {
	
	
	let ok = confirm("찜할래요?")
	if (ok) {
		location.href = "product.zzim?p_num=" + no + "&id=" + id;
		
		alert("찜하기 완료")
		
		let ok = confirm("찜목록으로 이동할래요?")
		if(ok){
			location.href = "account.Wishlist"
			
		}
		
	}
}

function deleteReply(n,p) {
	location.href = "product.reply.delete?r_no="+n+"&p_num="+p;
}

function gocart(i, p) {
	
	let amount = document.getElementById("amount").value;
	let ok = confirm("장바구니에 담으시겠습니까?")
	if (ok) {
		location.href = "product.insert.cart?c_p_num=" + p + "&c_a_id=" + i + "&c_quantity="+amount;
		
		alert("장바구니에 담겼습니다.")
		
		let ok = confirm("장바구니로 이동할래요?")
		if(ok){
			location.href = "product.go.cart"
			
		}
		
	}
}
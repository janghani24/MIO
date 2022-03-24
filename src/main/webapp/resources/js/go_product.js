
function zzim(no, id) {

	let ok = confirm("구매?")
	if (ok) {
		
		location.href="product.order?p_num=" + no + "&id=" + id;
		

		}


}

function deleteReply(n, p) {
	location.href = "product.reply.delete?r_no=" + n + "&p_num=" + p;
}

function deleteProduct(n) {
	let ok = confirm("등록된 상품을 삭제하시겠습니까?")
	if (ok) {
	location.href = "product.deleteProduct?p_num=" + n;
	}
}
function updateProduct(n,c) {
	
		location.href = "product.go.updateProduct?p_num=" + n + "&p_category1=" + c;
	
}

function goCart(i,p,price,c,photo) {
	let amount = document.getElementById("amount").value;
	let ok = confirm("장바구니에 담으시겠습니까?")
	if (ok) {
		$.ajax({
			url :'/mio/product.insert.cart?c_p_no=' + p + "&c_a_id=" + i + "&c_quantity="
				+amount+"&c_price=" + price + "&p_num="+ p +"&c_category="+ c + "&c_p_photo=" + photo,
			type:'get',
			success :alert("장바구니에 담겼습니다.")
		});
		
		let ok2 = confirm("장바구니로 이동하시겠습니까?")
		if (ok2) {
			window.location.href = "product.go.cart"

		}
	}
}
	
function deleteCart(p) {
	let ok = confirm("장바구니에서 삭제하시겠습니까?")
	if (ok) {
		location.href = "product.delete.cart?c_p_no=" + p;
			
		alert("삭제되었습니다.")
		}
}

function updateCart(p,t) {
	t = prompt("몇개로 바꿀까요?", t);
		let check = /^[0-9]+$/;
		
	if (t != null && t.length > 0 && t.length < 250 && check.test(t)) {
		location.href = "product.update.cart?c_p_no=" + p + "&c_quantity=" + t;
	}else{
		alert('숫자만 입력해주세요!');
	}
}



function zzim(no, id) {

	let ok = confirm("찜할래요?")
	if (ok) {
		location.href = "product.zzim?p_num=" + no + "&id=" + id;

		alert("찜하기 완료")

		let ok = confirm("찜목록으로 이동할래요?")
		if (ok) {
			location.href = "account.Wishlist"

		}

		  location.reload();
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

function goCart(i, p , price , c, photo) {
	let amount = document.getElementById("amount").value;
	let ok = confirm("장바구니에 담으시겠습니까?")
	if (ok) {
		location.href = "product.insert.cart?c_p_no=" + p + "&c_a_id=" + i + "&c_quantity="
		+amount+"&c_price=" + price + "&p_num="+ p +"&c_category="+ c + "&c_p_photo=" + photo;
		
		alert("장바구니에 담겼습니다.")
		
		let ok = confirm("장바구니로 이동하시겠습니까?")
		if (ok) {
			location.href = "product.go.cart"

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
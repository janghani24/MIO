// 회원가입 창으로

function zzim(no, id) {

	let ok = confirm("찜할래요?")
	if (ok) {
		location.href = "product.zzim?p_num=" + no + "&id=" + id;

		alert("찜하기 완료")

		let ok = confirm("찜목록으로 이동할래요?")
		if (ok) {
			location.href = "account.Wishlist"
<<<<<<< HEAD
				
		}
		
		location.reload();
=======

		}

>>>>>>> 326a519dc408fed1b61451e33e754faaf82b310e
	}
}

function deleteReply(n, p) {
	location.href = "product.reply.delete?r_no=" + n + "&p_num=" + p;
}

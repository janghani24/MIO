// 회원가입 창으로
function goJoin() {
	location.href = "account.join.go";
}

// 정보 창으로
function goInfo() {
	location.href = "account.info";
}

// 수정페이지로
function goUpdate() {
	location.href = "account.update.go";
}

// 등급 조정페이지로
function goGradeUpdate() {
	location.href = "account.updategrade.go";
}

//일반 회원가입 창으로
function goJoinGeneral() {
	location.href = "account.join.go.general";
}

// 판매자 회원가입 창으로
function goJoinSeller() {
	location.href = "account.join.go.seller";
}

// ID찾기 페이지로
function goSearchId() {
	location.href = "account.searchId.go";
}

// PW찾기 페이지로
function goSearchPw() {
	location.href = "account.searchPw.go";
}

// 탈퇴페이지로
function goDelete() {
		location.href = "account.delete.go";
}

// 가입 승인 페이지로
function goJoinConfirm() {
	location.href = "account.join.confirm.go";
}

// 판매자 상세 페이지로
function sellerDetail(i) {
	location.href = "account.sellerDetail?a_s_id=" + i;
}

// 판매자 가입 승인
function sellerJoin(i) {
	location.href = "account.sellerJoin.do?a_s_id=" + i;
}

//판매자 가입 거절
function sellerReject(i) {
	location.href = "account.sellerReject.do?a_s_id=" + i;
}

// 로그아웃
function logout() {
	let ok = confirm("로그아웃 하시겠습니까?")
	if (ok) {
		location.href = 'account.logout';
	}
}

//찜 한거 불러오기
function goWishlist() {
	location.href = "account.Wishlist";
}

// 찜 삭제
function deletezzim(no) {
	var ok = confirm("찜해제할래요?");
	if (ok) {
		location.href = "account.deletezzim?z_no=" + no;	
	}	
}


// 회원가입 창으로
function goJoin() {
	location.href = "account.join.go";
}

function goInfo() {
	location.href = "account.info";
}

function goUpdate() {
	location.href = "account.update.go";
}

function goGradeUpdate() {
	location.href = "account.updategrade.go";
}
function goJoinGeneral() {
	location.href = "account.join.go.general";
}
function goJoinSeller() {
	location.href = "account.join.go.seller";
}

function goSearchId() {
	location.href = "account.searchId.go";
}

function goSearchPw() {
	location.href = "account.searchPw.go";
}

function goDelete() {
		location.href = "account.delete.go";
}
function goJoinConfirm() {
	location.href = "account.join.confirm.go";
}
	
function sellerDetail(i) {
	location.href = "account.sellerDetail?a_s_id=" + i;
}
function sellerJoin(i) {
	location.href = "account.sellerJoin.do?a_s_id=" + i;
}
function sellerReject(i) {
	location.href = "account.sellerReject.do?a_s_id=" + i;
}


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

function deletezzim(no) {
	
	
	var ok = confirm("찜해제할래요?");
	if (ok) {
		location.href = "account.deletezzim?z_no=" + no;
		
	}
	
}
function deletezzim2(no, no2) {
	
	
	var ok = confirm("찜해제할래요?");
	if (ok) {
		location.href = "account.deletezzim2?z_no=" + no + "&p_num=" + no2;
		
	}
	
}

function goBack(){
	window.history.back();
}

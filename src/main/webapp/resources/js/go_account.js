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

function logout() {
	let ok = confirm("로그아웃 하시겠습니까?")
	if (ok) {
		location.href = 'account.logout';
	}
}

function goBack(){
	window.history.back();
}

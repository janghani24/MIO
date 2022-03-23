function deleteFunding(n) {
	let ok = confirm("등록된 펀딩을 삭제하시겠습니까?")
	if (ok) {
	location.href = "funding.deleteFunding?f_num=" + n;
	}
}
function updateFunding(n) {
		location.href = "funding.go.updateFunding?f_num=" + n;
	
}
function fundingGo(n) {
		var newWindow=open(n);
}
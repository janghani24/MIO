function deleteFunding(n) {
	let ok = confirm("등록된 펀딩을 삭제하시겠습니까?")
	if (ok) {
	location.href = "funding.deleteFunding?f_num=" + n;
	}
}
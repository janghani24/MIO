function communityCheck(){
	var txtInput = document.snsWriteForm.c_txt;
	if (isEmpty(txtInput)) {
		alert('내용을 입력해주세요.');
		txtInput.value="";
		txtInput.focus();
		return false;
	}
	return true;
}
function joinCheck(){
	var idInput = document.joinForm.a_id;
	var pwInput = document.joinForm.a_pw;
	var pwChkInput = document.joinForm.a_pwChk;
	var nameInput = document.joinForm.a_name;
	var addr1Input = document.joinForm.a_addr1;
	var addr2Input = document.joinForm.a_addr2;
	var addr3Input = document.joinForm.a_addr3;
	var imgInput = document.joinForm.a_img;
	var phoneInput = document.joinForm.a_phone;
	var answerInput = document.joinForm.a_answer;
	
	var idCheckOk = document.getElementById("idCheckOk").value;
	
	
	if(isEmpty(idInput)){
		alert("id를 입력해주세요.");
		idInput.value="";
		idInput.focus();
		return false;
	}else if(containsHS(idInput)){
		alert("id는 영어/숫자 조합으로 입력해주세요.");
		idInput.value="";
		idInput.focus();
		return false;
	}else if(idCheckOk == "idUncheck"){
		alert("id 중복 체크를 해주세요!");
		idInput.value="";
		idInput.focus();
		return false;
	}else if (isEmpty(pwInput) || notEquals(pwInput, pwChkInput)
			|| containsHS(pwInput)) {
		alert("비밀번호를 확인해주세요.");
		pwInput.value = "";
		pwChkInput.value = "";
		pwInput.focus();
		return false;
	}else if (isEmpty(nameInput)) {
		alert("이름을 작성해주세요.");
		nameInput.value = "";
		nameInput.focus();
		return false;
	}else if (isEmpty(addr1Input) || isEmpty(addr2Input)
			|| isEmpty(addr2Input)) {
		alert("주소를 입력해주세요.");
		addr1Input.value = "";
		addr2Input.value = "";
		addr3Input.value = "";
		addr1Input.focus();
		return false;
	}else if(isEmpty(phoneInput)||isNotNumber(phoneInput)){
		alert("휴대전화 번호를 확인해주세요.");
		phoneInput.value="";
		phoneInput.focus();
		return false;
	}else if (isEmpty(imgInput)
			|| (isNotType(imgInput, "png") && isNotType(imgInput, "gif")
					&& isNotType(imgInput, "jpg") && isNotType(imgInput,
					"bmp")&&isNotType(imgInput, "jpeg"))) {
		alert("사진을 확인해주세요.");
		return false;
	}else if(isEmpty(answerInput||!lessThan(answerInput,30))){
		alert("비밀번호 찾기 답을 확인해주세요.");
		answerInput.value="";
		answerInput.focus();
		return false;
	}
	return true;
}
function joinChecks(){
	var idInput = document.joinForm.a_s_id;
	var pwInput = document.joinForm.s_pw;
	var pwChkInput = document.joinForm.s_pwChk;
	var nameInput = document.joinForm.s_name;
	var addr1Input = document.joinForm.s_addr1;
	var addr2Input = document.joinForm.s_addr2;
	var addr3Input = document.joinForm.s_addr3;
	var imgInput = document.joinForm.s_img;
	var phoneInput = document.joinForm.s_phone;
	var answerInput = document.joinForm.s_answer;
	var introInput = document.joinForm.s_intro;
	
	var idCheckOk = document.getElementById("idCheckOk").value;
	
	
	if(isEmpty(idInput)){
		alert("id를 입력해주세요.");
		idInput.value="";
		idInput.focus();
		return false;
	}else if(containsHS(idInput)){
		alert("id는 영어/숫자 조합으로 입력해주세요.");
		idInput.value="";
		idInput.focus();
		return false;
	}else if(idCheckOk == "idUncheck"){
		alert("id 중복 체크를 해주세요!");
		idInput.value="";
		idInput.focus();
		return false;
	}else if (isEmpty(pwInput) || notEquals(pwInput, pwChkInput)
			|| containsHS(pwInput)) {
		alert("비밀번호를 확인해주세요.");
		pwInput.value = "";
		pwChkInput.value = "";
		pwInput.focus();
		return false;
	}else if (isEmpty(nameInput)) {
		alert("이름을 작성해주세요.");
		nameInput.value = "";
		nameInput.focus();
		return false;
	}else if (isEmpty(addr1Input) || isEmpty(addr2Input)
			|| isEmpty(addr2Input)) {
		alert("주소를 입력해주세요.");
		addr1Input.value = "";
		addr2Input.value = "";
		addr3Input.value = "";
		addr1Input.focus();
		return false;
	}else if(isEmpty(phoneInput)||isNotNumber(phoneInput)){
		alert("휴대전화 번호를 확인해주세요.");
		phoneInput.value="";
		phoneInput.focus();
		return false;
	}else if (isEmpty(imgInput)
			|| (isNotType(imgInput, "png") && isNotType(imgInput, "gif")
					&& isNotType(imgInput, "jpg") && isNotType(imgInput,
					"bmp")&&isNotType(imgInput, "jpeg"))) {
		alert("사진을 확인해주세요.");
		return false;
	}else if(isEmpty(answerInput||!lessThan(answerInput,30))){
		alert("비밀번호 찾기 답을 확인해주세요.");
		answerInput.value="";
		answerInput.focus();
		return false;
	}else if(isEmpty(introInput)){
		alert("소개글을 작성해주세요.");
		introInput.value="";
		introInput.focus();
		return false;
	}
	return true;
}

function updateAccountCheck(){
	var pwInput = document.updateAccountForm.jm_pw;
	var pwChkInput = document.updateAccountForm.jm_pwChk;
	var nameInput = document.updateAccountForm.jm_name;
	var addr1Input = document.updateAccountForm.jm_addr1;
	var addr2Input = document.updateAccountForm.jm_addr2;
	var addr3Input = document.updateAccountForm.jm_addr3;
	var imgInput = document.updateAccountForm.jm_photo;
	var phoneInput = document.updateAccountForm.jm_phone;
	
	if (isEmpty(pwInput) || notEquals(pwInput, pwChkInput)
			|| containsHS(pwInput)) {
		alert("비밀번호를 확인해주세요.");
		pwInput.value = "";
		pwChkInput.value = "";
		pwInput.focus();
		return false;
	}else if (isEmpty(nameInput)) {
		alert("이름을 작성해주세요.");
		nameInput.value = "";
		nameInput.focus();
		return false;
	}else if (isEmpty(addr1Input) || isEmpty(addr2Input)
			|| isEmpty(addr2Input)) {
		alert("주소를 입력해주세요.");
		addr1Input.value = "";
		addr2Input.value = "";
		addr3Input.value = "";
		addr1Input.focus();
		return false;
	}else if(isEmpty(phoneInput)||isNotNumber(phoneInput)){
		alert("휴대전화 번호를 확인해주세요.");
		phoneInput.value="";
		phoneInput.focus();
		return false;
	}else if (isEmpty(imgInput)
			|| (isNotType(imgInput, "png") && isNotType(imgInput, "gif")
					&& isNotType(imgInput, "jpg") && isNotType(imgInput,
					"bmp")&&isNotType(imgInput, "jpeg"))) {
		alert("사진을 확인해주세요.");
		return false;
	}
	return true;
	
}

function loginCheck(){
	var idInput = document.loginForm.a_id;
	var pwInput = document.loginForm.a_pw;
	
	if(isEmpty(idInput)){
		alert("id를 입력해주세요.");
		idInput.value="";
		idInput.focus();
		return false;
	}else if(isEmpty(pwInput)){
		alert("pw를 입력해주세요.");
		pwInput.value="";
		pwInput.focus();
		return false;
	}
	return true;
}

function searchIdCheck(){
	var nameInput = document.idSearchForm.a_name;
	var phoneInput = document.idSearchForm.a_phone;
	
	if (isEmpty(nameInput)) {
		alert("이름을 입력해주세요.");
		nameInput.value = "";
		nameInput.focus();
		return false;
	}else if(isEmpty(phoneInput)||isNotNumber(phoneInput)){
		alert("휴대전화 번호를 확인해주세요.");
		phoneInput.value="";
		phoneInput.focus();
		return false;
	}
	return true;
}
function searchPwCheck(){
	var idInput = document.pwSearchForm.a_id;
	var answerInput = document.pwSearchForm.a_answer;
	
	if (isEmpty(idInput)) {
		alert("ID를 입력해주세요.");
		idInput.value = "";
		idInput.focus();
		return false;
	}else if(isEmpty(answerInput||!lessThan(answerInput,30))){
		alert("비밀번호 찾기 답을 확인해주세요.");
		answerInput.value="";
		answerInput.focus();
		return false;
	}
	return true;
}
function deleteAccountCheck(){
	var idInput = document.accountDeleteForm.a_id;
	var idInput2 = document.accountDeleteForm.a_id2;
	var pwInput = document.accountDeleteForm.a_pw;
	var pwInput2 = document.accountDeleteForm.a_pw2;
	
	
	
	if (isEmpty(idInput)){
		alert("id를 입력해주세요.");
		idInput.value="";
		idInput.focus();
		return false;
	}else if(isEmpty(pwInput)){
		alert("pw를 입력해주세요.");
		pwInput.value="";
		pwInput.focus();
		return false;
	}else if(idInput.value != idInput2.value){
		alert("id를 확인해주세요.");
		idInput.value="";
		idInput.focus();
		return false;
	}else if(pwInput.value != pwInput2.value){
		alert("pw를 확인해주세요.");
		pwInput.value="";
		pwInput.focus();
		return false;
	}
	
	let ok = confirm("정말 탈퇴하시겠습니까?");
	if (ok){
		return true;
	}else{
		return false;
	}
	
	
	
	
}
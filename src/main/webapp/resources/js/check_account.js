	//id 중복체크 
function openIdCheck(){ 
	//새창 만들기 
	window.open("idCheckForm.jsp", "idCheckForm", "width=400, height=350"); 
}

function inputIdcheck(){
	document.joinForm.idCheckOk.value="idUncheck";
}

function getIdValue(){
	document.getElementById("getId").value=opener.document.joinForm.a_id.value;
}

function sendCheckValue(){
	opener.document.joinForm.idCheckOk.value="idCheck";
	opener.document.joinForm.a_id.value=document.getElementById("a_id").value;
	
	if(opener != null){
		opener.idCheckForm = null;
		self.close();
	}
}
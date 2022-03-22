function idCheck(){
	$("#join_idInput").blur(function(){
		var id_check = document.getElementById("join_idInput");
		$.ajax({
			url : '/mio/account.idCheck?a_id='+id_check.value,
			type:'get',
			success : function(data){
					console.log(data);
					console.log(id_check.value);
				if(data == 1){
					// 1은 중복
					$("#id_check").text("이미 사용중인 id입니다.");
					$("#id_check").css("color","red");
					document.getElementById("idCheckOk").value="idUncheck";
				}else{
					if(id_check.value == ""){
					$("#id_check").text("id를 입력해주세요.");
					$("#id_check").css("color","red");
					}else if(containsHS(id_check)){
						$("#id_check").text("영어/숫자만 입력해주세요.");
						$("#id_check").css("color","red");
					}else{
						$("#id_check").text("사용 가능한 ID입니다.");
						$("#id_check").css("color","green");
						document.getElementById("idCheckOk").value="idCheckOk";
					
					}
				}
				}
		});
	});
}


$(function() {
	idCheck();
});
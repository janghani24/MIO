function idCheck(){
	$("#join_idInput").blur(function(){
		var id_check = $('#join_idInput').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/account.idCheck?a_id='+id_check,
			type:'get',
			success : function(data){
					console.log(data);
				if(data == 1){
					// 1은 중복
					$("#id_check").text("이미 사용중인 id입니다.");
					$("#id_check").css("color","red");
				}else{
					if(id_check == ""){
					$("#id_check").text("id를 입력해주세요.");

					$("#id_check").css("color","red");
					}
					document.getElementById("idCheckOk").value="idCheckOk";
				}
			}
		});
	});
}

$(function() {
	idCheck();
	
});
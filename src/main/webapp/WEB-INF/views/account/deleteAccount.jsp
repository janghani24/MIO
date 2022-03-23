<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- id,pw같은지 확인, 탈퇴alert js구현필요 -->
<form action="account.delete" name="accountDeleteForm" onsubmit="return deleteAccountCheck();">
	<table id="accountDeleteTbl" border="1">
		<tr>
			<td>회원 탈퇴</td>
		</tr>
		<tr>
			<td>ID <input name="a_id">
			<input type="hidden" name="a_id2" value="${sessionScope.loginAccount.a_id}">
			</td>
		</tr>
		<tr>
			<td>PW <input name="a_pw">
			<input type="hidden" name="a_pw2" value="${sessionScope.loginAccount.a_pw}">
			</td>
		</tr>
		<tr>
			<td><button>탈퇴하기</button></td>
		</tr>
	</table>
</form>
</body>
</html>
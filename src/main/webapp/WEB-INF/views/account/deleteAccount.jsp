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
	<table id="accountDeleteTbl">
		<tr>
			<td><img src="resources/img/image/탈퇴하기.jpg"></td>
		</tr>
		<tr>
			<td align="center" id="id">ID <input name="a_id" id="idBox">
			<input type="hidden" name="a_id2" value="${sessionScope.loginAccount.a_id}">
			</td>
		</tr>
		<tr>
			<td align="center" id="pw">PW <input name="a_pw"  id="passBox">
			<input type="hidden" name="a_pw2" value="${sessionScope.loginAccount.a_pw}">
			</td>
		</tr>
		<tr>
			<td><button class="button">탈퇴하기</button></td>
		</tr>
	</table>
</form>
</body>
</html>
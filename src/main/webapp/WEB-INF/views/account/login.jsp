<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="account.login" method="post" name="loginForm"
		onsubmit="return loginCheck();">
		<table id="loginTable" >
		<tr>
		<td colspan="3"><img src="resources/img/image/login.jpg"></td>
		</tr>
			<tr>
				<td align="center" id="id">ID<input name="a_id" maxlength="15"
					autocomplete="off" id="idBox"></td>
			</tr>
			<tr>
				<td align="center" id="pw" >PW<input name="a_pw" maxlength="15"
					autocomplete="off" type="password" id="passBox">
				</td>
				<td align="center"><button id="loginButton">로그인</button>
			</tr>
			<tr>
				<td id="joinSearch" colspan="3">
					<button class="button" type="button" onclick="goJoin()">회원가입</button>
					<button class="button" type="button" onclick="goSearchId()">ID/PW찾기</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
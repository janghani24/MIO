<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/check_account.js"></script>
<title>Insert title here</title>
</head>
<body onload="getIdValue()">
			<!-- idCheck로 유효성검사 js 만들어야함 -->
<form action="account.idCheck" onsubmit="idCheck()">
	<table>
		<tr>
			<td>아이디 중복 체크</td>
		</tr>
		<tr>
			<td><input name="a_id" id="getId"><br>
				<button>중복 확인</button></td>
		</tr>
		<tr>
			<td>
				<button id="cancelBtn" onclick="window.close()">취소</button>
				<br>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
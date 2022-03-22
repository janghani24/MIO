<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="account.searchId" name="idSearchForm" onsubmit="return searchIdCheck();">
		<table>
			<tr>
				<td>ID찾기</td>
			</tr>
			<tr>
				<td>이름 <input name="a_name"></td>
			</tr>
			<tr>
				<td>핸드폰 번호 <input name="a_phone" placeholder="숫자만 입력해주세요."></td>
			</tr>
			<tr>
				<td><button>ID찾기</button>
					<button type="button" onclick="goSearchPw();">PW찾기</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
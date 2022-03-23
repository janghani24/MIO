<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="loginFailTbl" border="1">
		<tr>
			<td><h1>Login Fail</h1></td>
		<tr>
			<td><c:choose>
					<c:when test="${result eq '1'}">
						<h2>PW를 확인해주세요.</h2>
					</c:when>
					<c:when test="${result eq '2'}">
						<h2>없는 ID입니다.</h2>
					</c:when>
				</c:choose></td>
		</tr>
		<tr>
			<td>
				<button onclick="location.href='account.login.go'">로그인 화면으로</button>
				<button onclick="goSearchId()">ID/PW찾기</button>
				<button onclick="goJoin()">회원가입</button>
			</td>
		</tr>
	</table>
</body>
</html>
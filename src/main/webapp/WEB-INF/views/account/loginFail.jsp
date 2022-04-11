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
	<table id="loginFailTbl">
		<tr>
			<td><img src="resources/img/image/로그인실패.jpg"></td>
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
				<button onclick="location.href='account.login.go'" class="button">로그인 화면으로</button>
				<button onclick="goSearchId()"class="button">ID/PW찾기</button>
				<button onclick="goJoin()"class="button">회원가입</button>
			</td>
		</tr>
	</table>
</body>
</html>
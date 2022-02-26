<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/check_account.js"></script>
<script type="text/javascript" src="resources/js/go_account.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>아이디 중복 체크 결과</td>
		</tr>
		<c:choose>
			<c:when test="${result eq '0'}">
			<tr>
				<td>사용 할 수 없는 아이디 입니다.<br>
					<button onclick="goBack()">뒤로 가기</button></td>
			</tr>
			</c:when>
		<c:when test="${result eq '1'}">
		<tr>
			<td>사용 할 수 있는 아이디 입니다.<br>
				${a_id}<br>
				<input type="hidden" id="a_id" value="${a_id}">
				<button onclick="sendCheckValue()">사용하기</button>
				<button onclick="goBack();">뒤로 가기</button></td>
		</tr>
		</c:when>
		</c:choose>
		<tr>
			<td>
				<button id="cancelBtn" onclick="window.close()">취소</button> <br>
			</td>
		</tr>
	</table>
</body>
</html>
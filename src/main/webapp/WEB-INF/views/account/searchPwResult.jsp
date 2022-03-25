<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="aSearchResultTbl">
		<tr>
			<td class="padding"><img src="resources/img/image/pwresult.jpg"></td>
		</tr>
		<tr>
		<c:choose>
		<c:when test="${result eq '2'}">
			<td>회원님의 PW는 ${pw}입니다.</td>
			</c:when>
		<c:when test="${result eq '1'}">
		<td>ID나 비밀번호 찾기 질문을 다시 확인해주세요!</td>
		</c:when>
		</c:choose>
		</tr>
	</table>
</body>
</html>
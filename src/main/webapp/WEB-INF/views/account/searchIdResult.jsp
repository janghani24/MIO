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
			<td><img src="resources/img/image/idresult.jpg"></td>
		</tr>
		<tr>
		<c:choose>
		<c:when test="${result eq '2'}">
			<td class="padding">회원님의 ID는 ${id}입니다.</td>
		</c:when>
		<c:when test="${result eq '1'}">
		<td class="padding">등록되지않은 회원입니다.</td>
		</c:when>
		</c:choose>
		</tr>
	</table>
</body>
</html>
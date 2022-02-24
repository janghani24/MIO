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
	<form action="account.updategrade">
		<table>
			<tr>
				<td>등급 조정</td>
			</tr>
			<c:forEach var="a" items="${accounts}">
				<tr>
					<td>${a.a_id}</td>
					<td>${a.a_name}</td>
					<td>${a.a_grade}</td>
					<td><select name="a_grade">
							<option value="general">일반 회원</option>
							<option value="seller">판매자</option>
							<option value="blacklist">블랙리스트</option>
					</select>
						<button name="a_id" value="${a.a_id}">변경</button></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
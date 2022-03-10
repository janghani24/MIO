
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border=1 class="category_tbl">
	
	<tr>
			<td><a href="">일자리 창출</a></td>
			<td><a href="">친환경</a></td>
			<td><a href="">기부</a></td>
			<td><a href="">유기동물 후원</a></td>
		</tr>
	
	</table>

		<c:forEach var="f" items="${funding}">
			<ul>
				<li><a href="${f.f_url}"><img src="resources/img/funding/${f.f_photo}"></a></li>

				<li><a href="${f.f_url}">${f.f_company}</a></li>
				<li>${f.f_name}</li>

				<li><fmt:formatDate value="${f.f_period}" pattern="yyyy년 MM월 dd일" />&nbsp;종료
				</li>
			</ul>
		</c:forEach>
		
</body>
</html>
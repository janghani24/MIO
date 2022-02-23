<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="b" items="${beauty}">
		<ul>
			<li><img src="resources/img/beauty/${b.p_photo}"></li>
			<li>${b.p_name}</li>
			<li>${b.p_price}원</li>
		</ul>
	</c:forEach>

</body>
</html>
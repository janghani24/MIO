<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
		
	
	
	
	<br>
	<button id="check_module" type="button">테스트 결제</button>
		<c:forEach var="o" items="${order }">
			<table border="1">			
				<tr>
					<td >넘버		${o.p_num }</td>
				</tr>

				<tr>
					<td>이름		${o.p_name }</td>
				</tr>
				<tr>
					<td>가격		${o.p_price }</td>
					
				</tr>
				<tr>
					<td>프덕id	${o.productId }</td>
					
				</tr>
				<tr>
					<td>갯수		${o.productCount }</td>
					
				</tr>
				<tr>
					<td><img
				src="resources/img/${o.p_category1}/${o.p_photo }" width="150" height="150"></td>
					
				</tr>
			</table>
		</c:forEach>
		
	
</body>
</html>
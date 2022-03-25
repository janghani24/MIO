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
		
	구매내역보기<br>


		<c:forEach var="o" items="${order }">
			<table border="1">			
				<tr>
					<td >주문넘버:&nbsp;${o.orderId }</td>
				</tr>
				<tr>
					<td>개수:&nbsp;${o.productCount }</td>
					
				</tr>
				<tr>
					<td>가격:	&nbsp;${o.productPrice }</td>
					
				</tr>
				<tr>
					<td>주소:&nbsp;${o.memberAddr1 }</td>
					
				</tr>
				<tr>
					<td>주소:&nbsp;${o.memberAddr2 }</td>
					
				</tr>
				<tr>
					<td>구매상태:&nbsp;${o.orderState }</td>
					
				</tr>
				<tr>
					<td>구매날짜 :&nbsp;<fmt:formatDate value="${o.orderDate }" pattern="yyyy년 MM월 dd일 HH:mm:ss" />	</td>
				
				</tr>
				<tr>
					<td><img
				src="resources/img/${o.p_category1}/${o.p_photo }" width="50" height="50"></td>
				
				</tr>
			</table>
		</c:forEach>
		
	
</body>
</html>
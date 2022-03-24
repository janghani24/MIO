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
	
	상품고유번호:${param.p_num }<br>
	상품명: ${detail.p_name} <br>
	상품가격:${param.price}<br>
	갯수안나옴:${param.amount}<br>
	주문고유id:${param.orderid}<br>
	주문자id:${param.id}<br>
	이메일:${param.email }<br>
	주소1:${param.addr1 }<br>
	주소2:${param.addr2 }<br>
	

		<c:forEach var="o" items="${order }">
			<table border="1">			
				<tr>
					<td >주문넘버:&nbsp;${o.orderId }</td>
				</tr>

				<tr>
					<td>아이디:&nbsp;${o.memberId }</td>
				</tr>
				<tr>
					<td>상품넘버:&nbsp;${o.productId }</td>
					
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
				src="resources/img/${o.p_category1}/${o.p_photo }" width="150" height="150"></td>
				
				</tr>
			</table>
		</c:forEach>
		
	
</body>
</html>
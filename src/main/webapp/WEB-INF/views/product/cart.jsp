<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" id="cartTalble">
		<tr>
			<td colspan="4">장바구니</td>
		</tr>
		<c:set var="total" value="0" />
		<c:set var="totalprice" value="0" />
		<c:forEach var="c" items="${carts}">
			<tr>
				<td rowspan="2"><img
					src="resources/img/${c.c_category}/${c.c_p_photo}" width="200px;"
					onclick="location.href='product.detail?p_num=${c.c_p_no}'"></td>
				<td colspan="3"
					onclick="location.href='product.detail?p_num=${c.c_p_no}'">${c.c_name}</td>
			</tr>
			<tr>
				<td>${c.c_quantity}</td>
				<c:set var="totalprice" value="${c.c_price * c.c_quantity}" />
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${totalprice}" /> 원 
						<c:set var="total" value="${total + totalprice}" /></td>
				<td>
					<button onclick="updateCart(${c.c_p_no})">수량 수정</button>
				<br>
				<br>
					<button onclick="deleteCart(${c.c_p_no})">삭제</button>
				</td>
			</tr>
			<c:set var="totalprice" value="0" />
		</c:forEach>
		<tr>
			<td>총 금액 =</td>
			<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" />원 
				<input type="hidden" name="totalPrice" value="${total}"></td>
			<td colspan="2"><button>결제</button></td>
		</tr>


	</table>

</body>
</html>
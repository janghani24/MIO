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
	<table id="cartTalble">
		<tr>
			<td colspan="4">
<input type="hidden" value="장바구니상품" id="productname">
<input id="id" value="${param.id }" type="hidden">
<input id="p_num" value="${detail.p_num }" type="hidden">
<input id="amount" value="${param.cnt }" type="hidden">
			<img src="resources/img/image/장바구니.jpg">
			</td>
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
					<button onclick="updateCart(${c.c_p_no})" id="cartbutton">수량 수정</button>
				<br>
				<br>
					<button onclick="deleteCart(${c.c_p_no})" id="cartbutton">삭제</button>
				</td>
			</tr>
			<c:set var="totalprice" value="0" />
		</c:forEach>
		<tr>
			<td id="cartTd">총 금액 =</td>
			<td id="cartTd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" />원 
				<input type="hidden" name="totalPrice" value="${total}" id="price"></td>
				<td colspan="2"><button id="check_module2" type="button">테스트 결제</button></td>
		</tr>
		</table>
		<br>주소입력창
		<table border="1" >
			<tr>
				<td class="td1">주소</td>
				<td class="td2"><input id="jm_addr3Input" readonly="readonly"
					name="a_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span><br> 
					<input
					id="jm_addr1Input" readonly="readonly" name="a_addr1"
					maxlength="30" autocomplete="off" placeholder="주소"><br>
					
				</tr>
	</table>

</body>
</html>
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

<button onclick="location.href='product.livingReg'">상품 등록</button>

	<table border="1">
		<tr>

			<td onclick="location.href='product.living.all'">전체 상품</td>
			<td onclick="location.href='product.living.category?p_category=주방용품'">주방
				용품</td>
			<td onclick="location.href='product.living.category?p_category=욕실용품'">욕실
				용품</td>
			<td onclick="location.href='product.living.category?p_category=생활용품'">생활
				용품</td>
			<td onclick="location.href='product.living.category?p_category=문구'">문구</td>
		</tr>
	</table>

	<c:forEach var="l" items="${living}">
		<ul>
			<li onclick="location.href='product.detail?p_num=${l.p_num}'"><img
				src="resources/img/living/${l.p_photo}"></li>
			<li>${l.p_brand}</li>
			<li>${l.p_name}</li>
			<li>${l.p_price}원</li>

		</ul>
	</c:forEach>

</body>
</html>
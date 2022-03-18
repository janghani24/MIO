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

<button onclick="location.href='product.foodReg'">상품 등록</button>

<table border="1">
		<tr>
			<td onclick="location.href='product.food.all'">전체 상품</td>
			<td onclick="location.href='product.food.category?p_category=식사거리'">식사거리</td>
			<td onclick="location.href='product.food.category?p_category=간식거리'">간식거리</td>
			<td onclick="location.href='product.food.category?p_category=요리재료'">요리재료</td>
			<td onclick="location.href='product.food.category?p_category=건강식품'">건강식품</td>
		</tr>
	</table>

	<c:forEach var="f" items="${food}">
		<ul>
			<li onclick="location.href='product.detail?p_num=${f.p_num}'"><img
				src="resources/img/food/${f.p_photo}"></li>
			<li>${f.p_brand}</li>
			<li>${f.p_name}</li>
			<li>${f.p_price}원</li>
		</ul>
	</c:forEach>

</body>
</html>
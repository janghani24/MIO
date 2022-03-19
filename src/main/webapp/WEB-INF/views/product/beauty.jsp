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

<button onclick="location.href='product.beautyReg'">상품 등록</button>

<table border="1">
		<tr>
			<td onclick="location.href='product.beauty.all'">전체 상품</td>
			<td onclick="location.href='product.beauty.category?p_category=스킨케어'">스킨케어</td>
			<td onclick="location.href='product.beauty.category?p_category=바디케어'">바디케어</td>
			<td onclick="location.href='product.beauty.category?p_category=메이크업'">메이크업</td>
			<td onclick="location.href='product.beauty.category?p_category=선케어'">선케어</td>
		</tr>
	</table>

	<c:forEach var="b" items="${beauty}">
		<ul>
			<li onclick="location.href='product.detail?p_num=${b.p_num}'"><img
				src="resources/img/beauty/${b.p_photo}" width="500px;"></li>
				
			<li>${b.p_brand}</li>
			<li>${b.p_name}</li>
			<li>${b.p_price}원</li>
		</ul>
	</c:forEach>

</body>
</html>
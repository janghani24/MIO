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

<button onclick="location.href='product.fashionReg'">상품 등록</button>

	<table border="1">
		<tr>
			<td onclick="location.href='product.fashion.all'">전체 상품</td>
			<td onclick="location.href='product.fashion.category?p_category=의류'">의류</td>
			<td onclick="location.href='product.fashion.category?p_category=가방'">가방</td>
			<td onclick="location.href='product.fashion.category?p_category=지갑'">지갑</td>
			<td onclick="location.href='product.fashion.category?p_category=패션소품'">패션 소품</td>
			<td onclick="location.href='product.fashion.category?p_category=케이스'">케이스</td>
			<td onclick="location.href='product.fashion.category?p_category=신발'">신발</td>
		</tr>
	</table>

	<c:forEach var="f" items="${fashion}">
		<ul>
			<li onclick="location.href='product.detail?p_num=${f.p_num}'"><img
				src="resources/img/fashion/${f.p_photo}" width="500px;"></li>
			<li>${f.p_brand}</li>
			<li>${f.p_name}</li>
			<li>${f.p_price}원</li>
		</ul>
	</c:forEach>

</body>
</html>
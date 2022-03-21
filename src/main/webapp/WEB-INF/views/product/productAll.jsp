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

	<form action="product.search">
		<input name="search">
		<button>검색</button>
	</form>

	<table border=1 class="category_tbl">
		<tr>
			<td><a href="product.category?p_category1=food">Food</a></td>
			<td><a href="product.category?p_category1=fashion">Fashion</a></td>
			<td><a href="product.category?p_category1=beauty">Beauty</a></td>
			<td><a href="product.category?p_category1=living">Living</a></td>
		</tr>
	</table>

	<c:forEach var="p" items="${products}">
		<ul>
			<li onclick="location.href='product.detail?p_num=${p.p_num}'"><img
				src="resources/img/${p.p_category1}/${p.p_photo}" width="500px;"></li>

			<li>${p.p_brand}</li>
			<li>${p.p_name}</li>
			<li>${p.p_price}원</li>
		</ul>
	</c:forEach>
	<c:if test="${sessionScope.loginAccount.a_grade eq 'seller' or sessionScope.loginAccount.a_grade eq 'admin'}">
		<button onclick="location.href='product.reg.select'">상품 등록</button>
	</c:if>
	<div align="center">
		<a href="product.paging?p=1"> [맨처음] </a>
		<c:forEach var="p" begin="1" end="${pageCount}">
			<a href="product.paging?p=${p}">[${p}]</a>
		</c:forEach>
		<a href="product.paging?p=${pageCount}"> [맨끝] </a>
	</div>



</body>
</html>
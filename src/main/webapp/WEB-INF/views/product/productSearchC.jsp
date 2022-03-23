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




	<table border=1 class="pSearchResultTbl">
		<tr>
			<td><a href="product.category?p_category1=food">Food</a></td>
			<td><a href="product.category?p_category1=fashion">Fashion</a></td>
			<td><a href="product.category?p_category1=beauty">Beauty</a></td>
			<td><a href="product.category?p_category1=living">Living</a></td>
		</tr>

		<tr>
			<td colspan="4"><c:forEach var="p" items="${products}">

					<ul>
						<li onclick="location.href='product.detail?p_num=${p.p_num}'"><img
							src="resources/img/${p.p_category1}/${p.p_photo}"></li>

						<li>${p.p_brand}</li>
						<li>${p.p_name}</li>
						<li>${p.p_price}원</li>
					</ul>
				</c:forEach></td>
		</tr>
		<tr>
			<td colspan="4">
				<div align="center">
					<a
						href="product.search.category.paging?p=1&search=${search}&p_category1=${category}">
						[맨처음] </a>
					<c:forEach var="p" begin="1" end="${pageCount}">
						<!-- 페이지 카운터를 누르면 해당 페이지로 이동함 -->
						<a
							href="product.search.category.paging?p=${p}&search=${search}&p_category1=${category}">[${p}]</a>
					</c:forEach>
					<a
						href="product.search.category.paging?p=${pageCount}&search=${search}&p_category1=${category}">
						[맨끝] </a>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<form action="product.search">
					<input name="search">
					<button>검색</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
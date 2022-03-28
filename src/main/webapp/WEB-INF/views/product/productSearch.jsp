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




	<table class="itemListTbl">
		<tr>
			<td class="icon"><a href="product.category?p_category1=food"><img
					src="resources/img/image/foodicon.jpg"></a></td>
			<td class="icon"><a href="product.category?p_category1=fashion"><img
					src="resources/img/image/fashionicon.jpg"></a></td>
			<td class="icon"><a href="product.category?p_category1=beauty"><img
					src="resources/img/image/beautyicon.jpg"></a></td>
			<td class="icon"><a href="product.category?p_category1=living"><img
					src="resources/img/image/livingicon.jpg"></a></td>
		</tr>
		<tr>
			<td colspan="4" id="searchTbl">
				<form action="product.search">
					<input name="search">
					<button id="productSearchButton">검색</button>
				</form>
			</td>
		</tr>


		<tr>
			<td colspan="4"><c:forEach var="p" items="${products}">

					<ul class="menu_ul2">
						<li class="productImage"
							onclick="location.href='product.detail?p_num=${p.p_num}'"><img
							src="resources/img/${p.p_category1}/${p.p_photo}" width="350px;"></li>

						<li id="brand">${p.p_brand}</li>
						<li id="productName">${p.p_name}</li>
						<li id="price">${p.p_price}원</li>
					</ul>
				</c:forEach></td>
		</tr>
		<tr>
			<td colspan="4" id="paging">
				<div align="center" id="productName">
					<a href="product.search.paging?p=1&search=${search}"> 맨처음 | </a>
					<c:forEach var="p" begin="1" end="${pageCount}">
						<a href="product.search.paging?p=${p}&search=${search}">${p} |</a>
					</c:forEach>
					<a href="product.search.paging?p=${pageCount}&search=${search}">
						맨끝 </a>
				</div>
			</td>
		</tr>

	</table>
</body>
</html>
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

	<table border="1" class="categoryTbl">

		<tr>
			<td colspan="7" id="banner"><img
				src="resources/img/image/fashionbanner.png"></td>
		</tr>
		<tr>
			<td class="category2"
				onclick="location.href='product.category?p_category1=fashion'" width="25%;">전체
				상품</td>
			<td class="category2"
				onclick="location.href='product.category.category2?p_category1=fashion&p_category2=의류'" width="25%;">의류</td>
			<td class="category2"
				onclick="location.href='product.category.category2?p_category1=fashion&p_category2=가방'" width="25%;">가방</td>
			<td class="category2"
				onclick="location.href='product.category.category2?p_category1=fashion&p_category2=패션소품'" width="25%;">패션
				소품</td>


		</tr>

		<tr>

			<td colspan="4" id="searchTbl">
				<form action="product.category.search">
					<input name="search"> <input type="hidden"
						name="p_category1" value="fashion">
					<button id="productSearchButton">검색</button>
				</form>
			</td>
		</tr>
		<tr>

			<td colspan="4"><c:forEach var="f" items="${products}">
					<ul class="menu_ul">
						<li class="productImage"
							onclick="location.href='product.detail?p_num=${f.p_num}'"><img
							src="resources/img/${f.p_category1}/${f.p_photo}" width="350px;"></li>
						<li id="brand">${f.p_brand}</li>
						<li id="productName">${f.p_name}</li>
						<li id="price">${f.p_price}원</li>
					</ul>
				</c:forEach></td>
		</tr>
		<tr>
			<td colspan="4" id="paging">
				<div align="center">
					<a
						href="product.category.paging?p=1&p_category1=${category}&p_category2=${p_category2}">
						[맨처음] </a>
					<c:forEach var="p" begin="1" end="${pageCount}">
						<a
							href="product.category.paging?p=${p}&p_category1=${category}&p_category2=${p_category2}">[${p}]</a>
					</c:forEach>
					<a
						href="product.category.paging?p=${pageCount}&p_category1=${category}&p_category2=${p_category2}">
						[맨끝] </a>
				</div>
			</td>
		</tr>

		<tr>
			<td colspan="7"><c:if
					test="${sessionScope.loginAccount.a_grade eq 'seller' or sessionScope.loginAccount.a_grade eq 'admin'}">
					<button id="regButton" onclick="location.href='product.fashionReg'">상품
						등록</button>
				</c:if></td>
		</tr>
	</table>
</body>
</html>
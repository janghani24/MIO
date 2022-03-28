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




	<table class="categoryTbl">

		<tr>
			<td colspan="7" id="banner"><img
				src="resources/img/image/livingbanner.png"></td>
		</tr>

		<tr>
			<td class="category2"
				onclick="location.href='product.category?p_category1=living'" width="20%;">전체
				상품</td>
			<td class="category2"
				onclick="location.href='product.category.category2?p_category1=living&p_category2=주방용품'" width="20%;">주방
				용품</td>
			<td class="category2"
				onclick="location.href='product.category.category2?p_category1=living&p_category2=욕실용품'" width="20%;">욕실
				용품</td>
			<td class="category2"
				onclick="location.href='product.category.category2?p_category1=living&p_category2=생활용품'" width="20%;">생활
				용품</td>
			<td class="category2"
				onclick="location.href='product.category.category2?p_category1=living&p_category2=문구'" width="20%;">문구</td>

		</tr>
		<tr>
			<td colspan="6" id="searchTbl">

				<form action="product.category.search">
					<input name="search"> <input type="hidden"
						name="p_category1" value="living">
					<button id="productSearchButton">검색</button>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="6" id="productRandom"><c:forEach var="l" items="${products}">
					<ul class="menu_ul2">
						<li class="productImage"
							onclick="location.href='product.detail?p_num=${l.p_num}'"><img
							src="resources/img/living/${l.p_photo}" width="350px;"></li>
						<li id="brand">${l.p_brand}</li>
						<li id="productName">${l.p_name}</li>
						<li id="price">${l.p_price}원</li>

					</ul>
				</c:forEach></td>
		</tr>
		<tr>
			<td colspan="6">
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

			<td colspan="6"><c:if
					test="${sessionScope.loginAccount.a_grade eq 'seller' or sessionScope.loginAccount.a_grade eq 'admin'}">
					<button id="regButton" onclick="location.href='product.livingReg'">상품
						등록</button>
				</c:if></td>

		</tr>
	</table>
</body>
</html>
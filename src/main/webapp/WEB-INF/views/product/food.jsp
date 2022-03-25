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
			<td colspan="5">FOOD 배너 등</td>
		</tr>
		<tr>
			<td class="category2"
				onclick="location.href='product.category?p_category1=food'">전체
				상품</td>
			<td class="category2"
				onclick="location.href='product.category.category2?p_category1=food&p_category2=식사거리'">식사거리</td>
			<td class="category2"
				onclick="location.href='product.category.category2?p_category1=food&p_category2=간식거리'">간식거리</td>
			<td class="category2"
				onclick="location.href='product.category.category2?p_category1=food&p_category2=요리재료'">요리재료</td>
		</tr>
		<tr>
			<td colspan="5" id="searchTbl">
				<form action="product.category.search">
					<input name="search"> <input type="hidden"
						name="p_category1" value="food">
					<button id="productSearchButton">검색</button>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="6"><c:forEach var="f" items="${products}">
					<ul>
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
			<td colspan="5" id="paging">
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
			<td colspan="5"><c:if
					test="${sessionScope.loginAccount.a_grade eq 'seller' or sessionScope.loginAccount.a_grade eq 'admin'}">
					<button id="regButton" onclick="location.href='product.foodReg'">상품
						등록</button>
				</c:if></td>
		</tr>
	</table>
</body>
</html>
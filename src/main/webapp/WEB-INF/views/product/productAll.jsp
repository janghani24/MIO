<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<td colspan="5" id="searchTbl">
				<form action="product.search">
					<input name="search">
					<button id="productSearchButton">검색</button>
				</form>

			</td>
		</tr>
	
		<tr>
			<td colspan="4"><c:forEach var="p" items="${products}">
					<ul>
						<li class="productImage"
							onclick="location.href='product.detail?p_num=${p.p_num}'"><img
							src="resources/img/${p.p_category1}/${p.p_photo}"></li>

						<li id="brand">${p.p_brand}</li>
						<li id="productName">${p.p_name}</li>
						<li id="price"><fmt:formatNumber type="number" maxFractionDigits="3"
								value="${p.p_price}" />원</li>
					</ul>
				</c:forEach></td>
		</tr>
		<tr>
			<td colspan="5" id="paging">
				<div align="center">
					<a href="product.paging?p=1"> [맨처음] </a>
					<c:forEach var="p" begin="1" end="${pageCount}">
						<a href="product.paging?p=${p}">[${p}]</a>
					</c:forEach>
					<a href="product.paging?p=${pageCount}"> [맨끝] </a>
				</div>
			</td>
			
		</tr>
		
		<tr>
			<td colspan="4"><c:if
					test="${sessionScope.loginAccount.a_grade eq 'seller' or sessionScope.loginAccount.a_grade eq 'admin'}">
					<button onclick="location.href='product.reg.select'" id="regButton">상품 등록</button>
				</c:if></td>
		</tr>
	</table>

</body>
</html>
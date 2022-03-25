<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${detail.p_category1 eq 'food'}">
			<form action="product.updateProduct.food" method="post"
				enctype="multipart/form-data" name="productUpdateForm"
				onsubmit="return productUpdateCheck();">
		</c:when>
		<c:when test="${detail.p_category1 eq 'living'}">
			<form action="product.updateProduct.living" method="post"
				enctype="multipart/form-data" name="productUpdateForm"
				onsubmit="return productUpdateCheck();">
		</c:when>
		<c:when test="${detail.p_category1 eq 'beauty'}">
			<form action="product.updateProduct.beauty" method="post"
				enctype="multipart/form-data" name="productUpdateForm"
				onsubmit="return productUpdateCheck();">
		</c:when>
	</c:choose>
	<table class="pUpdateTbl">
		<tr>
			<td colspan="3">
				<img src="resources/img/image/상품수정.jpg">
			</td>
		<tr>
			<td class="infoTd1">사진</td>
			<td class="infoTd"><img
				src="resources/img/${detail.p_category1}/${detail.p_photo}"
				width="200px;">
		<td class="infoTd"><input name="p_photo" type="file"></td>
		</tr>
		<tr>
			<td class="infoTd1">상품 이름</td>
			<td class="infoTd">${detail.p_name}</td>
			<td class="infoTd"><input name="p_name" class="input"></td>
		<tr>
			<td class="infoTd1">상품 가격</td>
			<td class="infoTd">${detail.p_price}원</td>
			<td class="infoTd"><input name="p_price" class="input"></td>
		<tr>
			<td class="infoTd1">브랜드</td>
			<td class="infoTd">${detail.p_brand}</td>
			<td class="infoTd"><input name="p_brand" class="input"></td>
		<tr>
			<td class="infoTd1">수량</td>
			<td class="infoTd">${detail.p_quantity}</td>
			<td class="infoTd"><input name="p_quantity" class="input"></td>
		<tr>
			<td class="infoTd1">상품 상세 정보</td>
			<td class="infoTd" colspan="2"><input name="p_content" type="file"></td>
		<tr>
			<td colspan="3"><input type="hidden" name="p_num"
				value="${detail.p_num}" class="infoTd1">
				<button name="p_category1" value="${detail.p_category1}" class="button">수정</button>
				</form></td>
		</tr>
	</table>
</body>
</html>
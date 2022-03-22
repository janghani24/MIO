<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${detail.p_category1 eq 'food'}">
<form action="product.updateProduct.food" method="post" enctype="multipart/form-data"
	name="productUpdateForm" onsubmit="return productUpdateCheck();">
</c:when>
<c:when test="${detail.p_category1 eq 'living'}">
<form action="product.updateProduct.living" method="post" enctype="multipart/form-data"
	name="productUpdateForm" onsubmit="return productUpdateCheck();">
</c:when>
<c:when test="${detail.p_category1 eq 'beauty'}">
<form action="product.updateProduct.beauty" method="post" enctype="multipart/form-data"
	name="productUpdateForm" onsubmit="return productUpdateCheck();">
</c:when>
</c:choose>

		<h1>상품 수정</h1>
		
		사진:<img src="resources/img/${detail.p_category1}/${detail.p_photo}" width="800px;">
				<input name="p_photo" type="file">
		<p>
			상품 이름:${detail.p_name}<input name="p_name">
		<p>
			상품 가격:${detail.p_price}원<input name="p_price">
		<p>
			브랜드:${detail.p_brand}원<input name="p_brand">
		<p>
			수량:${detail.p_quantity}원<input name="p_quantity">
		<p>
			상품 상세 정보:<img src="resources/img/${detail.p_category1}/${detail.p_content}" width="800px;">
				<input name="p_content" type="file">
		<p>
		<input type="hidden" name="p_num" value="${detail.p_num}">
			<button name="p_category1" value="${detail.p_category1}">수정</button>
	</form>
</body>
</html>
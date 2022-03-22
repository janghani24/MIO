<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="product.updateProduct.fashion" method="post" enctype="multipart/form-data"
	name="productUpdateForm" onsubmit="return productUpdateCheck();">
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
		사이즈: ${fashionDetail.d_size} <div><select name="d_size">
		<option value="S">S</option>
		<option value="M">M</option>
		<option value="L">L</option>
		</select>
		<p>		
		컬러:${fashionDetail.d_color}<input name="d_color">
		
		
		<input type="hidden" name="p_num" value="${detail.p_num}">
			<button>수정</button>
	</form>
</body>
</html>
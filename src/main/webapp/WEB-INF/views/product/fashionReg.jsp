<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>의류 제품 등록</h1>


	<form action="fashion.reg" method="post" enctype="multipart/form-data"
	name="productRegForm" onsubmit="return productFashionRegCheck();">

		사진:<input name="p_photo" type="file">
		<p>
			상품 이름:<input name="p_name">
		<p>
			상품 가격:<input name="p_price">
		<p>
			브랜드:<input name="p_brand">
		<p>
			수량:<input name="p_quantity">
		<p>
			상품 상세 정보:<input name="p_content" type="file">
		<p>
			상품 하위 카테고리 <select name="p_category2">
				<option value="의류">의류</option>
				<option value="가방">가방</option>
				<option value="지갑">지갑</option>
				<option value="패션소품">패션소품</option>
				<option value="케이스">케이스</option>
				

			</select>
		<p>
		<div>사이즈 컬러 수량</div>
		<div><select name="d_size">
		<option value="S">S</option>
		<option value="M">M</option>
		<option value="L">L</option>
		</select>
		<input name="d_color">
		</div>
		<p>
		<input type="hidden" name="p_category1" value="fashion">
			<button>등록</button>
	</form>


</body>
</html>
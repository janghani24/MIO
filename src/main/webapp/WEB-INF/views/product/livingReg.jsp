<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>생활용품 제품 등록</h1>

<form action="food.reg" method="post" enctype="multipart/form-data"
name="productRegForm" onsubmit="return productRegCheck();">
		<h1>식품 등록</h1>
		
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
				<option value="주방용품">주방용품</option>
				<option value="욕실용품">욕실용품</option>
				<option value="생활용품">생활용품</option>
				<option value="문구">문구</option>

			</select>
		<p>
			<button name="p_category1" value="living">등록</button>
	</form>

</body>
</html>
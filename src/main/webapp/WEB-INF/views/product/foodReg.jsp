<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="food.reg" method="post" enctype="multipart/form-data">
		<h1>식품 등록</h1>
		
		사진:<input name="p_photo" type="file">
		<p>
			상품 이름:<input name="p_name">
		<p>
			상품 가격:<input name="p_price">
		<p>
			브랜드:<input name="p_brand">
		<p>
			수량:<input name="p_quantity" type="number" min="1">
		<p>
			상품 상세 정보:<input name="p_content" type="file">
		<p>
			상품 하위 카테고리 <select name="p_category2">
				<option value="식사거리">식사거리</option>
				<option value="간식거리">간식거리</option>
				<option value="요리재료">요리재료</option>
				<option value="건강식품">건강식품</option>

			</select>
		<p>
			<button name="p_category1" value="food">등록</button>
	</form>
	
	
</body>
</html>
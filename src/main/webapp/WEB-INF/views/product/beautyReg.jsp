<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="beauty.reg" method="post" enctype="multipart/form-data">
		<h1>뷰티 등록</h1>
		
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
				<option value="스킨케어">스킨 케어</option>
				<option value="바디케어">바디 케어</option>
				<option value="메이크업">메이크업</option>
				<option value="선케어">선케어</option>

			</select>
		<p>
			<button name="p_category1" value="beauty">등록</button>
	</form>

</body>
</html>
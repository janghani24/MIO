<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="fashion.reg" method="post" enctype="multipart/form-data"
		name="productRegForm" onsubmit="return productFashionRegCheck();">
		<table class="productFashionRegTbl">
			<tr>
				<td colspan="2">

					<img src="resources/img/image/의류등록.jpg">
				</td>
			</tr>
			<tr>
				<td class="infoTd1">사진:</td>
				<td class="infoTd"><input name="p_photo" type="file"></td>
			</tr>
			<tr>
				<td class="infoTd1">상품 이름:</td>
				<td class="infoTd"><input name="p_name" class="input"></td>
			</tr>
			<tr>
				<td class="infoTd1">상품 가격:</td>
				<td class="infoTd"><input name="p_price" class="input"></td>
			</tr>
			<tr>
				<td class="infoTd1">브랜드:</td>
				<td class="infoTd"><input name="p_brand" class="input"></td>
			</tr>
			<tr>
				<td class="infoTd1">수량:</td>
				<td class="infoTd"><input name="p_quantity" class="input"></td>
			</tr>
			<tr>
				<td class="infoTd1">상품 상세 정보:</td>
				<td class="infoTd"><input name="p_content" type="file"></td>
			</tr>
			<tr>
				<td class="infoTd1">상품 하위 카테고리</td>
				<td class="infoTd"><select name="p_category2">
						<option value="의류">의류</option>
						<option value="가방">가방</option>
						<option value="패션소품">패션소품</option>
				</select></td>
			<tr>
				<td class="infoTd1">사이즈</td>
				<td class="infoTd"><select name="d_size">
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="L">Free</option>
				</select></td>
			<tr>
				<td class="infoTd1">컬러</td>
				<td class="infoTd"><input name="d_color" class="input"></td>
			<tr>
				<td colspan="2"><input type="hidden" name="p_category1"
					value="fashion" class="infoTd1">
					<button class="button">등록</button></td>
			</tr>
		</table>

	</form>


</body>
</html>
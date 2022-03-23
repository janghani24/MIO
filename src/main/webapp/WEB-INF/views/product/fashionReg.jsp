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
		<table border="1" class="productFashionRegTbl">
			<tr>
				<td colspan="2">

					<h1>의류 제품 등록</h1>
				</td>
			</tr>
			<tr>
				<td>사진:</td>
				<td><input name="p_photo" type="file"></td>
			</tr>
			<tr>
				<td>상품 이름:</td>
				<td><input name="p_name"></td>
			</tr>
			<tr>
				<td>상품 가격:</td>
				<td><input name="p_price"></td>
			</tr>
			<tr>
				<td>브랜드:</td>
				<td><input name="p_brand"></td>
			</tr>
			<tr>
				<td>수량:</td>
				<td><input name="p_quantity"></td>
			</tr>
			<tr>
				<td>상품 상세 정보:</td>
				<td><input name="p_content" type="file"></td>
			</tr>
			<tr>
				<td>상품 하위 카테고리</td>
				<td><select name="p_category2">
						<option value="의류">의류</option>
						<option value="가방">가방</option>
						<option value="지갑">지갑</option>
						<option value="패션소품">패션소품</option>
						<option value="케이스">케이스</option>


				</select></td>
			<tr>
				<td>사이즈</td>
				<td><select name="d_size">
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
				</select></td>
			<tr>
				<td>컬러</td>
				<td><input name="d_color"></td>
			<tr>
				<td colspan="2"><input type="hidden" name="p_category1"
					value="fashion">
					<button>등록</button></td>
			</tr>
		</table>
	</form>


</body>
</html>
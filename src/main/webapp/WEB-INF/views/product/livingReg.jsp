<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<form action="food.reg" method="post" enctype="multipart/form-data"
		name="productRegForm" onsubmit="return productRegCheck();">
		<table border="1" class="productRegTbl">
			<tr>
				<td colspan="2">
					<h1>생활용품 제품 등록</h1>
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
						<option value="주방용품">주방용품</option>
						<option value="욕실용품">욕실용품</option>
						<option value="생활용품">생활용품</option>
						<option value="문구">문구</option>

				</select></td>
			</tr>
			<tr>
				<td colspan="2">
					<button name="p_category1" value="living">등록</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
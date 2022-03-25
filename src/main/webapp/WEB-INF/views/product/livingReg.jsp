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
		<table class="productRegTbl">
			<tr>
				<td colspan="2">
					<img src="resources/img/image/생활용품등록.jpg">
				</td>
			</tr>
			<tr>
				<td class="infoTd1">사진</td>
				<td class="infoTd"><input name="p_photo" type="file"></td>
			</tr>
			<tr>
				<td class="infoTd1">상품 이름</td>
				<td class="infoTd"><input name="p_name" class="input"></td>
			</tr>
			<tr>
				<td class="infoTd1">상품 가격</td>
				<td class="infoTd"><input name="p_price" class="input"></td>
			</tr>
			<tr>
				<td class="infoTd1">브랜드</td>
				<td class="infoTd"><input name="p_brand" class="input"></td>
			</tr>
			<tr>
				<td class="infoTd1">수량</td>
				<td class="infoTd"><input name="p_quantity" class="input"></td>
			</tr>
			<tr>
				<td class="infoTd1">상품 상세 정보</td>
				<td class="infoTd"><input name="p_content" type="file"></td>
			</tr>
			<tr>
				<td class="infoTd1">상품 하위 카테고리</td>
				<td class="infoTd"><select name="p_category2">
						<option value="주방용품">주방용품</option>
						<option value="욕실용품">욕실용품</option>
						<option value="생활용품">생활용품</option>
						<option value="문구">문구</option>

				</select></td>
			</tr>
			<tr>
				<td colspan="2" class="infoTd1">
					<button name="p_category1" value="living" class="button">등록</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
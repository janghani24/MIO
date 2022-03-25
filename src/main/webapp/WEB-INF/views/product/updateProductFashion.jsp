<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="product.updateProduct.fashion" method="post"
		enctype="multipart/form-data" name="productUpdateForm"
		onsubmit="return productUpdateFashionCheck();">
		<table class="pUpdateTbl">
			<tr>
				<td colspan="3"><img src="resources/img/image/상품수정.jpg">
				</td>
			<tr>
				<td class="infoTd1">사진</td>
				<td class="infoTd"><img
					src="resources/img/${detail.p_category1}/${detail.p_photo}"
					width="200px;">
				<td class="infoTd"><input name="p_photo" type="file"></td>
			</tr>
			<tr>
				<td class="infoTd1">상품 이름</td>
				<td class="infoTd">${detail.p_name}</td>
				<td class="infoTd"><input name="p_name" class="input"></td>
			<tr>
				<td class="infoTd1">상품 가격</td>
				<td class="infoTd">${detail.p_price}원</td>
				<td class="infoTd"><input name="p_price" class="input"></td>
			<tr>
				<td class="infoTd1">브랜드</td>
				<td class="infoTd">${detail.p_brand}</td>
				<td class="infoTd"><input name="p_brand" class="input"></td>
			<tr>
				<td class="infoTd1">수량</td>
				<td class="infoTd">${detail.p_quantity}</td>
				<td class="infoTd"><input name="p_quantity" class="input"></td>
			<tr>
				<td class="infoTd1">상품 상세 정보</td>
				<td colspan="2" class="infoTd"><input name="p_content" type="file"></td>
			<tr>
				<td class="infoTd1">사이즈</td>
				<td class="infoTd">${fashionDetail.d_size}</td>
				<td class="infoTd"><select name="d_size">
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="L">Free</option>
				</select></td>
			</tr>
			<tr>
				<td class="infoTd1">컬러</td>
				<td class="infoTd">${fashionDetail.d_color}</td>
				<td class="infoTd"><input name="d_color" class="input"> <input type="hidden"
					name="p_num" value="${detail.p_num}"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="hidden" name="p_num"
					value="${detail.p_num}" class="infoTd1">
					<button name="p_category1" value="${detail.p_category1}" class="button">수정</button>
					</form></td>
			</tr>
		</table>
</body>
</html>
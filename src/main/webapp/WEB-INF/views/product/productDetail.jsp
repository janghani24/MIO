<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<table border="1">

		<tr>
			<td><img
				src="resources/img/${detail.p_category1}/${detail.p_photo}">
			</li></td>
			<td>
				<table border="1">
					<tr>
						<td>브랜드</td>
						<td>${detail.p_brand}</td>
					</tr>
					<tr>
						<td>상품명</td>
						<td>${detail.p_name}</td>
					</tr>
					<tr>
						<td>상품가</td>
						<td>${detail.p_price}원</td>
					</tr>
					<tr>
						<td>옵션/수량 체크 부분</td>
					</tr>
					<tr>
						<td colspan="2"><button>찜하기</button></td>
					</tr>
				</table>
			</td>

		</tr>
		<tr>
			<td colspan="2"><img
				src="resources/img/${detail.p_category1}/${detail.p_content}"></td>
		</tr>

		<tr>
			<td colspan="2">후기(상품평 작성하기 칸)</td>
		</tr>



	</table>

</body>
</html>
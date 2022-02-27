<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td colspan="2">판매자 상세 페이지</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${sellers.s_name}</td>
		</tr>
		<tr>
			<td>핸드폰 번호</td>
			<td>${sellers.s_phone}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${sellers.s_addr}</td>
		</tr>
		<tr>
			<td>판매 종류</td>
			<td>${sellers.s_sellsort}</td>
		</tr>
		<tr>
			<td>소개글</td>
			<td>${sellers.s_intro}</td>
		</tr>

		<tr>
			<td colspan="2"><button onclick="sellerJoin(${sellers.a_s_id})">가입 승인</button></td>
		</tr>
	</table>
</body>
</html>
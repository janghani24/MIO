<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="sellerDetailTbl">
		<tr>
			<td colspan="2"><img src="resources/img/image/판매자상세페이지.jpg"></td>
		</tr>
		<tr>
			<td class="infoTd1">사진</td>
			<td class="infoTd"><img src="resources/img_account/${sellers.s_img}" width="200px;"></td>
		</tr>
		<tr>
			<td class="infoTd1">이름</td>
			<td class="infoTd">${sellers.s_name}</td>
		</tr>
		<tr>
			<td class="infoTd1">핸드폰 번호</td>
			<td class="infoTd">${sellers.s_phone}</td>
		</tr>
		<tr>
			<td class="infoTd1">주소</td>
			<td class="infoTd">${addr[0]}${addr[1]}${addr[2]}</td>
		</tr>
		<tr>
			<td class="infoTd1">판매 종류</td>
			<td class="infoTd">${sellers.s_sellsort}</td>
		</tr>
		<tr>
			<td class="infoTd1">소개글</td>
			<td class="infoTd">${sellers.s_intro}</td>
		</tr>

		<tr>
			<td colspan="2">
			<button onclick="sellerJoin('${sellers.a_s_id}');" class="button">가입 승인</button>
			<button onclick="sellerReject('${sellers.a_s_id}');" class="button">가입 거절</button>
			</td>
			
		</tr>
	</table>
</body>
</html>
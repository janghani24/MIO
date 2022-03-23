<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="funding.reg" method="post" enctype="multipart/form-data"
		name="fundingRegForm" onsubmit="return fundingRegCheck();">
		<table border="1" id="fundingRegTbl">
			<tr>
				<td colspan="2"><h1>펀딩 등록</h1></td>
			</tr>
			<tr>
				<td>대표 이미지 :</td>
				<td><input name="f_photo" type="file"></td>
			</tr>
			<tr>
				<td>펀딩명 :</td>
				<td><input name="f_name"></td>
			</tr>
			<tr>
				<td>회사명 :</td>
				<td><input name="f_company"></td>
			</tr>
			<tr>
				<td>펀딩 카테고리</td>
				<td><select name="f_category">
						<option value="일자리창출">일자리 창출</option>
						<option value="친환경">친환경</option>
						<option value="기부">기부</option>
						<option value="유기동물보호">유기동물 보호</option>

				</select></td>
			</tr>
			<tr>
				<td>펀딩 마감 기간:</td>
				<td><input type="date" name="f_period"></td>
			</tr>
			<tr>
				<td>펀딩 주소:</td>
				<td><input name="f_url"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button>등록</button>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>
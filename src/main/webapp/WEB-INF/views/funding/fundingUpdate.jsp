<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="funding.updateFunding" method="post"
		enctype="multipart/form-data" name="fundingUpdateForm"
		onsubmit="return fundingUpdateCheck();">
		<table id="fundingUpdateTbl">
			<tr>
				<td colspan="3"><img src="resources/img/image/펀딩수정.jpg">
				</td>
			</tr>
			<tr>
				<td class="infoTd1">대표 이미지 :</td>
				<td class="infoTd"><img src="resources/img/funding/${fundingDetail.f_photo}"
					id="fundingImg" width="200px;"></td>
				<td class="infoTd"><input name="f_photo" type="file"></td>
			</tr>
			<tr>
				<td class="infoTd1">펀딩명 :</td>
				<td class="infoTd">${fundingDetail.f_name}</td>
				<td class="infoTd"><input name="f_name" class="input"></td>
			</tr>
			<tr>
				<td class="infoTd1">회사명 :</td>
				<td class="infoTd">${fundingDetail.f_company}</td>
				<td class="infoTd"><input name="f_company" class="input"></td>
			</tr>
			<tr>
				<td class="infoTd1">펀딩 마감 기간:</td>
				<td class="infoTd">${fundingDetail.f_period}</td>
				<td class="infoTd"><input type="date" name="f_period"></td>
			</tr>
			<tr>
				<td class="infoTd1">펀딩 주소:</td>
				<td class="infoTd" colspan="2"><input name="f_url" class="input" size=30 value="${fundingDetail.f_url}"> <input type="hidden"
					name="f_num" value="${fundingDetail.f_num}"></td>
			</tr>
			<tr>
				<td colspan="3" class="infoTd1">
					<button class="button">수정</button>
				</td>
			</tr>

		</table>
	</form>


</body>
</html>
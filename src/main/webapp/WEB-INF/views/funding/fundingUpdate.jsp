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
		<table border="1" id="fundingUpdateTbl">
			<tr>
				<td colspan="3"><h1>펀딩 수정</h1></td>
			</tr>
			<tr>
				<td>대표 이미지 :</td>
				<td><img src="resources/img/funding/${fundingDetail.f_photo}"
					id="fundingImg" width="300px;"></td>
				<td><input name="f_photo" type="file"></td>
			</tr>
			<tr>
				<td>펀딩명 :</td>
				<td>${fundingDetail.f_name}</td>
				<td><input name="f_name"></td>
			</tr>
			<tr>
				<td>회사명 :</td>
				<td>${fundingDetail.f_company}</td>
				<td><input name="f_company"></td>
			</tr>
			<tr>
				<td>펀딩 마감 기간:</td>
				<td>${fundingDetail.f_period}</td>
				<td><input type="date" name="f_period"></td>
			</tr>
			<tr>
				<td>펀딩 주소:</td>
				<td>${fundingDetail.f_url}</td>
				<td><input name="f_url"> <input type="hidden"
					name="f_num" value="${fundingDetail.f_num}"></td>
			</tr>
			<tr>
				<td colspan="3">
					<button>수정</button>
				</td>
			</tr>

		</table>
	</form>


</body>
</html>
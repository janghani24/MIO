<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="funding.updateFunding" method="post" enctype="multipart/form-data"
	name="fundingRegForm" onsubmit="return fundingRegCheck();">
		대표 이미지 :<img
					src="resources/img/funding/${fundingDetail.f_photo}" id="fundingImg"
					width="300px;"> <input name="f_photo" type="file">
		<p>
			펀딩명 :${fundingDetail.f_name} <input name="f_name">
		<p>
			회사명 :${fundingDetail.f_company} <input name="f_company">
		<p>
		
			펀딩 마감 기간:${fundingDetail.f_period} <input type="date" name="f_period">
		<p>
			펀딩 주소: ${fundingDetail.f_url}<input name="f_url">
			<input type="hidden" name="f_num" value="${fundingDetail.f_num}">
		<p>
			<button>등록</button>
	</form>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="funding.reg" method = "post" enctype = "multipart/form-data">
대표 이미지 : <input name="f_photo" type="file">
<p>
펀딩명 : <input name="f_name">
<p>
회사명 : <input name="f_company">
<p>
펀딩 카테고리 : 
<select name="f_category">
<option value="일자리창출">일자리 창출</option>
<option value="친환경">친환경</option>
<option value="기부">기부</option>
<option value="유기동물보호">유기동물 보호</option>

</select>
<p>
펀딩기간: <input type="date" name="f_period">
<p>
펀딩 주소: <input name="f_url">
<p>
<button>등록</button>
</form>


</body>
</html>
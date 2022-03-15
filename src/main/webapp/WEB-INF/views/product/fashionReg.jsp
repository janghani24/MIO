<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>의류 제품 등록</h1>

사진:<input type="file">
<p>
상품 이름:<input type="text">
<p>
상품 가격:<input type="text">
<p>
브랜드:<input type="text">
<p>
상품 상세 정보:<input type="file">
<p>
상품 하위 카테고리
<select name="">
<option value="의류">의류</option>
<option value="가방">가방</option>
<option value="지갑">지갑</option>
<option value="패션소품">패션소품</option>
<option value="케이스">케이스</option>
<option value="신발">신발</option>

</select>
<p>
<div>사이즈 컬러 수량</div>
<ul style="display: contents; position: relative;" id="list"></ul>
<button onclick="doAdd();">옵션 추가</button>
<button onclick="doDelete();">삭제</button>

<p>
등록일자: <input type="date" name="f_period">
<p>
<button>등록</button>

</body>
</html>
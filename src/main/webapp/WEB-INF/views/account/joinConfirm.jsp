<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="joinConfirmTbl">
<tr>
<td colspan="4"><img src="resources/img/image/가입신청승인.jpg"></td>
</tr>
<c:forEach var="s" items="${sellers}">
<tr>
<td><img src="resources/img_account/${s.s_img}" width="200px;"></td>
<td>${s.a_s_id}</td>
<td>${s.s_name}</td>
<td><button onclick="sellerDetail('${s.a_s_id}');" id="gradebutton">자세히 보기</button></td>
</tr>
</c:forEach>
</table>
</body>
</html>
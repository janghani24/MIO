<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		여기 찜한거 불러올거임   ${detail.p_name}  / ${detail} /${detail.p_category1}/${detail.p_photo}
		
		<c:forEach var="z" items="${showZzim }">
			<table border="1">
				<tr>
					<td><img
				src="resources/img/food/0${z.p_num }.jpg" width="150" height="150"></td>
				</tr>
				
				<tr>
					<td >프라이머리 키${z.p_no }</td>
				</tr>
				<tr>
					<td >상품번호${z.p_num } </td>
				</tr>
				
				<tr>
					<td >아이디${z.p_id }</td>
				</tr>
				<tr>
					<td ><button onclick="location.href='product.detail?p_num=${z.p_num }'">찜한사이트로이동</button></td>
					
				</tr>
				<tr>
					<td ><button onclick="deletezzim(${z.p_no });">찜해제</button></td>
					
				</tr>
			</table>
		</c:forEach>
</body>
</html>
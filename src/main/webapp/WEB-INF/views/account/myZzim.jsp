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
		
		여기 찜한거 불러올거임   
		
		<c:forEach var="z" items="${showZzim }">
            <table border="1">
                <tr>
                    <td><img
                src="resources/img/${z.p_category1}/${z.p_photo }" width="150" height="150"></td>
                </tr>

                <tr>
                    <td >${z.p_name }</td>
                </tr>


                <tr>
                    <td >카테고리 : ${z.p_category1}</td>
                </tr>
                <tr>
                    <td ><button onclick="location.href='product.detail?p_num=${z.z_num }'">찜한사이트로이동</button></td>

                </tr>
                <tr>
                    <td ><button onclick="deletezzim(${z.z_no });">찜해제</button></td>

                
					
				</tr>
			</table>
		</c:forEach>
</body>
</html>
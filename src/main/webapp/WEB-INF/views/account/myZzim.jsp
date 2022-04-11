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
		
		
            <table id="myzzimTable">
            <tr><td><img src="resources/img/image/찜목록.jpg"></td></tr>
		<c:forEach var="z" items="${showZzim }">
                <tr>
                    <td><img
                src="resources/img/${z.p_category1}/${z.p_photo }" width="150" height="150"
                 onclick="location.href='product.detail?p_num=${z.z_num }'"></td>
                </tr>

                <tr>
                    <td ><a href='product.detail?p_num=${z.z_num }'>${z.p_name}</a></td>
                </tr>


                <tr>
                    <td ><fmt:formatNumber type="number" maxFractionDigits="3" value="${z.p_price}" />원</td>
                </tr>
                
                <tr>
                    <td ><button onclick="deletezzim(${z.z_no });" id="gradebutton">찜해제</button></td>

                
					
				</tr>
		</c:forEach>
			</table>
</body>
</html>
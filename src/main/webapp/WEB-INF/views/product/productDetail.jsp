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
<%int a = 0; %>

	<table border="1">
	

		<tr>
			<td><img
				src="resources/img/${detail.p_category1}/${detail.p_photo}">
			</td>
			
			<td>	
				<table border="1">
					<tr>
						<td>브랜드</td>
						<td>${detail.p_brand}  / </td>
					</tr>
					<tr>
						<td>상품명</td>
						<td>${detail.p_name} / </td>
					</tr>
					<tr>
						<td>상품가</td>
						<td>${detail.p_price}원 / </td>
					</tr>
					<tr>
						<td>옵션/수량 체크 부분${param.p_num} / ${sessionScope.loginAccount.a_id}</td>
					</tr>
					<tr>
					
						
					<c:if test="${sessionScope.loginAccount.a_id != null }">
					
					<c:forEach var="z" items="${showZzim }">
					
				<c:if test="${sessionScope.loginAccount.a_id == z.p_id && z.p_num == param.p_num}">
						
						<td colspan="2"><button onclick="deletezzim2(${z.p_no });">찜해제</button></td>
						<%  a = 1; %>
				</c:if>
				
				</c:forEach>
				
				</c:if>
		<%if(a == 0) {%>
				
				<td colspan="2"><button onclick="zzim(${param.p_num}, '${sessionScope.loginAccount.a_id}');">찜하기</button></td>
			<%	} %>	
		
					</tr>
				</table>
			</td>

		</tr>
		<tr>
			<td colspan="2"><img
				src="resources/img/${detail.p_category1}/${detail.p_content}"></td>
		</tr>

		<tr>
			<td colspan="2">후기(상품평 작성하기 칸)</td>
		</tr>



	</table>

</body>
</html>
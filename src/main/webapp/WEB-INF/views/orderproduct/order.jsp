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
	
	
	<br>
	<button id="check_module" type="button">테스트 결제</button>
	
			<table border="1">			
				<tr>
					<td><input id="id" value="${param.id }" type="hidden">아이디${param.id }</td>
				</tr>

				<tr>
					<td><input id="productname" value="${detail.p_name}" type="hidden">${detail.p_name}</td>
				</tr>
				<tr>
					<td><input id="price" value="${detail.p_price}" type="hidden">${detail.p_price}</td>
					
				</tr>
				<tr>
					<td><input id="p_num" value="${detail.p_num }" type="hidden">프덕id${detail.p_num }</ </td>
					
				</tr>
				<tr>
					<td><input id="amount" value="${param.cnt }" type="hidden">${param.cnt }개</td>
			
				</tr>
				<tr>
					<td><img
				src="resources/img/${detail.p_category1}/${detail.p_photo }" width="150" height="150"></td>
					
				</tr>
				<tr>
				<td class="td1">주소</td>
				<td class="td2"><input id="jm_addr3Input" readonly="readonly"
					name="a_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span><br> 
					<input
					id="jm_addr1Input" readonly="readonly" name="a_addr1"
					maxlength="30" autocomplete="off" placeholder="주소"><br>
					
				</tr>
			</table>
	
		
	
</body>
</html>
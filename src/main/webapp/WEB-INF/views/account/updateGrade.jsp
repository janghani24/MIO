<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table id="gradeUpdateTbl">
			<tr>
				<td colspan="5"><img src="resources/img/image/회원 등급 조정.jpg"></td>
			</tr>
			<c:forEach var="a" items="${accounts}">
<form action="account.updateGrade">
				<tr>
					<td>${a.a_id}</td>
					<td>${a.a_name}</td>
					<td>${a.a_grade}</td>
					<td><select name="a_grade">
							<option value="general">일반 회원</option>
							<option value="seller">판매자</option>
					</select>
						<button name="a_id" value="${a.a_id}" id="gradebutton">변경</button></td>
				</tr>
	</form> 
			</c:forEach>
			<tr>
			<td align="center" colspan="4" class="infoTd">
			<c:choose>
			<c:when test="${search != null}">
			<div id="productName">
					<a href="account.paging?p=1&search=${search}"> 맨처음| </a>
					<c:forEach var="p" begin="1" end="${pageCount}">
						<a href="account.paging?p=${p}&search=${search}">${p} |</a>
					</c:forEach>
					<a href="account.paging?p=${pageCount}&search=${search}"> 맨끝 </a>
				</div>
				</c:when>
			<c:otherwise>
			<div id="productName">
					<a href="account.paging?p=1"> 맨처음 | </a>
					<c:forEach var="p" begin="1" end="${pageCount}">
						<a href="account.paging?p=${p}">${p} |</a>
					</c:forEach>
					<a href="account.paging?p=${pageCount}"> 맨끝 </a>
				</div>
			</c:otherwise>
			</c:choose>
				</td></tr>
				<tr>
			<td colspan="5">
				<form action="account.search">
					<input name="search" class="input">
					<button class="smallbutton">검색</button>
				</form>

			</td>
		</tr>
		</table>
</body>
</html>

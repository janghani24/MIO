<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<table border=1 class="itemListTbl">
		<tr>
			<td onclick="location.href='funding.all'">전체보기</td>
			<td onclick="location.href='funding.category?f_category=일자리창출'">일자리
				창출</td>
			<td onclick="location.href='funding.category?f_category=친환경'">친환경</td>
			<td onclick="location.href='funding.category?f_category=기부'">기부</td>
			<td onclick="location.href='funding.category?f_category=유기동물후원'">유기동물
				후원</td>
			<td><c:if
					test="${sessionScope.loginAccount.a_grade eq 'seller' or sessionScope.loginAccount.a_grade eq 'admin'}">
					<button onclick="location.href='funding.regPage'">펀딩 등록</button>
				</c:if></td>
		</tr>

		<tr>
			<td colspan="6"><c:forEach var="f" items="${funding2}">
					<ul>

						<li><a href="${f.f_url}"><img
								src="resources/img/funding/${f.f_photo}" id="fundingImg"
								width="300px;"></a></li>
						<li><a href="${f.f_url}">${f.f_company}</a></li>
						<li>${f.f_name}</li>
						<li><fmt:formatDate value="${f.f_period}"
								pattern="yyyy년 MM월 dd일" />&nbsp;종료</li>
						<c:if test="${f.f_owner == sessionScope.loginAccount.a_id }">
							<li><button onclick="deleteFunding(${f.f_num})">삭제</button></li>
						</c:if>
					</ul>
				</c:forEach></td>
		</tr>
		<tr>
			<td colspan="6">

				<div align="center">
					<a href="funding.search.paging?p=1&search=${search}"> [맨처음] </a>
					<c:forEach var="p" begin="1" end="${pageCount}">
						<a href="funding.search.paging?p=${p}&search=${search}">[${p}]</a>
					</c:forEach>
					<a href="funding.search.paging?p=${pageCount}&search=${search}">
						[맨끝] </a>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<form action="funding.search">
					<input name="search">
					<button>검색</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
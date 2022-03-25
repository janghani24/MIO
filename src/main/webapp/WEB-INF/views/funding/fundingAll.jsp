<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<table class="itemListTbl" border="1">

		<tr>
			<td colspan="5" id="banner"><img
				src="resources/img/image/fundingbanner.png"></td>
		</tr>

		<tr>
			<td onclick="location.href='funding.all'" class="category2"
				width="250px;">전체보기</td>
			<td onclick="location.href='funding.category?f_category=일자리창출'"
				class="category2" width="250px;">일자리 창출</td>
			<td onclick="location.href='funding.category?f_category=친환경'"
				class="category2" width="250px;">친환경</td>
			<td onclick="location.href='funding.category?f_category=기부'"
				class="category2" width="250px;">기부</td>
			<td onclick="location.href='funding.category?f_category=유기동물후원'"
				class="category2" width="250px;">유기동물 후원</td>
		</tr>
		<tr>
			<td colspan="5" id="fundingsearchTbl">
				<form action="funding.search">
					<input name="search">
					<button id="productSearchButton">검색</button>
				</form>
			</td>
		</tr>


		<tr>
			<td colspan="6"><c:forEach var="f" items="${funding2}">
					<ul>

						<li><img src="resources/img/funding/${f.f_photo}"
							id="fundingImg" width="350px;" onclick="fundingGo('${f.f_url}')"></a></li>
						<li id="brand"><span onclick="fundingGo('${f.f_url}')">${f.f_company}</span></li>
						<li id="fundingName"><span onclick="fundingGo('${f.f_url}')">${f.f_name}</span></li>
						<li id="period"><fmt:formatDate value="${f.f_period}"
								pattern="yyyy년 MM월 dd일" />&nbsp;종료</li>
						<c:if test="${f.f_owner == sessionScope.loginAccount.a_id }">
							<li>
								<button onclick="updateFunding(${f.f_num})"
									class="fundingbutton">수정</button>
								<button onclick="deleteFunding(${f.f_num})"
									class="fundingbutton">삭제</button>
							</li>
						</c:if>
					</ul>
				</c:forEach></td>
		</tr>
		<tr>
			<td colspan="5">
				<div align="center">
					<a href="funding.paging?p=1"> [맨처음] </a>
					<c:forEach var="p" begin="1" end="${pageCount}">
						<a href="funding.paging?p=${p}">[${p}]</a>
					</c:forEach>
					<a href="funding.paging?p=${pageCount}"> [맨끝] </a>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="5"><c:if
					test="${sessionScope.loginAccount.a_grade eq 'seller' or sessionScope.loginAccount.a_grade eq 'admin'}">
					<button onclick="location.href='funding.regPage'" id="regButton">펀딩
						등록</button>
				</c:if></td>
		</tr>
	</table>

</body>
</html>
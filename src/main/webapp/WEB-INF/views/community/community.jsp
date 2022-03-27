<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table id="communityTbl" border="1">
	<tr>
			<td id="banner"><img src="resources/img/community/communitybanner.png"></td>
		</tr>
		<tr>

			<form action="community.search" name="snsSearchForm"
				onsubmit="return snsSearchCheck();">
				<td id="communityTd"><input name="search" maxlength="10"
					autocomplete="off" style="color: black;">
					<button style="color: black" class="fundingbutton">검색</button></td>

			</form>
		</tr>
		<tr>
			<td><c:forEach var="m" items="${msgs }">

					<table class="aSNSMsg" border="1">
						<tr>
							<td class="asmImgTd" align="center" valign="top" rowspan="3"><img
								src="resources/img_account/${m.a_img }"></td>

							<td class="asmOwner">${m.c_owner }</td>
							<td class="asmDate"><fmt:formatDate value="${m.c_date }" type="both"
									dateStyle="short" timeStyle="short" /></td>
						</tr>
						
						<tr>
							<td class="asmTxt" colspan="2">${m.c_txt }</td>
						</tr>


						<tr>
							<td class="asmReply" colspan="2"><c:forEach var="sr"
									items="${m.c_re }">
									<span class="asmrOwner">${sr.r_owner }</span>&nbsp;${sr.r_txt }&nbsp;
						<span class="asmrWhen"><fmt:formatDate
											value="${sr.r_when }" type="both" dateStyle="short"
											timeStyle="short" /></span>
									<c:if test="${sr.r_owner == sessionScope.loginAccount.a_id }">
										<button onclick="delReply('${sr.r_no}', '${curPage }');"
											id="delButton">삭제</button>
									</c:if>
									<br>
								</c:forEach> <c:if test="${sessionScope.loginAccount != null }">
									<form action="community.reply.write"
										onsubmit="return snsWriteReplyCheck(this);">
										<span class="asmrOwner">
											${sessionScope.loginAccount.a_id } </span> <input type="hidden"
											name="token" value="${token }"> <input type="hidden"
											name="r_c_no" value="${m.c_no }"> <input
											type="hidden" name="p" value="${curPage }"> <input
											class="asmrInput" name="r_txt" maxlength="80"
											autocomplete="off">
										<button class="asmrBtn">쓰기</button>
									</form>
								</c:if></td>
						</tr>

						<c:if test="${m.c_owner == sessionScope.loginAccount.a_id }">
							<tr>
								<td colspan="3" align="right">

									<button
										onclick="updateMsg('${m.c_no}', '${m.c_txt}', ${curPage});"
										class="fundingbutton">수정</button>

									<button onclick="delMsg('${m.c_no}');" class="fundingbutton">삭제</button>

								</td>
							</tr>
						</c:if>
					</table>
				</c:forEach></td>
		</tr>

		<tr>
			<td>
				<div align="center">
					<a href="community.page.change?p=1"> [맨처음] </a>
					<c:forEach var="p" begin="1" end="${pageCount}">
						<a href="community.page.change?p=${p}">[${p}]</a>
					</c:forEach>
					<a href="community.page.change?p=${pageCount}"> [맨끝] </a>
				</div>
			</td>
		</tr>
		<tr>
			<!--  로그인한 사람만 쓸 수 있게 -->
			<c:if test="${sessionScope.loginAccount != null }">

				<td align="center">
					<form name="snsWriteForm" action="community.write" method="get">
						<input type="hidden" name="token" value="${token }">
						<table>
							<tr>
								<td><textarea name="c_txt" maxlength="200" rows="5"
										cols="60"></textarea></td>
								<td><button id="communitybutton">쓰기</button></td>
							</tr>
						</table>
					</form>

				</td>

			</c:if>
		</tr>








	</table>


</body>
</html>
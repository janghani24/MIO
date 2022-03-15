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
<body onload="init();">
	<%
		int a = 0;
	%>

	<table border="1">


		<tr>
			<td><img
				src="resources/img/${detail.p_category1}/${detail.p_photo}"></td>

			<td>
				<table border="1">
					<tr>
						<td colspan="2">${detail.p_brand}</td>
					</tr>
					<tr>
						<td>상품명</td>
						<td colspan="2">${detail.p_name}</td>
					</tr>
					<tr>
						<td>상품가</td>
						<td colspan="2">${detail.p_price}원</td>
					</tr>
					<tr>
						<td>옵션/수량 체크 부분</td>

						<td>

							<form name="form" method="get">
							
								<input name="sell_price" value="${detail.p_price}"> 
								
								수량 :
								<input type="button" value=" + " onclick="add();"> 
								<input type="number" name="amount" value="1" size="3" onchange="change();"> 
								<input type="button" value=" - "onclick="del();"><br> 
								
								금액 : <input type="text" name="sum" size="11" readonly>원
							</form>
						</td>
					</tr>
					<tr>
						<td><button>구매하기</button></td>
						<td><button>장바구니</button></td>

						<c:if test="${sessionScope.loginAccount.a_id != null }">

							<c:forEach var="z" items="${showZzim }">

								<c:if
									test="${sessionScope.loginAccount.a_id == z.p_id && z.p_num == param.p_num}">

									<td colspan="2"><button onclick="deletezzim2(${z.p_no });">찜해제</button></td>
									<%
										a = 1;
									%>
								</c:if>

							</c:forEach>

						</c:if>
						<%
							if (a == 0) {
						%>
						<c:if test="${sessionScope.loginAccount.a_id != null }">

							<td colspan="2"><button
									onclick="zzim(${param.p_num}, '${sessionScope.loginAccount.a_id}');">찜하기</button></td>
						</c:if>
						<%
							}
						%>

					</tr>
				</table>
			</td>

		</tr>
		<tr>
			<td colspan="2"><img
				src="resources/img/${detail.p_category1}/${detail.p_content}"></td>
		</tr>

		<tr>
			<td colspan="2">
			<c:forEach var="pr" items="${replys}">
						<span class="asmrOwner">${pr.r_owner}</span>
						<span>${pr.r_rate}</span>
						-&nbsp;${pr.r_txt }&nbsp;
						<span class="asmrWhen">(<fmt:formatDate value="${pr.r_date}" type="both" dateStyle="short" timeStyle="short"/>)</span>
						<c:if test="${pr.r_owner == sessionScope.loginAccount.a_id }">
							<button class="asmrBtn" 
							onclick="deleteReply(${pr.r_no}, ${curPage });">삭제</button>
						</c:if>
						<br>
					</c:forEach>
					<br>
			<c:if test="${sessionScope.loginAccount != null }">
						<form action="product.reply.write">
							<span>
								${sessionScope.loginAccount.a_id }
							</span> 
							<input type="hidden" name="token" value="${token }">
							<input type="hidden" name="r_p_no" value="${param.p_num}">
						<%-- 	<input type="hidden" name="p" value="${curPage }"> --%>
							<input name="r_txt" maxlength="300" autocomplete="off">
							<select name="r_rate">
							<option value="1">1</option>
							</select>
							<button name="p_num" value="${param.p_num}">쓰기</button>
						</form>
					</c:if>
			
			</td>
		</tr>



	</table>

					

</body>
</html>
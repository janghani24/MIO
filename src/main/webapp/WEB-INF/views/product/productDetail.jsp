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
				src="resources/img/${detail.p_category1}/${detail.p_photo}" width="800px;"></td>

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
								<input name="sell_price" value="${detail.p_price}" type="hidden"> 
								수량 :<input type="button" value=" + " onclick="add();"> 
								<input type="text" id="amount" value="1" size="3" onchange="change();"> 
								<input type="button" value=" - " onclick="del();"><br> 

								금액 : <input type="text" name="sum" size="11" readonly>원
							</form>
						</td>
					</tr>
					<tr>
						<td><button>구매하기</button></td>
						<td><button onclick="goCart('${sessionScope.loginAccount.a_id}',${param.p_num},${detail.p_price},'${detail.p_category1}','${detail.p_photo}')">장바구니</button></td>

						<c:if test="${sessionScope.loginAccount.a_id != null }">

							<c:forEach var="z" items="${showZzim }">

								<c:if
									test="${sessionScope.loginAccount.a_id == z.z_id && z.z_num == param.p_num}">

<<<<<
									<td colspan="2"><button onclick="deletezzim2(${z.z_no },${param.p_num});">찜해제</button></td>
>>>>>
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
				src="resources/img/${detail.p_category1}/${detail.p_content}" width="800px;">
				<br>
				<c:if test="${detail.p_owner == sessionScope.loginAccount.a_id }">
				<button onclick="deleteProduct(${param.p_num})">삭제</button>
				</c:if>
				</td>
		</tr>

		<tr>
			<td colspan="2"><c:forEach var="pr" items="${replys}">
					<span class="asmrOwner">${pr.r_owner}</span>
				<span class="starR1" value='${pr.r_rate}'></span>
						-&nbsp;${pr.r_txt }&nbsp;
						<span class="asmrWhen">(<fmt:formatDate
							value="${pr.r_date}" type="both" dateStyle="short"
							timeStyle="short" />)
					</span>
					<c:if test="${pr.r_owner == sessionScope.loginAccount.a_id }">
						<button class="asmrBtn"
							onclick="deleteReply(${pr.r_no},${param.p_num});">삭제</button>
					</c:if>
					<br>
				</c:forEach> <br> <c:if test="${sessionScope.loginAccount != null }">
					<form action="product.reply.write" name="productReply">
						<span> ${sessionScope.loginAccount.a_id } </span> <input
							type="hidden" name="token" value="${token }"> <input
							type="hidden" name="r_p_no" value="${param.p_num}">
						<%-- 	<input type="hidden" name="p" value="${curPage }"> --%>
						<div id="star">
						<a href="#;" class="starR on" value="1">★</a>						
						<a href="#;" class="starR" value="2">★</a>						
						<a href="#;" class="starR" value="3">★</a>						
						<a href="#;" class="starR" value="4">★</a>						
						<a href="#;" class="starR" value="5">★</a>						
						</div>
						<input name="r_txt" maxlength="300" autocomplete="off">
						<input type="hidden" name="r_rate" value="1">
						<button name="p_num" value="${param.p_num}">쓰기</button>
					</form>
				</c:if></td>
		</tr>



	</table>

					<!-- 주문 form -->
			<form action="/order/${member.memberId}" method="get" class="order_form">
				<input type="hidden" name="orders[0].bookId" value="${goodsInfo.bookId}">
				<input type="hidden" name="orders[0].bookCount" value="">
			</form>
			
			<script type="text/javascript">
			/* 바로구매 버튼 */
			$(".btn_buy").on("click", function(){
				let bookCount = $(".quantity_input").val();
				$(".order_form").find("input[name='orders[0].bookCount']").val(bookCount);
				$(".order_form").submit();
			});
			
			</script>

</body>
</html>
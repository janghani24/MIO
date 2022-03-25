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
<script type="text/javascript">
$(".btn_buy").on("click", function(){
	let productCountCount = $(".amount").val();
	$(".order_form").find("input[name='orders[0].productCount']").val(productCount);
	$(".order_form").submit();
});
</script>
<body onload="init();">
	<%
		int a = 0;
	%>

	<table border="1" class="productDetailTbl">


		<tr>
			<td id="pdImg"><img
				src="resources/img/${detail.p_category1}/${detail.p_photo}"></td>

			<td>
				<table border="1" id="productOptionTbl">
					<tr>
						<td colspan="5" id="pdBrand">${detail.p_brand}</td>
					</tr>
					<tr>
						<td id="pdName" colspan="3">${detail.p_name}</td>
					</tr>
					<tr>
						<td id="pdPrice">상품가</td>
						<td colspan="2" id="pdPrice2">${detail.p_price}원</td>
					</tr>
					<tr>
						<td id="pdQuantity">옵션/수량 체크</td>
						<td id="pdQuantity2" colspan="2">
								<c:if test="${fashionDetail.d_size !=null}">
							사이즈 : ${fashionDetail.d_size}<br>
							컬러 : ${fashionDetail.d_color}
								</c:if>

							<form name="form" method="get">

								<input type="hidden" name="sell_price" value="${detail.p_price}"> 

								수량 &nbsp; &nbsp;<input type="button" value=" + " onclick="add();"> 
								<input type="text" id="amount" value="1" size="3" onchange="change();"> 
								<input type="button" value=" - " onclick="del();"><br> 

								

								금액  &nbsp; &nbsp;<input type="text" name="sum" size="11" readonly>원
							</form>
						</td>
					</tr>
					
					<tr>

						<td><button id="buyBtn" onclick="productorder(${param.p_num}, '${sessionScope.loginAccount.a_id}');">구매하기</button></td>
						<td><button id="cartBtn" onclick="goCart('${sessionScope.loginAccount.a_id}',${param.p_num},${detail.p_price},'${detail.p_category1}','${detail.p_photo}')">장바구니</button></td>


						<c:if test="${sessionScope.loginAccount.a_id != null }">

							<c:forEach var="z" items="${showZzim }">

								<c:if
									test="${sessionScope.loginAccount.a_id == z.z_id && z.z_num == detail.p_num}">


									<td colspan="2"><button id="zzimBtn" onclick="deletezzim2(${z.z_no },${detail.p_num});">찜해제</button></td>

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


							<td colspan="2"><button id="zzimBtn"
									onclick="zzim(${detail.p_num}, '${sessionScope.loginAccount.a_id}');">찜하기</button></td>
						</c:if>
						<%
							}
						%>

					</tr>
				</table>
			</td>

		</tr>
		<tr>
			<td colspan="2" id="pdContent"><img
				src="resources/img/${detail.p_category1}/${detail.p_content}" width="800px;">
				
				</td>
		</tr>
		
		<tr>
		<td colspan="2"><c:if test="${detail.p_owner == sessionScope.loginAccount.a_id }">
				<button id="delBtn" onclick="deleteProduct(${detail.p_num})">삭제</button>
				<button id="reBtn" onclick="updateProduct(${detail.p_num},'${detail.p_category1}')">수정</button>
				</c:if></td>
		</tr>

		<tr>
			<td colspan="2" id="pdReply"><c:forEach var="pr" items="${replys}">
					<span>${pr.r_owner}</span>
				<span class="starR1" value='${pr.r_rate}'></span>
						-&nbsp;${pr.r_txt }&nbsp;
						<span>(<fmt:formatDate
							value="${pr.r_date}" type="both" dateStyle="short"
							timeStyle="short" />)
					</span>
					<c:if test="${pr.r_owner == sessionScope.loginAccount.a_id }">
						<button 
							onclick="deleteReply(${pr.r_no},${detail.p_num});">삭제</button>
					</c:if>
					<br>
				</c:forEach> <br> <c:if test="${sessionScope.loginAccount != null }">
					<form action="product.reply.write" name="productReply" onsubmit="return replyCheck();">
						<span> ${sessionScope.loginAccount.a_id } </span> <input
							type="hidden" name="token" value="${token }"> <input
							type="hidden" name="r_p_no" value="${detail.p_num}">
						<div id="star">
						<a href="#;" class="starR on" value="1">★</a>						
						<a href="#;" class="starR" value="2">★</a>						
						<a href="#;" class="starR" value="3">★</a>						
						<a href="#;" class="starR" value="4">★</a>						
						<a href="#;" class="starR" value="5">★</a>						
						</div>
						<input name="r_txt" maxlength="300" autocomplete="off" placeholder="300자 이내로 작성해주세요.">
						<input type="hidden" name="r_rate" value="1">
						<button name="p_num" value="${detail.p_num}">쓰기</button>
					</form>
				</c:if></td>
		</tr>



	</table>

		

</body>
</html>
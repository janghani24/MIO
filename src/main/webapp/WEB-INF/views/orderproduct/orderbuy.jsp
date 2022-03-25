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
	<table id="orderbuyTbl">
		<tr>
			<td colspan="2"><img src="resources/img/image/구매내역.jpg"></td>
		</tr>
		<c:forEach var="o" items="${order }">
			<tr>
			<td rowspan="7"><img src="resources/img/${o.p_category1}/${o.p_photo }"
					width="200px;"></td>
				<td class="orderTd">주문넘버:&nbsp;${o.orderId }</td>
			</tr>
			<tr>
				<td class="orderTd">개수:&nbsp;${o.productCount }</td>

			</tr>
			<tr>
				<td class="orderTd">가격: &nbsp;${o.productPrice }</td>

			</tr>
			<tr>
				<td class="orderTd">주소:&nbsp;${o.memberAddr1 }</td>

			</tr>
			<tr>
				<td class="orderTd">주소:&nbsp;${o.memberAddr2 }</td>

			</tr>
			<tr>
				<td class="orderTd">구매상태:&nbsp;${o.orderState }</td>

			</tr>
			<tr>
				<td class="orderTd">구매날짜 :&nbsp;<fmt:formatDate value="${o.orderDate }"
						pattern="yyyy년 MM월 dd일 HH:mm:ss" />
				</td>

			</tr>
			
			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>
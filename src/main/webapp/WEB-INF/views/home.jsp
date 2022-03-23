<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>.bx-wrapper {margin-bottom: 0px;}
</style>
</head>
<body>
	<table border="1">

		<tr>
			<td colspan="3" class="slideArray" colspan="3">
				<div class="bxslider">
					<div>
						<img src="resources/img/image/slide1.jpg">
					</div>
					<div>
						<img src="resources/img/image/slide2.jpg">
					</div>
					<div>
						<img src="resources/img/image/slide3.jpg">
					</div>
					<div>
						<img src="resources/img/image/slide4.jpg">
					</div>
				</div>
			</td>
		</tr>


		<tr>
			<td id="FundingImg" colspan="3"><img
				src="resources/img/image/fundingImg.jpg"></td>
		</tr>

		<tr>
			<td>
			<c:forEach var="p" items="${productr}">
					<ul>
						<li onclick="location.href='product.detail?p_num=${p.p_num}'"><img
							src="resources/img/${p.p_category1}/${p.p_photo}" width="350px;"></li>

						<li>${p.p_brand}</li>
						<li><a href="product.detail?p_num=${p.p_num}">${p.p_name}</a></li>
						<li><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${p.p_price}" />원</li>
					</ul>
				</c:forEach>
			
			
			</td>
		</tr>

	</table>

</body>
</html>
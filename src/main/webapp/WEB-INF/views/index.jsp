<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/community_css.css">
<link rel="stylesheet" href="resources/css/replyStar.css">
<link rel="stylesheet" href="resources/css/account.css">
<link rel="stylesheet" href="resources/css/product.css">
<link rel="stylesheet" href="resources/css/funding.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="resources/js/idCheck_account.js"></script>
<script type="text/javascript" src="resources/js/check_account.js"></script>
<script type="text/javascript" src="resources/js/check_product.js"></script>
<script type="text/javascript" src="resources/js/check_funding.js"></script>
<script type="text/javascript" src="resources/js/go_account.js"></script>
<script type="text/javascript" src="resources/js/go_community.js"></script>
<script type="text/javascript" src="resources/js/go_product.js"></script>
<script type="text/javascript" src="resources/js/go_funding.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/site_jquery.js"></script>
<script type="text/javascript" src="resources/js/product_count.js"></script>

<script type="text/javascript" src="resources/js/option_add.js"></script>

<script type="text/javascript" src="resources/js/replyStar.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		$('.subMenu').hide();

		$('#topMenu').mouseover(function() {
			$('.subMenu').slideDown();
			$('.subMenu').mouseover(function() {
				$('.subMenu').stop();

			});

		});

		$('.subMenu').mouseleave(function() {
			$('.subMenu').slideUp();
		});

	});
</script>


</head>
<body>
<c:if test="${sessionScope.loginAccount != null }">
<div> <a href="account.logout">로그아웃</a> </div>
<div> <a href="product.go.cart">장바구니</a> </div>
</c:if>
	<table border="1" id="wrapTable">
		<tr>
			<!-- left side -->
			<td id="leftside">
				<table border="1">
					<tr>
						<td><a href="/mio">MIO</a></td>
					</tr>
					<c:choose>
						<c:when test="${sessionScope.loginAccount != null }">
							<tr>
								<td><a href="account.mypage">mypage</a></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td><a href="account.login.go">login</a></td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td id="topMenu"><a href="product.all">Product</a></td>
					</tr>
					<tr>
						<td class="subMenu"><a href="product.category?p_category1=food">Food</a></td>
					</tr>
					<tr>
						<td class="subMenu"><a href="product.category?p_category1=fashion">Fashion</a></td>
					</tr>
					<tr>
						<td class="subMenu"><a href="product.category?p_category1=beauty">Beauty</a></td>
					</tr>
					<tr>
						<td class="subMenu"><a href="product.category?p_category1=living">Living</a></td>
					</tr>


					<tr>
						<td id="topMenu"><a href="funding.all">Funding</a></td>
					</tr>
					<tr>
						<td id="topMenu"><a href="community.go">Community</a></td>
					</tr>

				</table>

			</td>
			<!-- left side -->


			<!-- right side -->



			<td><jsp:include page="${contentPage}"></jsp:include></td>

			<!-- right side -->
		</tr>

	</table>
</body>
</html>
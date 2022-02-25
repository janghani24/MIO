<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/index.css">
<script type="text/javascript" src="resources/js/check_account.js"></script>
<script type="text/javascript" src="resources/js/go_account.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/site_jquery.js"></script>
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
	<table border="1" id="wrapTable">
		<tr>
			<!-- left side -->
			<td id="leftside">
				<table border="1">
					<tr>
						<td>MIO</td>
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
						<td id="topMenu">Product</td>
					</tr>
					<tr>
						<td class="subMenu"><a href="product.food.all">Food</a></td>
					</tr>
					<tr>
						<td class="subMenu"><a href="product.fashion.all">Fashion</a></td>
					</tr>
					<tr>
						<td class="subMenu">Beauty</td>
					</tr>
					<tr>
						<td class="subMenu">Living</td>
					</tr>


					<tr>
						<td>Funding</td>
					</tr>
					<tr>
						<td>Community</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/product.css">
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
<script type="text/javascript" src="resources/js/index.js"></script>
<script type="text/javascript" src="resources/js/slider.js"></script>
	<script type="text/javascript" src="resources/js/order.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="resources/js/option_add.js"></script>
<script type="text/javascript" src="resources/js/replyStar.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

</head>


<body>



	<table id="wrapTable">
		<tr>
			<!-- left side -->
			<td id="leftside">
				<table id="indexcategory">
					<tr>
						<td colspan="3"><a href="/mio"><img id="logo"
								src="resources/img/image/logo1.png"></a></td>
					</tr>
					<tr>
						<c:if test="${sessionScope.loginAccount != null }">
							<td class="leftLogin"><a href="account.logout">로그아웃</a></td>

							<td class="leftLogin"><a href="product.go.cart">장바구니</a></td>
							
							<td class="leftLogin"><a href="product.orderbuy">구매내역</a></td>

						</c:if>
					</tr>
					<c:choose>
						<c:when test="${sessionScope.loginAccount != null }">
							<tr>
								<td id="topMenu" colspan="3"><a href="account.mypage">My
										Page</a></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>

								<td id="topMenu" colspan="3"><a href="account.login.go">Login</a></td>

		
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td id="topMenu" colspan="3"><a href="product.all">Product</a></td>
					</tr>
					<tr>
						<td class="subMenu" colspan="3"><a
							href="product.category?p_category1=food">Food</a></td>
					</tr>
					<tr>
						<td class="subMenu" colspan="3"><a
							href="product.category?p_category1=fashion">Fashion</a></td>
					</tr>
					<tr>
						<td class="subMenu" colspan="3"><a
							href="product.category?p_category1=beauty">Beauty</a></td>
					</tr>
					<tr>
						<td class="subMenu" colspan="3"><a
							href="product.category?p_category1=living">Living</a></td>
					</tr>


					<tr>
						<td id="topMenu" colspan="3"><a href="funding.all">Funding</a></td>
					</tr>
					<tr>

						<td id="topMenu"  colspan="3"><a href="community.go">Community</a></td>

					</tr>

				</table>

			</td>
			<!-- left side -->


			<!-- right side -->



			<td class="contentPage"><jsp:include page="${contentPage}"></jsp:include></td>

			<!-- right side -->

		</tr>

		<tr>
			<td colspan="2" id="footer">
			Final Project MIO<br>		
			장하늬 정유진 윤지호 여동재<br>기간 : 2022.02.21~2022.03.25</td>
		</tr>


	</table>
</body>
</html>
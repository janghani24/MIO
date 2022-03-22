<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.loginAccount.a_grade eq 'seller' or sessionScope.loginAccount.a_grade eq 'admin'}">
<button onclick="location.href='product.beautyReg'">상품 등록</button>
</c:if>
<table border="1">
		<tr>
			<td onclick="location.href='product.category?p_category1=beauty'">전체 상품</td>
			<td onclick="location.href='product.category.category2?p_category1=beauty&p_category2=스킨케어'">스킨케어</td>
			<td onclick="location.href='product.category.category2?p_category1=beauty&p_category2=바디케어'">바디케어</td>
			<td onclick="location.href='product.category.category2?p_category1=beauty&p_category2=메이크업'">메이크업</td>
			<td onclick="location.href='product.category.category2?p_category1=beauty&p_category2=선케어'">선케어</td>
		</tr>
	</table>

	<c:forEach var="b" items="${productc}">
		<ul>
			<li onclick="location.href='product.detail?p_num=${b.p_num}'"><img
				src="resources/img/beauty/${b.p_photo}" width="500px;"></li>
				
			<li>${b.p_brand}</li>
			<li>${b.p_name}</li>
			<li>${b.p_price}원</li>
		</ul>
	</c:forEach>
<div align="center" >
         	  <a href="product.category.paging?p=1&p_category1=${category}&p_category2=${p_category2}"> [맨처음] </a>
            <c:forEach var="p" begin="1" end="${pageCount}">
               <a href="product.category.paging?p=${p}&p_category1=${category}&p_category2=${p_category2}">[${p}]</a>
            </c:forEach>
               <a href="product.category.paging?p=${pageCount}&p_category1=${category}&p_category2=${p_category2}"> [맨끝] </a>
         </div>
</body>
</html>
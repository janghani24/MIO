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
<button onclick="location.href='product.livingReg'">상품 등록</button>
</c:if>
	<table border="1">
		<tr>

			<td onclick="location.href='product.living.all'">전체 상품</td>
			<td onclick="location.href='product.category.category2?p_category1=living&p_category2=주방용품'">주방
				용품</td>
			<td onclick="location.href='product.category.category2?p_category1=living&p_category2=욕실용품'">욕실
				용품</td>
			<td onclick="location.href='product.category.category2?p_category1=living&p_category2=생활용품'">생활
				용품</td>
			<td onclick="location.href='product.category.category2?p_category1=living&p_category2=문구'">문구</td>
		</tr>
	</table>

	<c:forEach var="l" items="${productc}">
		<ul>
			<li onclick="location.href='product.detail?p_num=${l.p_num}'"><img
				src="resources/img/living/${l.p_photo}" width="500px;"></li>
			<li>${l.p_brand}</li>
			<li>${l.p_name}</li>
			<li>${l.p_price}원</li>

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
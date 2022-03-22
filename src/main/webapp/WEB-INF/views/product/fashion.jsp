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
<button onclick="location.href='product.fashionReg'">상품 등록</button>
</c:if>
	<table border="1">
		<tr>
			<td onclick="location.href='product.category?p_category1=fashion'">전체 상품</td>
			<td onclick="location.href='product.category.category2?p_category1=fashion&p_category2=의류'">의류</td>
			<td onclick="location.href='product.category.category2?p_category1=fashion&p_category2=가방'">가방</td>
			<td onclick="location.href='product.category.category2?p_category1=fashion&p_category2=지갑'">지갑</td>
			<td onclick="location.href='product.category.category2?p_category1=fashion&p_category2=패션소품'">패션 소품</td>
			<td onclick="location.href='product.category.category2?p_category1=fashion&p_category2=케이스'">케이스</td>
			<td onclick="location.href='product.category.category2?p_category1=fashion&p_category2=신발'">신발</td>
		</tr>
	</table>

	<c:forEach var="f" items="${productc}">
		<ul>
			<li onclick="location.href='product.detail?p_num=${f.p_num}'"><img
				src="resources/img/${f.p_category1}/${f.p_photo}" width="500px;"></li>
			<li>${f.p_brand}</li>
			<li>${f.p_name}</li>
			<li>${f.p_price}원</li>
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
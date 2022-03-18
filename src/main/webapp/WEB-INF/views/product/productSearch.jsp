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


<form action="product.search">
		<input name="search">
		<button>검색</button>
	</form>

	<table border=1 id="tbl">
		<tr>
			<td><a href="product.food.all">Food</a></td>
			<td><a href="product.fashion.all">Fashion</a></td>
			<td><a href="product.beauty.all">Beauty</a></td>
			<td><a href="product.living.all">Living</a></td>
		</tr>
	</table>

<table>

</table>

	<c:forEach var="p" items="${products}">

		<ul>
			<li onclick="location.href='product.detail?p_num=${p.p_num}'"><img
				src="resources/img/${p.p_category1}/${p.p_photo}"></li>

			<li>${p.p_brand}</li>
			<li>${p.p_name}</li>
			<li>${p.p_price}원</li>
		</ul>
	</c:forEach>
	<div align="center" >
         	  <a href="product.paging?p=1"> [맨처음] </a>
            <c:forEach var="p" begin="1" end="${pageCount}">
               <!-- 페이지 카운터를 누르면 해당 페이지로 이동함 -->
               <a href="product.paging?p=${p}">[${p}]</a>
            </c:forEach>
               <a href="product.paging?p=${pageCount}"> [맨끝] </a>
         </div>

</body>
</html>
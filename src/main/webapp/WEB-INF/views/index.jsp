<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/index.css">
<title>Insert title here</title>
</head>
<body>
<table border="1">
		<tr>
			<!-- left side -->
			<td id="leftside">
				<table border="1">
					<tr>
						<td>MIO</td>
					</tr>
					<tr>
						<td>login</td>
					</tr>
					<tr>
						<td><a href="ProductController">Product</a></td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="account.searchPw" name="pwSearchForm" onsubmit="return searchPwCheck();">
	<table border="1" id="accountSearchTbl">
		<tr>
			<td colspan="2"><img src="resources/img/image/pw.jpg"></td>
		</tr>
		<tr>
			<td colspan="2" id="idpadding">ID <input name="a_id"></td>
		</tr>
		<tr>
			<td >PW 찾기 질문</td>
				<td><select name="a_question">
						<option value="q1">질문1</option>
						<option value="q2">질문2</option>
						<option value="q3">질문3</option>
						<option value="q4">질문4</option>
				</select></td>
		</tr>
		<tr>
			<td colspan="2" class="padding">PW찾기 답 <input name="a_answer"></td>
		</tr>
		<tr>

			<td colspan="2" class="padding"><button class="button">PW찾기</button>
				</td>
		</tr>
	</table>
</form>
</body>
</html>
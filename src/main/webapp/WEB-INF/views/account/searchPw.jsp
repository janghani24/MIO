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
	<table id="accountSearchTbl">
		<tr>
			<td colspan="2"><img src="resources/img/image/pw.jpg"></td>
		</tr>
		<tr>
			<td colspan="2" id="idpadding">ID <input name="a_id"></td>
		</tr>
		<tr>
			<td colspan="2">PW 찾기 질문
				<select name="a_question">
						<option value="q1">가장 좋아하는 과일은?</option>
						<option value="q2">가장 친한 친구의 이름은?</option>
						<option value="q3">가장 인상깊게 본 영화제목은?</option>
						<option value="q4">가장 인상깊게 읽은 책 제목은?</option>
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
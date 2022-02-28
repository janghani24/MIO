<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<form action="account.join"
		method="post" enctype="multipart/form-data"
		name="joinForm" onsubmit="return joinCheck();">
		<table id="joinTable">
			<tr>
				<td id="joinTableTitle" colspan="2" align="center">
					회원가입
				</td>
			</tr>
			<tr>
				<td class="td1">ID</td>
				<td class="td2">
				<input id="join_idInput" name="a_id" placeholder="필수, 영어/숫자로만 입력해주세요." maxlength="20" autocomplete="off" autofocus="autofocus">
				<div id="id_check"></div>
				<input type="hidden" id="idCheckOk" value="idUncheck">
				</td>
			</tr>
			<tr>
				<td class="td1">PW</td>
				<td class="td2">
				<input name="a_pw" placeholder="필수,영어/숫자 하나이상 반드시" type="password" maxlength="20" autocomplete="off"></td>
			</tr>
			<tr>
				<td class="td1">PW확인</td>
				<td class="td2">
				<input name="a_pwChk" placeholder="위의 PW와 같게 입력해주세요." type="password" maxlength="20" autocomplete="off"></td>
			</tr>
			<tr>
				<td class="td1">이름</td>
				<td class="td2">
				<input name="a_name" placeholder="필수, 한글로 작성" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td class="td1">주소</td>
				<td class="td2">
					<input id="jm_addr3Input" readonly="readonly" name="a_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span><br>
					<input id="jm_addr1Input" readonly="readonly" name="a_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
					<input name="a_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td class="td1">휴대전화 번호</td>
				<td class="td2">
				<input name="a_phone" placeholder="필수" maxlength="10" autocomplete="off" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td class="td1">사진</td>
				<td class="td2">
				<input name="a_img" type="file"></td>
			</tr>
			<tr>
				<td class="td1">비밀번호 찾기 질문</td>
				<td class="td2">
				<select name="a_question">
				<option value="q1">질문1</option>
				<option value="q2">질문2</option>
				<option value="q3">질문3</option>
				<option value="q4">질문4</option>
				</select></td>
			</tr>
			<tr>
				<td class="td1">비밀번호 찾기 답</td>
				<td class="td2">
				<input name="a_answer" placeholder="30자 이내로 작성해주세요." maxlength="30"autocomplete="off" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>소개글</td>
				<td><textarea name="s_intro" placeholder="500자 이내로 작성해주세요."></textarea></td>
			</tr>
			<tr>
				<td>판매 종류</td>
				<td><select name="sellSort">
						<option value="fasion">패션</option>
						<option value="beauty">뷰티</option>
						<option value="food">푸드</option>
						<option value="lifestyle">라이프스타일</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2">
					<button name="a_grade" value="seller">가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
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
	<form action="account.join.seller" method="post"
		enctype="multipart/form-data" name="joinForm"
		onsubmit="return joinChecks();">
		<table id="joinTable" border="1">
			<tr>
				<td id="joinTableTitle" colspan="2" align="center"><img
					src="resources/img/image/회원가입.jpg"></td>
			</tr>
			<tr>
				<td class="infoTd1">ID</td>
				<td class="infoTd"><input id="join_idInput" class="input"
					name="a_s_id" placeholder="필수, 영어/숫자로만.6자 이상" maxlength="20"
					autocomplete="off" autofocus="autofocus" size=25>
					<div id="id_check"></div> <input type="hidden" id="idCheckOk"
					value="idUncheck"></td>
			</tr>
			<tr>
				<td class="infoTd1">PW</td>
				<td class="infoTd"><input name="s_pw" class="input"
					placeholder="필수,영어/숫자 하나이상.6자 이상" type="password" maxlength="20"
					autocomplete="off" size=25></td>
			</tr>
			<tr>
				<td class="infoTd1">PW확인</td>
				<td class="infoTd"><input name="s_pwChk" class="input"
					placeholder="위의 PW와 같게 입력해주세요." type="password" maxlength="20"
					autocomplete="off" size=25></td>
			</tr>
			<tr>
				<td class="infoTd1">이름</td>
				<td class="infoTd"><input name="s_name" class="input"
					placeholder="필수" maxlength="10" autocomplete="off" size=25></td>
			</tr>
			<tr>
				<td class="infoTd1">주소</td>
				<td class="infoTd"><input id="jm_addr3Input" class="input"
					readonly="readonly" name="s_addr3" maxlength="5" autocomplete="off"
					placeholder="우편번호">
					<button type="button" id="addrSearchBtn" class="smallbutton">검색</button>
					<br> <input id="jm_addr1Input" class="input"
					readonly="readonly" name="s_addr1" maxlength="30"
					autocomplete="off" placeholder="주소" size=28><br> <input
					name="s_addr2" class="input" maxlength="30" autocomplete="off"
					placeholder="상세주소" size=28></td>
			</tr>
			<tr>
				<td class="infoTd1">휴대전화 번호</td>
				<td class="infoTd"><input name="s_phone" class="input"
					placeholder="필수,-없이 숫자만 입력해주세요." maxlength="11" autocomplete="off"
					autofocus="autofocus" size=25></td>
			</tr>
			<tr>
				<td class="infoTd1">사진</td>
				<td class="infoTd"><input name="s_img" type="file"></td>
			</tr>
			<tr>
				<td class="infoTd1">비밀번호 찾기 질문</td>
				<td class="infoTd"><select name="s_question">
						<option value="q1">가장 좋아하는 과일은?</option>
						<option value="q2">가장 친한 친구의 이름은?</option>
						<option value="q3">가장 인상깊게 본 영화제목은?</option>
						<option value="q4">가장 인상깊게 읽은 책 제목은?</option>
				</select></td>
			</tr>
			<tr>
				<td class="infoTd1">비밀번호 찾기 답</td>
				<td class="infoTd"><input name="s_answer" class="input"
					placeholder="30자 이내로 작성해주세요." maxlength="30" autocomplete="off"
					autofocus="autofocus" size=25></td>
			</tr>
			<tr>
				<td class="infoTd1">소개글</td>
				<td class="infoTd"><textarea name="s_intro" maxlength="500"
						placeholder="500자 이내로 작성해주세요." rows="5" cols="40" id="communitytxt"></textarea></td>
			</tr>
			<tr>
				<td class="infoTd1">판매 종류</td>
				<td class="infoTd"><select name="s_sellsort">
						<option value="fasion">패션</option>
						<option value="beauty">뷰티</option>
						<option value="food">푸드</option>
						<option value="lifestyle">라이프스타일</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2">
					<button name="s_grade" value="seller" class="button">가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
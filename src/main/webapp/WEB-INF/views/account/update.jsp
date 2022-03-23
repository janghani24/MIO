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
	<form action="account.update" method="post" enctype="multipart/form-data" name="updateAccountForm" onsubmit="return updateAccountCheck();">
		<table id="accountUpdateTbl" border="1">
			<tr>
				<td id="joinTableTitle" colspan="2" align="center">
					<input readonly="readonly" value="${sessionScope.loginAccount.a_id}" name="jm_id" id="updateAccountIDInput">
				</td>
			</tr>
			<tr>
				<td class="td1">PW</td>
				<td class="td2"><input value="${sessionScope.loginAccount.a_pw}" name="jm_pw" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="20" autocomplete="off"></td>
			</tr>
			<tr>
				<td class="td1">PW확인</td>
				<td class="td2"><input value="${sessionScope.loginAccount.a_pw}" name="jm_pwChk" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="20" autocomplete="off"></td>
			</tr>
			<tr>
				<td class="td1">이름</td>
				<td class="td2"><input value="${sessionScope.loginAccount.a_name}" name="jm_name" placeholder="필수" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
			<td>핸드폰 번호</td>
			<td><input value="${sessionScope.loginAccount.a_phone}" name="jm_phone"></td>
			</tr>
			<tr>
				<td class="td1">주소</td>
				<td class="td2">
					<input id="jm_addr3Input" readonly="readonly" value="${addr[2]}"  name="jm_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span>
					<br>
					<input id="jm_addr1Input" readonly="readonly" value="${addr[0]}"  name="jm_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
					<input value="${addr[1] }"  name="jm_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td class="td1">사진</td>
				<td class="td2">
					<img src="resources/img_account/${sessionScope.loginAccount.a_img}" id="updateMemberPhoto"><br>
					<input name="jm_photo" type="file">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="background-color: #FFFFFF;">
					<button>수정</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>









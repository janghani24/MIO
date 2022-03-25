<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table id="accountInfoTbl" >
			<tr>
				<td id="joinTableTitle" colspan="2" align="center">
					<img src="resources/img/image/회원정보.jpg">
				</td>
			</tr>
			<tr>
				<td class="infoTd1">ID</td>
				<td class="infoTd">${sessionScope.loginAccount.a_id}
				</td>
			</tr>
			
			<tr>
				<td class="infoTd1">이름</td>
				<td class="infoTd">${sessionScope.loginAccount.a_name}
				</td>
			</tr>
			<tr>
				<td class="infoTd1">주소</td>
				<td class="infoTd"> ${addr[0]} ${addr[1]} ${addr[2]}
				</td>
			</tr>
			<tr>
				<td class="infoTd1">휴대전화 번호</td>
				<td class="infoTd">${sessionScope.loginAccount.a_phone}
				</td>
			</tr>
			<tr>
				<td class="infoTd1">사진</td>
				<td class="infoTd"><img src="resources/img_account/${sessionScope.loginAccount.a_img}" width="200px;">
				</td>
			</tr>
			<tr>
				<td class="infoTd1">비밀번호 찾기 질문</td>
				<td class="infoTd">${sessionScope.loginAccount.a_question}
				</td>
			</tr>
			<tr>
				<td class="infoTd1">회원 등급</td>
				<td class="infoTd">${sessionScope.loginAccount.a_grade}
				</td>
			</tr>
			<tr>
				<td colspan="2" class="infoTd">
				<!-- 정보 수정 시 비밀번호 확인 단계 추가 -->
					<button onclick="goUpdate()" class="button">정보 수정</button>
					<button onclick="goDelete()" class="button">탈퇴</button>
					<c:if test="${sessionScope.loginAccount.a_grade eq 'admin'}">
					<!-- 만들어야함 -->
					<button onclick="goGradeUpdate()" class="button">회원 등급 조정</button>
					<button onclick="goJoinConfirm()" class="button">가입 신청 승인</button>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
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
		<table id="joinTable">
			<tr>
				<td id="joinTableTitle" colspan="2" align="center">
					회원 정보
				</td>
			</tr>
			<tr>
				<td class="td1">ID</td>
				<td class="td2">${sessionScope.loginAccount.a_id}
				</td>
			</tr>
			
			<tr>
				<td class="td1">이름</td>
				<td class="td2">${sessionScope.loginAccount.a_name}
				</td>
			</tr>
			<tr>
				<td class="td1">주소</td>
				<td class="td2">${sessionScope.loginAccount.a_addr}
				</td>
			</tr>
			<tr>
				<td class="td1">휴대전화 번호</td>
				<td class="td2">${sessionScope.loginAccount.a_phone}
				</td>
			</tr>
			<tr>
				<td class="td1">사진</td>
				<td class="td2"><img src="resources/img_account/${sessionScope.loginAccount.a_img}" width="200px;">
				</td>
			</tr>
			<tr>
				<td class="td1">비밀번호 찾기 질문</td>
				<td class="td2">${sessionScope.loginAccount.a_question}
				</td>
			</tr>
			<tr>
				<td class="td1">회원 등급</td>
				<td class="td2">${sessionScope.loginAccount.a_grade}
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<!-- 정보 수정 시 비밀번호 확인 단계 추가 -->
					<button onclick="goUpdate()">정보 수정</button>
					<button onclick="goDelete()">탈퇴</button>
					<c:if test="${sessionScope.loginMember eq 'admin'}">
					<!-- 만들어야함 -->
					<button onclick="goGradeUpdate()">회원 등급 조정</button>
					<button onclick="goJoinConfirm()">가입 신청 승인</button>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
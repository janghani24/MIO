// 회원가입 창으로


function zzim(no, id) {
	
	
	let ok = confirm("찜할래요?")
	if (ok) {
		location.href = "product.zzim?p_num=" + no + "&id=" + id;
		
		alert("찜하기 완료")
		
		let ok = confirm("찜목록으로 이동할래요?")
		if(ok){
			location.href = "account.Wishlist"
			
		}
		
	}
}

/* 일단 어카운트에넣음
function deletezzim(no) {
	var ok = confirm("찜해제할래요?");
	if (ok) {
		location.href = "product.deletezzim?p_no=" + no;
	}
}

*/
/*나중에 요긴하게 써보자
 * <c:choose>
					<c:when test="${f.d_owner == sessionScope.loginMember.m_id }">
						<td align="right" onclick="deleteFile(${f.d_no}, '${f.d_file }');">${f.d_owner }</td>
					</c:when>
					<c:otherwise>
						<td align="right">${f.d_owner }</td>
					</c:otherwise>
				</c:choose>
 * 
 * button onclick="location.href='product.zzim?p_num=${param.p_num}&id=${sessionScope.loginAccount.a_id}'"
 


*/
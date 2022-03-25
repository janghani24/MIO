

function delMsg(n) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "community.delete?c_no=" + n;
	}
}

function delReply(n, p) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "community.reply.delete?r_no=" + n + "&p=" + p;
	}
}

function updateMsg(n, t, p) {
	t = prompt("다음으로 수정", t);
	if (t != null && t.length > 0 && t.length < 250) {
		location.href = "community.update?c_no=" + n + "&c_txt=" + t + "&p=" + p;
	}
}



function cmDel(n) {
	var ok = confirm("?");
	if (ok) {
		location.href = "community.delete?c_no=" + n;
	}
}


function sendCommunityMsg(to) {
	var t = prompt("말", t);
	if (t != null && t.length > 0 && t.length < 180) {
		location.href = "community.send?c_to=" + to + "&c_txt=" + t;
	}
}









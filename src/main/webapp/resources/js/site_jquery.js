function connectAddrSearchEvent() {
	$("#addrSearchBtn").click(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#jm_addr3Input").val(data.zonecode);
				$("#jm_addr1Input").val(data.roadAddress);
			}
		}).open();
	});
}

function connectMenuSummonEvent() {
	$("#siteTitleArea").mouseenter(function() {
		$("#siteTitleArea").css("top", "0px");
		$("#siteLoginArea").css("top", "105px");
	});
	$("#siteTitleArea").mouseleave(function() {
		$("#siteTitleArea").css("top", "-40px");
		$("#siteLoginArea").css("top", "65px");
	});
}


function connectSNSWriteFormSummonEvent() {
	var snsWriteFormVisible = false;

	$("#snsWriteFormSummoner").click(function() {
		if (snsWriteFormVisible) {
			$("#snsWriteArea").css("bottom", "-150px");
		} else {
			$("#snsWriteArea").css("bottom", "10px");
		}
		snsWriteFormVisible = !snsWriteFormVisible;
	});
}



function connectSNSSearchFormSummonEvent() {
	var snsSearchFormVisible = false;

	$("#snsSearchFormSummoner").click(function() {
		if (snsSearchFormVisible) {
			$("#snsSearchArea").css("left", "-239px");
		} else {
			$("#snsSearchArea").css("left", "20px");
		}
		snsSearchFormVisible = !snsSearchFormVisible;
	});
}





$(function() {
	connectAddrSearchEvent();
	connectSNSSearchFormSummonEvent();
	connectSNSWriteFormSummonEvent();
});
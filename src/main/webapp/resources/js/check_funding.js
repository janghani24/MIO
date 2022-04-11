function fundingRegCheck(){
	var nameInput = document.fundingRegForm.f_name;
	var photoInput = document.fundingRegForm.f_photo;
	var companyInput = document.fundingRegForm.f_company;
	var dateInput = document.fundingRegForm.f_period;
	var urlInput = document.fundingRegForm.f_url;
	
	let regex = /^(http(s)?:\/\/)([^\/]*)(\.)(com|net|kr|my|shop)(\/)/gi;
	
	if(isEmpty(nameInput)){
		alert("펀딩명을 입력해주세요.");
		nameInput.value="";
		nameInput.focus();
		return false;
	}else if(isEmpty(companyInput)){
		alert("회사명을 입력해주세요.");
		companyInput.value="";
		companyInput.focus();
		return false;
	}else if (isEmpty(photoInput)
			|| (isNotType(photoInput, "png") && isNotType(photoInput, "gif")
					&& isNotType(photoInput, "jpg") && isNotType(photoInput,
					"bmp")&&isNotType(photoInput, "jpeg"))) {
		alert("펀딩 이미지 파일을 확인해주세요.");
		return false;
	}else if(isEmpty(dateInput)){
		alert("펀딩 마감 기간을 설정해주세요.");
		return false;
	}else if(!regex.test(urlInput.value)||isEmpty(urlInput)){
		alert("펀딩 주소를 확인해주세요.");
		urlInput.value="";
		urlInput.focus();
		return false;
	}
	return true;
	
}
function fundingUpdateCheck(){
	var nameInput = document.fundingUpdateForm.f_name;
	var photoInput = document.fundingUpdateForm.f_photo;
	var companyInput = document.fundingUpdateForm.f_company;
	var dateInput = document.fundingUpdateForm.f_period;
	var urlInput = document.fundingUpdateForm.f_url;
	
	let regex = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
	
	if(isEmpty(nameInput)){
		alert("펀딩명을 입력해주세요.");
		nameInput.value="";
		nameInput.focus();
		return false;
	}else if(isEmpty(companyInput)){
		alert("회사명을 입력해주세요.");
		companyInput.value="";
		companyInput.focus();
		return false;
	}else if (isEmpty(photoInput)
			|| (isNotType(photoInput, "png") && isNotType(photoInput, "gif")
					&& isNotType(photoInput, "jpg") && isNotType(photoInput,
					"bmp")&&isNotType(photoInput, "jpeg"))) {
		alert("펀딩 이미지 파일을 확인해주세요.");
		return false;
	}else if(isEmpty(dateInput)){
		alert("펀딩 마감 기간을 설정해주세요.");
		return false;
	}else if(!regex.test(urlInput.value)||isEmpty(urlInput)){
		alert("펀딩 주소를 확인해주세요.");
		urlInput.value="";
		urlInput.focus();
		return false;
	}
	return true;
	
}
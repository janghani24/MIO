function replyCheck(){
	var replyInput = document.productReply.r_txt;
	
	if (isEmpty(replyInput)) {
		alert("내용을 입력해주세요.");
		replyInput.value="";
		replyInput.focus();
		return false;
	}
	return true;
}

function productRegCheck(){
	var nameInput = document.productRegForm.p_name;
	var photoInput = document.productRegForm.p_photo;
	var priceInput = document.productRegForm.p_price;
	var brandInput = document.productRegForm.p_brand;
	var quantityInput = document.productRegForm.p_quantity;
	var contentInput = document.productRegForm.p_content;
	
	if(isEmpty(nameInput)){
		alert("상품 이름을 입력해주세요.");
		nameInput.value="";
		nameInput.focus();
		return false;
	}else if (isEmpty(photoInput)
			|| (isNotType(photoInput, "png") && isNotType(photoInput, "gif")
					&& isNotType(photoInput, "jpg") && isNotType(photoInput,
					"bmp")&&isNotType(photoInput, "jpeg"))) {
		alert("상품 사진을 확인해주세요.");
		return false;
	}else if(isNotNumber(priceInput)||isEmpty(priceInput)){
		alert("상품 가격을 확인해주세요.");
		priceInput.value="";
		priceInput.focus();
		return false;
	}else if(isEmpty(brandInput)){
		alert("상품 이름을 입력해주세요.");
		brandInput.value="";
		brandInput.focus();
		return false;
	}else if(isNotNumber(quantityInput)||isEmpty(quantityInput)){
		alert("수량을 확인해주세요.");
		quantityInput.value="";
		quantityInput.focus();
		return false;
	}else if (isEmpty(contentInput)
			|| (isNotType(contentInput, "png") && isNotType(contentInput, "gif")
					&& isNotType(contentInput, "jpg") && isNotType(contentInput,
					"bmp")&&isNotType(contentInput, "jpeg"))) {
		alert("상품 상세 정보 파일을 확인해주세요.");
		return false;
	}
	return true;
}
function productFashionRegCheck(){
	var nameInput = document.productRegForm.p_name;
	var photoInput = document.productRegForm.p_photo;
	var priceInput = document.productRegForm.p_price;
	var brandInput = document.productRegForm.p_brand;
	var quantityInput = document.productRegForm.p_quantity;
	var contentInput = document.productRegForm.p_content;
	var colorInput = document.productRegForm.d_color;
	
	if(isEmpty(nameInput)){
		alert("상품 이름을 입력해주세요.");
		nameInput.value="";
		nameInput.focus();
		return false;
	}else if (isEmpty(photoInput)
			|| (isNotType(photoInput, "png") && isNotType(photoInput, "gif")
					&& isNotType(photoInput, "jpg") && isNotType(photoInput,
					"bmp")&&isNotType(photoInput, "jpeg"))) {
		alert("상품 사진을 확인해주세요.");
		return false;
	}else if(isNotNumber(priceInput)||isEmpty(priceInput)){
		alert("상품 가격을 확인해주세요.");
		priceInput.value="";
		priceInput.focus();
		return false;
	}else if(isEmpty(brandInput)){
		alert("상품 이름을 입력해주세요.");
		brandInput.value="";
		brandInput.focus();
		return false;
	}else if(isNotNumber(quantityInput)||isEmpty(quantityInput)){
		alert("수량을 확인해주세요.");
		quantityInput.value="";
		quantityInput.focus();
		return false;
	}else if (isEmpty(contentInput)
			|| (isNotType(contentInput, "png") && isNotType(contentInput, "gif")
					&& isNotType(contentInput, "jpg") && isNotType(contentInput,
					"bmp")&&isNotType(contentInput, "jpeg"))) {
		alert("상품 상세 정보 파일을 확인해주세요.");
		return false;
	}else if(isEmpty(colorInput)){
		alert("색상 옵션을 입력해주세요.");
		colorInput.value="";
		colorInput.focus();
		return false;
	}
	return true;
}
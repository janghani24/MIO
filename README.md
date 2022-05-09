# ME In&Out
![mio](https://user-images.githubusercontent.com/90094696/161173945-04d8404c-6b71-4704-ae6d-1d53bd9ae048.png)  
> 미닝아웃을 주제로한 상품과 펀딩의 정보를 제공하고 커뮤니티 기능이 있어 소통이 가능한 웹사이트를 목표로 했습니다.
> 수익금 기부, 환경 보호, 유기 동물 후원 등 다양한 가치를 담은 상품과 해피빈, 와디즈 등 여러 사이트에서 행해지는 펀딩을 모아서 보여줄 수 있고, 소비 습관을 알리고 이를 사회문제로 환기시키는 가치 소비 커뮤니티기능을
> 제공하는것을 목적으로 했습니다.


# 1. 제작기간 & 참여인원
* 2022년 2월 21일 ~ 3월 25일
* 4명 (팀장. 회원관련 기능, 덧글, 장바구니기능 담당)

# 2. 사용 기술
* Java 14
* Spring MVC
* Oracle DB
* Maven
* Mybatis
* JavaScript ES6

# 3. 참고자료
* 기획 단계에서 간략하게 구조와 DB들을 구상했습니다.   
* [프로젝트 전체구조](https://drive.google.com/file/d/1voVVVPvcnnfWAr6dQFk5IZL15XypMqGR/view)    
* [프로젝트 세부구조](https://drive.google.com/file/d/1sekZjojhVVqkqo02eQrnCGRvW7S-CBS7/view?usp=sharing)
<details markdown="1">
<summary>전체 DB</summary>

![DB](https://user-images.githubusercontent.com/90094696/164127886-f750b5ba-4d9b-40f1-a5d1-6f2aa53dc811.png)

</details>

# 4. 기능 설명
이 프로젝트에서 제가 맡은 부분은 회원과 관련된 로그인, 회원가입, 관리자페이지등과 상품 상세페이지의 덧글 기능, 장바구니 기능입니다.  

<details markdown="1">
<summary>회원관련 기능 설명 펼치기</summary>

### 1. 로그인

![제목 없는 프레젠테이션 (3)](https://user-images.githubusercontent.com/90094696/164469296-09c16b67-f428-437f-a571-5c10824bf98e.jpg)

<details markdown="1">
<summary>Controller(수정 포함)</summary>

```java
	// 기존
	@RequestMapping(value = "/account.login", method = RequestMethod.POST)
	public String login(Account account, HttpServletRequest request) {
		aDAO.login(account, request);
		aDAO.loginCheck(request);
		String result = (String) request.getAttribute("result");
		if (result.equals("1") || result.equals("2")) {
			request.setAttribute("contentPage", "account/loginFail.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 수정 - 기존에는 Attribute를 가져와 String으로 변환 후 .equals()로 비교해주었지만 login메서드의 리턴값을 int로 받아 바로 변수에 대입 후 ==로 비교해주었다.
	@RequestMapping(value = "/account.login", method = RequestMethod.POST)
	public String login(Account account, HttpServletRequest request) {
		int result = aDAO.login(account, request);
		aDAO.loginCheck(request);
		if (result == 1 || result ==2) {
			request.setAttribute("contentPage", "account/loginFail.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
```
</details>

<details markdown="1">
<summary>DAO(수정 포함)</summary>

```java
	// 기존
	public void login(Account account, HttpServletRequest request) {
		Account dbAccount = ss.getMapper(AccountMapper.class).getAccountByID(account);
		if (dbAccount != null) {
			if (account.getA_pw().equals(dbAccount.getA_pw())) {
				request.getSession().setAttribute("loginAccount", dbAccount);
				request.getSession().setMaxInactiveInterval(60 * 1000);
				request.setAttribute("result", "0");
			} else {
				request.setAttribute("result", "1");// pw오류
			}
		} else {
			request.setAttribute("result", "2");// 없는 id
		}
	}
	
	// 수정 - Attribute를 생성하지않고 return값을 int로 받아 결과를 나타내준다. (프로젝트 완료 후 수정)
	public int login(Account account, HttpServletRequest request) {
		Account dbAccount = ss.getMapper(AccountMapper.class).getAccountByID(account);
		if (dbAccount != null) {
			if (account.getA_pw().equals(dbAccount.getA_pw())) {
				request.getSession().setAttribute("loginAccount", dbAccount);
				request.getSession().setMaxInactiveInterval(60 * 1000);
				return 0;
			} else {
				return 1;// pw오류
			}
		} else {
			return 2;// 없는 id
		}
	}
```
</details>

* 로그인은 사용자가 입력한 ID와 비밀번호를 패러미터 값으로 가져와 DB의 값과 일치한 경우에 세션을 얻어 Account 를 실었습니다.   
* 로그인이 실패할 경우를 구분하기위해 결과에 따라 다른 return값을 설정해주었습니다.( 프로젝트 완료 후 수정한 부분)

### 2. 회원가입 

![제목 없는 프레젠테이션 (2)](https://user-images.githubusercontent.com/90094696/164468334-b1cd0f7f-f385-4c81-a484-e8c20522ccbc.jpg)

<details markdown="1">
<summary>Ajax</summary>

```java
function idCheck(){
	$("#join_idInput").blur(function(){
		var id_check = document.getElementById("join_idInput");
		$.ajax({
			url : '/mio/account.idCheck?a_id='+id_check.value,
			type:'get',
			success : function(data){
				if(data >= 1){ // 수정 부분 -> id는 DB에 중복체크 후 insert되지만 혹시 모를 상황에 대비해 1개 이상 존재할 경우에 사용불가능하게 수정했습니다.
					// 1은 중복
					$("#id_check").text("이미 사용중인 id입니다.");
					$("#id_check").css("color","red");
					document.getElementById("idCheckOk").value="idUncheck";
				}else{
					if(id_check.value == ""){
					$("#id_check").text("id를 입력해주세요.");
					$("#id_check").css("color","red");
					}else if(containsHS(id_check)){
						$("#id_check").text("영어/숫자만 입력해주세요.");
						$("#id_check").css("color","red");
					}else if(lessThan(id_check,6)){
						$("#id_check").text("6자 이상 입력해주세요.");
						$("#id_check").css("color","red");
					}
					else{
						$("#id_check").text("사용 가능한 ID입니다.");
						$("#id_check").css("color","green");
						document.getElementById("idCheckOk").value="idCheckOk";
					
					}
				}
			}
		});
	});
}
```
</details>

<details markdown="1">
<summary>Controller,DAO(수정 포함)</summary>

```java
// Controller
@RequestMapping(value = "/account.idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("a_id") String a_id, HttpServletRequest request) {
		aDAO.loginCheck(request);
		return aDAO.idCheck(a_id);
	}
  
// DAO - 수정전
public int idCheck(String a_id) {
		int result1;
		int result2;
		
		result1 = ss.getMapper(AccountMapper.class).idCheck(a_id);
		result2 = ss.getMapper(AccountMapper.class).idCheckS(a_id);
		
		int result;
		
		if (result1 == 1 || result2 == 1) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
// DAO - 수정 후 -> 기존에 쿼리문을 2번 실행하지않고 한번에 실행하여 결과값을 리턴하게 수정했습니다.
public int idCheck(String a_id) {
		
		
		int result = ss.getMapper(AccountMapper.class).idCheck(a_id);
		
		System.out.println(result);
		
		return result;
}
// 수정 후 mapper -> 기존에 각각의 테이블에서 검색하지않고 두 테이블에서의 결과를 함쳐서 결과를 내도록 바꾸었습니다.
<select id="idCheck" parameterType="String" resultType="int">
		select count(*) from(
		select a_id from account_mio
		union all
		select a_s_id from account_sellerjoin)
		where a_id = #{a_id}
	</select>
// 회원가입 DAO
public void joinGeneral(Account account, HttpServletRequest request) {
	String path = request.getSession().getServletContext().getRealPath("resources/img_account");
	MultipartRequest mr = null;
	try {
		mr = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("result", "가입실패"); // 확인용
		return;
	}

	try {
		String join_id = mr.getParameter("a_id");
		String join_pw = mr.getParameter("a_pw");
		String join_name = mr.getParameter("a_name");
		String join_grade = mr.getParameter("a_grade");
		String join_phone = mr.getParameter("a_phone");
		String join_question = mr.getParameter("a_question");
		String join_answer = mr.getParameter("a_answer");
		String join_addr1 = mr.getParameter("a_addr1");
		String join_addr2 = mr.getParameter("a_addr2");
		String join_addr3 = mr.getParameter("a_addr3");
		String join_addr = join_addr1 + "!" + join_addr2 + "!" + join_addr3;
		String join_photo = mr.getFilesystemName("a_img");
		join_photo = URLEncoder.encode(join_photo, "utf-8");
		join_photo = join_photo.replace("+", " ");

		account.setA_id(join_id);
		account.setA_pw(join_pw);
		account.setA_name(join_name);
		account.setA_grade(join_grade);
		account.setA_addr(join_addr);
		account.setA_img(join_photo);
		account.setA_grade(join_grade);
		account.setA_phone(join_phone);
		account.setA_question(join_question);
		account.setA_answer(join_answer);

		if (ss.getMapper(AccountMapper.class).joinGeneral(account) == 1) {
			request.setAttribute("result", "가입성공");
		} else {
			request.setAttribute("result", "가입실패");
		}
	} catch (Exception e) {
		e.printStackTrace();
		String fileName = mr.getFilesystemName("a_img");
		new File(path + "/" + fileName).delete();
		request.setAttribute("result", "가입실패");
	}
}
```
</details>

* ID 중복체크에서는 ajax 비동기요청으로 입력값에 따른 결과를 표시해주었습니다.
* ID 중복체크는 회원 테이블과 가입신청 테이블의 검색결과를 union all하여 해당 id가 존재하는 갯수를 결과로 내놓게 수정했습니다.   
* 이 때 중복체크를 하지 않았을 경우 가입이 되지않도록 확인용 변수를 만들어 사용가능한 ID를 입력했을 경우에만 변수를 확인완료된 값으로 변경해주었습니다.
* 다른 값들에는 js를 이용해 유효성검사를 해주었습니다.   
* 유효성 검사를 통과한 경우 MultipartRequest를 이용해 POST방식으로 Controller에 요청을 보냅니다.   
* DefaultFileRenamePolicy를 이용해 사진 파일명의 중복을 방지했습니다.   
* 일반 회원의 경우 바로 회원DB에, 판매자의 경우 가입신청DB에 insert됩니다.   

### 3. 관리자페이지
* 관리자 페이지는 등급조정과 가입승인 두가지 기능이 있습니다. jstl을 이용해서 관리자 등급일 때만 버튼이 활성화됩니다.   

![제목 없는 프레젠테이션 (4)](https://user-images.githubusercontent.com/90094696/164470231-0f9c1bea-c735-4d84-a42e-e1a2d0fe0a3a.jpg)

<details markdown="1">
<summary>Controller,DAO</summary>

```java
// Controller
@RequestMapping(value = "/account.updateGrade", method = RequestMethod.GET)
	public String updateGrade(Account account, HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.updateGrade(account, request);
			aDAO.getAllAccount(1, request);
			request.setAttribute("contentPage", "account/updateGrade.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
// DAO
public void updateGrade(Account account, HttpServletRequest request) {
		if (ss.getMapper(AccountMapper.class).updateGrade(account) == 1) {
			request.setAttribute("result", "수정성공"); // 확인용
		} else {
			request.setAttribute("result", "수정실패");
		}
	}
```
</details>  

* 등급별로 회원목록을 나열하고 Select로 변경할 등급을 고를 수 있게 하였습니다.  
* 등급 조정에서는 ID와 변경할 등급의 정보를 GET방식으로 Controller에 요청을 보냅니다. 
* pk인 ID로 where절을 만들어 등급을 수정해줍니다.   

![제목 없는 프레젠테이션 (5)](https://user-images.githubusercontent.com/90094696/164471433-fe9aa9c5-70b8-4819-a15a-8cea503c9dc3.jpg)

<details markdown="1">
<summary>Controller,DAO</summary>

```java
// Controller
@RequestMapping(value = "/account.sellerJoin.do", method = RequestMethod.GET)
	public String sellerJoin(Account account, Seller seller, HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.sellerToAccount(account, seller, request);
			aDAO.deleteSellerjoin(seller, request);
			aDAO.getSeller(request);
			request.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
// DAO
public void sellerToAccount(Account account, Seller seller, HttpServletRequest request) {
		Seller sellerApproved = ss.getMapper(AccountMapper.class).getSellerById(seller);
		account.setA_id(sellerApproved.getA_s_id());
		account.setA_pw(sellerApproved.getS_pw());
		account.setA_name(sellerApproved.getS_name());
		account.setA_addr(sellerApproved.getS_addr());
		account.setA_phone(sellerApproved.getS_phone());
		account.setA_img(sellerApproved.getS_img());
		account.setA_grade(sellerApproved.getS_grade());
		account.setA_question(sellerApproved.getS_question());
		account.setA_answer(sellerApproved.getS_answer());

		if (ss.getMapper(AccountMapper.class).joinGeneral(account) == 1) {
			request.setAttribute("result", "가입성공"); // 확인용
		} else {
			request.setAttribute("result", "가입실패");
		}
	}
```
</details>

* 가입 승인 리스트에서 자세히보기를 클릭하면 가입 신청자의 pk값을 패러미터로 GET요청을해 해당 신청자의 상세페이지로 이동합니다.   
* 가입 승인은 신청목록에 있는 판매자의 정보들을 일반회원의 VO에 담아 일반회원으로 등록하고 기존의 신청목록에서 기록을 삭제합니다. 이 때 승인을 허가하면 사진은 그대로 남아 회원DB에 등록되고, 거절하면 사진파일을 삭제해줍니다.   

### 4. 마이페이지


<details markdown="1">
<summary>정보 수정 DAO</summary>

```java
public void updateAccount(Account account, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("resources/img_account");
		MultipartRequest mr = null;
		Account loginMember = (Account) request.getSession().getAttribute("loginAccount");
		String oldFile = loginMember.getA_img();
		String newFile = null;
		try {
			mr = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			newFile = mr.getFilesystemName("jm_photo");
			if (newFile == null) {
				newFile = oldFile;
			} else {
				newFile = URLEncoder.encode(newFile, "utf-8");
				newFile = newFile.replace("+", " ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패"); // 확인용
			return;
		}
		try {
			String join_id = mr.getParameter("jm_id");
			String join_pw = mr.getParameter("jm_pw");
			String join_name = mr.getParameter("jm_name");
			String join_addr1 = mr.getParameter("jm_addr1");
			String join_addr2 = mr.getParameter("jm_addr2");
			String join_addr3 = mr.getParameter("jm_addr3");
			String join_addr = join_addr1 + "!" + join_addr2 + "!" + join_addr3;
			String join_img = newFile;
			String join_phone = mr.getParameter("jm_phone");

			account.setA_id(join_id);
			account.setA_pw(join_pw);
			account.setA_name(join_name);
			account.setA_addr(join_addr);
			account.setA_img(join_img);
			account.setA_phone(join_phone);

			if (ss.getMapper(AccountMapper.class).updateAccount(account) == 1) {
				request.setAttribute("result", "수정성공");
				account = ss.getMapper(AccountMapper.class).getAccountByID(account);
				request.getSession().setAttribute("loginAccount", account);
				if (!oldFile.equals(newFile)) {
					oldFile = URLDecoder.decode(oldFile, "utf-8");
					new File(path + "/" + oldFile).delete();
				}
			} else {
				request.setAttribute("result", "수정실패");
				if (!oldFile.equals(newFile)) {
					newFile = URLDecoder.decode(newFile, "utf-8");
					new File(path + "/" + newFile).delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패");
			if (!oldFile.equals(newFile)) {
				try {
					newFile = URLDecoder.decode(newFile, "utf-8");
				} catch (UnsupportedEncodingException e1) {
				}
				new File(path + "/" + newFile).delete();
			}
		}
	}
```
</details>


* 마이페이지에서는 가입시 입력한 정보 열람, 정보 수정, 탈퇴가 가능합니다. 

* 마이페이지에 접근시 로그인되어있는 세션에 있는 Account객체의  불러와 표시해줍니다.

* 수정의 경우 pk값인 ID외의 값들을 수정할 수 있습니다. 수정 페이지에서 기존값을 value로 설정해 수정전에 볼 수 있게했습니다.   

* 탈퇴버튼을 누를 시 ID와 PW를 입력해야하고 현재 세션의 ID와 PW의 정보와 입력값이 다를 경우 넘어가지않도록 javascript로 유효성겁사를 넣었습니다. 

</details>

<details markdown="1">
<summary>덧글기능 기능 설명 펼치기</summary>

![제목 없는 프레젠테이션 (7)](https://user-images.githubusercontent.com/90094696/164476459-51c2d869-d877-4558-b4d8-09de4b111f22.jpg)


<details markdown="1">
<summary>jQuery</summary>

```java
$(function () {
	
	$('#star a').click(function(){ 
		
		 $(this).parent().children("a").removeClass("on");    
		 $(this).addClass("on").prevAll("a").addClass("on");
		 console.log($(this).attr("value"));
		 let rate = $(this).attr("value");
		  document.productReply.r_rate.value=rate;
		  return false;
		});
	
	let rate;
	$('.starRate').each(function (i,s) {
		rate = $(this).attr('value');
		let starResult = $('<span class="starRateResult"></span>')
		
		if(rate == 1){
			 $(this).append(starResult)
			 starResult.text('★☆☆☆☆')
		}else if(rate == 2){
			 $(this).append(starResult)
			 starResult.text('★★☆☆☆')
		}else if(rate == 3){
			 $(this).append(starResult)
			 starResult.text('★★★☆☆')
		}else if(rate == 4){
			 $(this).append(starResult)
			 starResult.text('★★★★☆')
		}else if(rate == 5){
			 $(this).append(starResult)
			 starResult.text('★★★★★')
		}
	});
});
```
</details>

* 덧글 작성은 로그인한 회원만 가능하도록 jstl의 if로 제한을 걸어줬습니다.
* 덧글의 별점은 jQuery를 이용해 구현했습니다. 별점에 따른 숫자를 rate에 저장한 후 덧글을 불러올 때 저장된 rate에 따라 별점이 표시됩니다.   
* 덧글은 상품pk를 외래키로 참고하고 on delete cascade를 이용해 상품이 사라질 경우 그 상품에 등록된 덧글도 같이 삭제되게했습니다.

</details>

<details markdown="1">
<summary>장바구니 기능 설명 펼치기</summary>


![제목 없는 프레젠테이션 (2)](https://user-images.githubusercontent.com/90094696/164352961-b609a72c-56d6-484f-9237-4e28c7bed196.jpg)

<details markdown="1">
<summary>JavaScript</summary>

```java
function goCart(i,p,price,c,photo) {
	let amount = document.getElementById("amount").value;
	let ok = confirm("장바구니에 담으시겠습니까?")
	if (ok) {
		$.ajax({
			url :'/mio/product.insert.cart?c_p_no=' + p + "&c_a_id=" + i + "&c_quantity="
				+amount+"&c_price=" + price + "&p_num="+ p +"&c_category="+ c + "&c_p_photo=" + photo,
			type:'get',
			success :alert("장바구니에 담겼습니다.")
		});
		
		let ok2 = confirm("장바구니로 이동하시겠습니까?")
		if (ok2) {
			window.location.href = "product.go.cart"

		}
	}
}
```
</details>

* 장바구니는 js를 이용하였는데, 이 때 ajax로 장바구니에 넣는 비동기 요청을 보내고, location.href로 장바구니로 이동합니다.   
* Session의 사용자 ID를 이용해 cart DB에 상품pk, 가격등의 정보를 등록합니다. ID와 상품pk를 외래키로 참고하며 on delete cascade를 이용해 탈퇴하거나 상품이 삭제되면 장바구니에서도 삭제되게했습니다.
</details>

# 5. Issue
* 장바구니 기능을 만들 때 처음에는 js에서 장바구니에 넣는 것과 이동을 모두 location.href로 처리했었습니다. 그러나 충돌이 일어나 장바구니에 넣는 것은 기능하나 이동이 제대로 되지않았습니다. 그래서 ajax를 이용해 비동기요청으로 바꾸어 충돌을 피했습니다.
* 4가지의 카테고리의 검색결과나 수정페이지를 만들 때 기존에는 각각의 카테고리마다 페이지를 만들었었습니다. 그렇게 만드니 페이지가 너무 많아지고 컨트롤러에서도 너무 복잡하다고 느꼈습니다. 그래서 DAO에서 카테고리 변수를 만들고 검색이나 수정페이지에서 DB의 컬럼수가 다른 fashion이외에는 변수에 따라 내용을 다르게 했습니다. 
* 가입승인을 하거나 거절을 할 때 신청목록 DB에서 삭제를 할 때 같은 메서드를 사용했었습니다. 그런데 이 때 사진파일을 삭제하는 기능을 잊어 이를 추가하려할 때, 승인을 할 시에는 사진이 삭제돼 일반회원으로 바뀌었을 때 사진이 나오지않았습니다. 같은 삭제기능을 가진 메서드를 두가지만들고 하나의 메서드에 사진삭제기능을 추가했습니다.   
같은 삭제기능이 이중으로 들어가있어 상황에 맞춰 메서드를 고르는 것보다 필요할 때 사진 삭제기능만 있는 메서드를 추가로 사용하는게 낫다고 생각하여 사진삭제 기능을 따로 분리하여 해결했습니다.(프로젝트 완료 후 수정)   
* login메서드에서 결과를 result라는 Attriubute를 만들어 값으로 실어서 Controller에서 그 Attribute를 받아 String으로 변환 후 .equals()로 비교해주었습니다. 하지만 Attribute를 만들고 Controller에서 String으로 바꾸어주는 과정이 불필요하다고 느껴져서 결과를 바로 login메서드의 return값으로 설정해 Controller에서 int로 받아 ==로 비교하게 바꾸었습니다.(프로젝트 완료 후 수정)   
* 기존에 id중복체크시 회원 테이블과 가입신청 테이블을 각각 한번씩 검색하여 그 결과를 if문으로 나누어주었지만 쿼리문을 두번 사용하고 if문을 사용하는것이 효율적이지 못하다 생각되어 두 테이블에서 id값을 union all하여(DB에 중복체크 후 insert되므로 굳이 중복체크를 하는 union이 아닌 union all을 사용하였습니다.) 해당 id가 존재하는 갯수를 result로 받게바꾸었습니다.(프로젝트 완료 후 수정)

# 6. 느낀 점
> 프로젝트 후 느끼점 : https://velog.io/@gksml24/팀-프로젝트-후-회고

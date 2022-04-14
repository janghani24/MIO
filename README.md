# ME In&Out
![mio](https://user-images.githubusercontent.com/90094696/161173945-04d8404c-6b71-4704-ae6d-1d53bd9ae048.png)  
> 미닝아웃을 주제로한 상품과 펀딩의 정보를 제공하고 커뮤니티 기능이 있어 소통이 가능한 웹사이트입니다.  
> 수익금 기부, 환경 보호, 유기 동물 후원 등 다양한 가치를 담은 상품과 해피빈, 와디즈 등 여러 사이트에서 행해지는 펀딩을 모아서 보여줄 수 있고, 소비 습관을 알리고 이를 사회문제로 환> 기시키는 가치 소비 커뮤니티기능을
> 제공하는것을 목적으로 했습니다.


# 1. 제작기간 & 참여인원
* 2022년 2월 21일 ~ 3월 25일
* 4명 (팀장. 회원관련 기능, 덧글, 장바구니기능 담당)

# 2. 사용 기술
* Java 14
* Spring 1.6
* oracle 18c
* Maven
* javascript

# 3. 기능 설명
이 프로젝트에서 제가 맡은 부분은 회원과 관련된 로그인, 회원가입, 관리자페이지등과 상품 상세페이지의 덧글 기능, 장바구니 기능입니다.  

<details markdown="1">
<summary>회원관련 기능 설명 펼치기</summary>

### 1. 로그인
<img src="https://user-images.githubusercontent.com/90094696/163195282-a01466ae-0e92-403e-9ac4-db3ee7956c26.jpg" width="1200"/> 

* 로그인은 DB의 ID와 비밀번호가 일치한 경우에 세션을 얻어 회원 정보를 실었습니다.
* 로그인이 실패할 경우를 구분하기위해 변수를 설정하고 return되는 변수의 값에 따라 이동하는 페이지를 다르게했습니다.

### 2. 회원가입 
<img src="https://user-images.githubusercontent.com/90094696/163191268-03749c4c-6d8a-40f7-b9b0-902afc45921d.jpg" width="1200"/> 

* ID 중복체크에서는 ajax 비동기요청으로 입력값에 따른 결과를 표시해주었습니다.
* 이 때 중복체크를 하지 않았을 경우 가입이 되지않도록 확인용 변수를 만들어 사용가능한 ID를 입력했을 경우에만 변수를 확인완료된 값으로 변경해주었습니다.
* 다른 값들에는 js를 이용해 유효성검사를 해주었습니다.

### 3. 관리자페이지
* 관리자 페이지는 등급조정과 가입승인 두가지 기능이 있습니다.
<img src="https://user-images.githubusercontent.com/90094696/163345291-00b3fc92-345b-4cfa-994c-7dae1d4ff3b7.jpg" width="1200"/> 

* 등급 조정에서는 ID와 변경할 등급의 정보를 실어서 컨트롤러로 보냅니다. 
* pk인 ID로 where절을 만들어 등급을 수정해줍니다.

<img src="https://user-images.githubusercontent.com/90094696/163346833-d94a4d61-3410-443e-a215-3bc1013a46b8.jpg" width="1200"/> 

* 가입 승인은 신청목록에 있는 판매자의 정보들을 일반회원의 빈에 담아 일반회원으로 등록하고 기존의 신청목록에서 기록을 삭제합니다.

</details>

<details markdown="1">
<summary>덧글기능 기능 설명 펼치기</summary>

<img src="https://user-images.githubusercontent.com/90094696/163350342-931bee0f-889d-447b-a037-5e7531228fae.jpg" width="1000"/> 

* 덧글의 별점은 jQuery를 이용해 구현했습니다. 별점에 따른 숫자를 rate에 저장한 후 덧글을 불러올 때 저장된 rate에 따라 별점이 표시됩니다.

</details>

<details markdown="1">
<summary>장바구니 기능 설명 펼치기</summary>



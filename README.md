# ME In&Out
![mio](https://user-images.githubusercontent.com/90094696/161173945-04d8404c-6b71-4704-ae6d-1d53bd9ae048.png)  
미닝아웃을 주제로한 상품과 펀딩의 정보를 제공하고 커뮤니티 기능이 있어 소통이 가능한 웹사이트입니다.

# 제작 목적
수익금 기부, 환경 보호, 유기 동물 후원 등 다양한 가치를 담은 상품과 해피빈, 와디즈 등 여러 사이트에서 행해지는 펀딩을 모아서 보여줄 수 있고, 소비 습관을 알리고 이를 사회문제로 환기시키는 가치 소비 커뮤니티기능을
제공하는것을 목적으로 했습니다.

# 메뉴 구성 및 기능
- 메인 화면  
<img src="https://user-images.githubusercontent.com/90094696/161176714-83932728-6974-4ef7-86cb-55880295418b.png" width="400"/>  
로그인, 상품과 펀딩, 커뮤니티로 이동 가능. 메인 화면에 랜덤상품 9가지가 나열됩니다.

- 회원가입  
 <img src="https://user-images.githubusercontent.com/90094696/161177922-3dcf85e4-478d-4943-823d-c6c6d040175d.jpg" width="600"/>   
일반회원, 판매자로 나누어서 가입. 일반회원은 바로 가입 가능. 판매자는 가입신청 후, 관리자가 승인 후 가입됩니다.  
id는 ajax로 중복체크 가능. 주소 찾기는 Daum 우편번호 api를 사용했습니다.

- 관리자 페이지
 <img src="https://user-images.githubusercontent.com/90094696/161178178-7427f0fb-7cd1-47cd-a5dd-d203c0a038cb.jpg" width="600"/>   
 관리자 페이지는 관리자 등급만 접근이 가능하며, 회원의 등급을 조정하거나 가입신청한 판매자의 가입승인, 거절을 할 수 있습니다.

- 상품 및 펀딩 페이지
<img src="https://user-images.githubusercontent.com/90094696/161178376-d48f296f-3a79-4e6e-b09c-eba35f65832a.jpg" width="600"/>   
상품 및 펀딩은 등록순으로 나열되며, 상품명과 브랜드명으로 검색이 가능합니다.      


<img src="https://user-images.githubusercontent.com/90094696/161178512-07adfb88-71a9-4bf0-a3ee-d230e4970ee2.jpg" width="600"/>   
상품 등록은 판매자나 관리자 등급만 가능하며 카테고리 선택 후 등록 할 수 있습니다. 상품을 등록한 회원만 삭제와 수정이 가능하며 카테고리 외의 항목들을 수정 할 수 있습니다.


<img src="https://user-images.githubusercontent.com/90094696/161178739-d83c2597-77ed-4741-bf46-80ee0f159e0d.jpg" width="600"/>   
상세페이지에서 구매,장바구니,찜하기,덧글 기능은 회원한정 기능입니다. 

<img src="https://user-images.githubusercontent.com/90094696/161178873-e3bf5293-4ecb-4c09-8b0b-eb1077077e64.jpg" width="600"/>   
찜하기 버튼을 한번 클릭하면 찜해제 버튼으로 변경됩니다.

<img src="https://user-images.githubusercontent.com/90094696/161178976-96eb1cba-0673-410c-9a24-d54e170dee4d.jpg" width="600"/>   
장바구니에서는 상품의 정보와 총금액을 알 수 있으며 주소입력 후 구매가 가능합니다. 구매는 카카오결제로 이어지게됩니다.

- 커뮤니티 페이지
<img src="https://user-images.githubusercontent.com/90094696/161179125-61420ec4-c783-43cb-805c-aa1579cc0250.jpg" width="600"/>   
커뮤니티 글의 작성은 회원만 가능하며 작성한 회원만 수정과 삭제가 가능합니다. 

# 사용한 IDE와 API, 참고사이트
<img src="https://user-images.githubusercontent.com/90094696/161179333-d4a0a3e9-a2ed-4f2e-b7a4-bcdb88ee5811.jpg" width="600"/>   

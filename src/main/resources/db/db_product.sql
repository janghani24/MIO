create table product_master(
p_num number(10) primary key, 
p_owner varchar2(20 char) not null,
p_name varchar2 (100 char) not null,
p_price number(10) not null,
p_brand varchar2(200 char) not null,
p_photo varchar2 (200 char) not null,
p_content varchar2 (200 char) not null,
p_quantity number(4) not null,
p_category1 varchar2(20 char) not null,
p_category2 varchar2(20 char) not null,
p_date date not null
)
drop table  product_master
drop table  product_order
drop table  product_cart
drop table  product_detail
drop table   product_zzim
drop table   product_reply

select *from (
select rownum as rn,p_num,p_owner,p_name,p_price,p_brand,
p_photo,p_content,p_quantity,p_category1,p_category2,p_date
from (
select * from product_master
order by dbms_random.random
)
)
where rn <= 9


select count(*)
		from product_master
		where p_category1 = 'food';

create table product_detail(
    d_num number(4) primary key, 
    d_master_num number(10) not null, 
    d_size varchar2(20 char) not null,
    d_color varchar2 (20 char) not null,
    constraint d_test
        foreign key(d_master_num)
        references product_master(p_num)
        on delete cascade    --마스터 삭제하면 연관된 디테일도 삭제됨

)

select * from product_detail;
	

drop table product_detail cascade constraint purge;

create table product_cart(
c_no number(5) primary key,
c_p_no number(10) not null,
c_a_id varchar2(20 char) not null,
c_quantity number(3) not null,
c_name varchar2(100 char) not null,
c_price number(20) not null,
c_category varchar2(20) not null,
c_p_photo varchar2(100) not null,
constraint c_a
foreign key(c_a_id)
references account_mio(a_id)
on delete cascade,
constraint c_p
foreign key(c_p_no)
references PRODUCT_MASTER(p_num)
on delete cascade
);
select * from product_cart
create sequence product_cart_seq;

select * from product_cart;
drop table product_cart cascade constraint purge;



create table product_cart(
c_no number(5) primary key,
c_p_no number(10) not null,
c_a_id varchar2(20 char) not null,
c_quantity number(3) not null,
c_name varchar2(100 char) not null,
c_price number(20) not null,
c_category varchar2(20) not null,
c_p_photo varchar2(100) not null,
constraint c_a
foreign key(c_a_id)
references account_mio(a_id)
on delete cascade,
constraint c_p
foreign key(c_p_no)
references PRODUCT_MASTER(p_num)
on delete cascade
);
create sequence product_cart_seq;

select * from product_cart;
drop table product_cart cascade constraint purge;

insert into product_detail values(product_detail_seq.nextval,'요리재료',5,'L','빨강');
insert into product_detail values(product_detail_seq.nextval,'요리재료',5,'L','파랑');
insert into product_detail values(product_detail_seq.nextval,'요리',5,'L','빨강');
insert into product_detail values(product_detail_seq.nextval,'요리',5,'L','파랑');


create table product_reply(
r_no number(5) primary key,
r_p_no number(5) not null,
r_owner varchar2(20 char) not null,
r_txt varchar2(500 char) not null,
r_rate number(5) not  null,
r_date date not null,
constraint p_r 
		foreign key(r_p_no)
		references product_master(p_num)
		on delete cascade
);

insert into product_reply values(product_reply_seq.nextval,99,'yjtest','너무 예뻐요!',4,sysdate);
insert into product_reply values(product_reply_seq.nextval,99,'djtest','디자인이 예쁘네요',5,sysdate);
insert into product_reply values(product_reply_seq.nextval,99,'jhtest','품질도 괜찮고 배송도 빨라요!',4,sysdate);
insert into product_reply values(product_reply_seq.nextval,99,'hntest','색이 예뻐요',4,sysdate);


create sequence product_reply_seq;

create sequence product_master_seq;
create sequence product_detail_seq;

alter sequence product_master_seq nocache;
alter sequence product_master_seq increment by 1; 

delete from product_master;
delete from product_detail;
drop sequence product_detail_seq;
drop table product_master cascade constraint purge;
drop table product_detail cascade constraint purge;
drop table product_reply cascade constraint purge;

--food
--식사거리
insert into product_master values(product_master_seq.nextval,'hn','비건 사천 짜장 떡볶이 (비건밀키트)',13800,'계절의기억','12.jpeg','12-1.jpg',5,'food','식사거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','(냉동) 베지프랑크 200g',5000,'베지푸드','20.jpg','20-1.jpg',5,'food','식사거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','(냉동) 베지스테이크 2kg',36200,'베지푸드','21.jpg','21-1.jpg',5,'food','식사거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','(냉동) 비건크리스피너겟 1kg',18700,'베지푸드','22.jpg','22-1.jpg',5,'food','식사거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','비건라면 자연은 맛있다 정면 (4개 묶음)',3980,'풀무원','23.jpg','23-1.jpg',5,'food','식사거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','비건햄 (Vegan Ham) 500g - 무오신채',8400,'러빙헛','24.jpg','24-1.jpg',5,'food','식사거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','식물성버거패티 800g',8400,'풀무원','25.jpg','25-1.jpg',5,'food','식사거리',sysdate);

--간식거리
insert into product_master values(product_master_seq.nextval,'hn','유기농 NFC 레몬주스 100% 250ml',6000,'파너','02.jpg','02-1.jpg',5,'food','간식거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','핑거팝 단백질과자',2300,'베노프','03.jpg','03-1.jpg',5,'food','간식거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','20Bar 인절미 (12ea)',23500,'베노프','06.jpg','06-1.jpg',5,'food','간식거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','비건 스콘 묶음세트',12800,'베노프','07.jpg','07-1.jpg',5,'food','간식거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','볼제너뮬러 유기농 스펠트밀 크런치 400g',7600,'네이쳐프로','08.jpg','08-1.jpg',5,'food','간식거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','바인리히 파인 다크 초콜릿 92% 100g',3010,'바인리히','09.jpg','09-1.jpg',5,'food','간식거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','파너 착즙사과주스 1000ml',5400,'파너','10.jpg','10-1.jpg',5,'food','간식거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','비건 수제 두부 과자 7종',2900,'두부로운','11.jpg','11-1.jpg',5,'food','간식거리',sysdate);

--요리재료
insert into product_master values(product_master_seq.nextval,'hn','캄포 유기농 촙트 토마토 통조림 400g',3420,'캄포','13.jpg','13-1.jpg',5,'food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','유기농 사과즙으로 만든 오렌지잼 200g',4050,'마인탈','01.jpg','01-1.jpg',5,'food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','에덴 유기농 베지 볼로네즈 파스타 소스 375g',6750,'에덴','04.jpg','04-1.jpg',5,'food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','카르멘시타 스테비아 315g',8800,'카르멘시타','14.jpg','14-1.jpg',5,'food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','마인탈 유기농 사우어 체리잼 210g',6000,'마인탈','15.jpg','15-1.jpg',5,'food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','비오오가닉 오가닉 그린올리브 파티드 280g',6800,'비오오가닉','16.jpg','16-1.jpg',5,'food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','발투센 유기농 칙피 350g',3600,'발투센','17.jpg','17-1.jpg',5,'food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','발사믹비네거 35% 포도농축(6년산) 500ml',8100,'데니그리스','18.jpg','18-1.jpg',5,'food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','밥생각나는 소스 (홍고추 매운맛 - 12 * 10개입)',6000,'더밥','19.jpg','19-1.jpg',5,'food','요리재료',sysdate);


--건강식품



--fashion
--의류
insert into product_master values(product_master_seq.nextval,'hn','지속가능한 뽀글이 플리스 점퍼_아이보리',189000,'그라인','01.jpg','01-1.jpg',5,'fashion','의류',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','지속가능한 뽀글이 플리스 점퍼_브라운',189000,'그라인','07.jpg','07-1.jpg',5,'fashion','의류',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','따뜻함을 더해줄 부드러운 양털 베스트',95000,'그라인','패션_01.jpg','패션_01_1.jpg',5,'fashion','의류',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','Logo Print Hoodie_Black',79000,'ULKIN','패션_02.jpg','패션_02_1.jpg',5,'fashion','의류',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','UL:KIN X KWJ Blue Wave Typo-art T-shirts_White',45000,'ULKIN','패션_03.jpg','패션_03_1.jpg',5,'fashion','의류',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','[BAMBOO] Bamboo Pants',42000,'project 1907','패션_04.jpg','패션_04_1.jpg',5,'fashion','의류',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','[Recycled] 프레자일드 후드티 - Sunflower yellow',119000,'FRAGILED','패션_05.jpg','패션_05_1.jpg',5,'fashion','의류',sysdate);



--가방
insert into product_master values(product_master_seq.nextval,'hn','VIENETTA 베네따 토트 쇼퍼백 (skyblue)',89000,'누깍(Nukak)','02.png','02-1.jpg',5,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','CLUTCH 클러치',52000,'누깍(Nukak)','03.png','03-1.jpg',5,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','타이거 파우치',59000,'카네이테이(KANEI TEI)','08.jpg','08-1.jpg',10,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','사과가죽 파우치',28900,'에끌라토(Eclatto)','09.jpg','09-1.jpg',15,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','Basic Back Pack',51000,'프로젝트1907(project1907)','10.jpg','10-1.jpg',9,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','에리제론 네트백',6900,'에리제론(erigeron)','11.jpg','11-1.jpg',8,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','잎섬유 카모 노트/북커버',44000,'타몬','12.jpg','12-1.jpg',12,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','어반 드링크백 /텀블러백 -크로스보틀형 스타일',21000,'어반에코','13.jpg','13-1.jpg',20,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','지속가능한 뽀글이 에코 백_아이보리',68000,'그라인','14.jpg','14-1.jpg',25,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','선인장 가죽 가치백 Green',225000,'쏘왓(SoWhat)','15.jpg','15-1.jpg',35,'fashion','가방',sysdate);




--패션소품
insert into product_master values(product_master_seq.nextval,'hn','세인트바인 길 고양이후원 체인 팔찌',15000,'세인트바인(saintvine)','04.jpeg','04-1.jpg',5,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','독도후원 플로히스 팔찌',13000,'플로히스','05.jpg','05-1.jpg',5,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','여자 나무시계_더 라디에이터 블랙',309000,'월스파브릭','16.jpg','16-1.jpg',15,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','실버925 천연오팔 물방울 목걸이',22800,'FFM13','17.jpg','17-1.jpg',5,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','독도후원 플로히스 목걸이',17000,'플로히스','18.jpg','18-1.jpg',25,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','독도후원 플로히스 은반지',25000,'플로히스','19.jpg','19-1.jpg',35,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','PLASTIC Key Ring',8000,'프로젝트1907','20.jpg','20-1.jpg',45,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','느릿느릿스카프 L 다크인디고',60000,'어스맨','21.jpg','21-1.jpg',55,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','실버925 18k gold plated 피어싱',12800,'FFM13','22.jpg','22-1.jpg',9,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','바람마을 바람 스카프',32000,'공기핸디크래프트','23.jpg','23-1.png',15,'fashion','패션소품',sysdate);


--패션 디테일(마스터 등록 후 등록)
insert into product_detail values(product_detail_seq.nextval,'25','M','ivory');
insert into product_detail values(product_detail_seq.nextval,'26','M','brown');
insert into product_detail values(product_detail_seq.nextval,'27','M','ivory');
insert into product_detail values(product_detail_seq.nextval,'28','M','black');
insert into product_detail values(product_detail_seq.nextval,'29','M','white');
insert into product_detail values(product_detail_seq.nextval,'30','M','black');
insert into product_detail values(product_detail_seq.nextval,'31','M','yellow');
insert into product_detail values(product_detail_seq.nextval,'32','Free','blue');
insert into product_detail values(product_detail_seq.nextval,'33','Free','silver');
insert into product_detail values(product_detail_seq.nextval,'34','Free','green');
insert into product_detail values(product_detail_seq.nextval,'35','Free','green');
insert into product_detail values(product_detail_seq.nextval,'36','Free','ivory');
insert into product_detail values(product_detail_seq.nextval,'37','Free','white');
insert into product_detail values(product_detail_seq.nextval,'38','Free','green');
insert into product_detail values(product_detail_seq.nextval,'39','Free','black');
insert into product_detail values(product_detail_seq.nextval,'40','Free','ivory');
insert into product_detail values(product_detail_seq.nextval,'41','Free','green');
insert into product_detail values(product_detail_seq.nextval,'42','Free','silver');
insert into product_detail values(product_detail_seq.nextval,'43','Free','silver');
insert into product_detail values(product_detail_seq.nextval,'44','Free','black');
insert into product_detail values(product_detail_seq.nextval,'45','Free','blue');
insert into product_detail values(product_detail_seq.nextval,'46','Free','silvr');
insert into product_detail values(product_detail_seq.nextval,'47','Free','silver');
insert into product_detail values(product_detail_seq.nextval,'48','Free','ivory');
insert into product_detail values(product_detail_seq.nextval,'49','Free','dark indigo');
insert into product_detail values(product_detail_seq.nextval,'50','Free','gold');
insert into product_detail values(product_detail_seq.nextval,'51','Free','ivory');




--beauty
--스킨케어
insert into product_master values(product_master_seq.nextval,'hn','비건 립밤',14000,'푸루','01.jpg','01-1.jpg',5,'beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','두유 크림 스킨 패드',24000,'캠퍼스블라썸(CAMPUS BLOSSOM)','02.jpg','02-1.jpg',5,'beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','소프넛 자연 비누',8500,'내츄럴리빙','03.png','03-1.jpg',5,'beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','지구에 자상한 Less waste 트래블 키트 [샴푸바/린스바/바디솝]',15000,'자연상점','10.jpg','10-1.jpg',5,'beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','유기농 촉촉 수분세트',70000,'유기농 촉촉 수분세트','17.jpg','17-1.jpg',5,'beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'yj','씨위드 버블 클레이 마스크',13500,'파이콜로지(phykology)','08.jpg','08-1.jpg',5,'beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'yj','바르 비건 스킨케어 3종',84300,'바르','18.jpg','18-1.png',5,'beauty','스킨케어',sysdate);

--바디케어
insert into product_master values(product_master_seq.nextval,'yj','비퓨어 병풀비누 문제성 피부용',13000,'퐁(fxng)','05.jpg','05-1.jpg',5,'beauty','바디케어',sysdate);
insert into product_master values(product_master_seq.nextval,'yj','허그 140g 대용량 수분 부족형 피부 비누',16000,'퐁(fxng)','06.jpg','06-2.jpg',5,'beauty','바디케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','ZERO플라스틱 고체로션 템퍼러처',31000,'템퍼러처(temperatur)','19.jpg','19-1.png',5,'beauty','바디케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','유기농 사과 페미닌 워시폼',35000,'어글리시크(UGLYCHIC)','20.png','20-1.jpg',5,'beauty','바디케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','유기농 풋귤 이너젤',35000,'어글리시크(UGLYCHIC)','21.png','21-1.jpg',5,'beauty','바디케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','비건 폭스 바디 워시 클렌저',20000,'비건폭스','22.jpg','22-1.png',5,'beauty','바디케어',sysdate);

--메이크업
insert into product_master values(product_master_seq.nextval,'hn','마그나 렝쓰닝 마스카라',36000,'이든미네랄(IDUN Minerals)','11.png','11-1.png',5,'beauty','메이크업',sysdate);
insert into product_master values(product_master_seq.nextval,'yj','파우더 파운데이션',48000,'이든미네랄(IDUN Minerals)','12.png','12-1.jpg',5,'beauty','메이크업',sysdate);
insert into product_master values(product_master_seq.nextval,'yj','아이리스 페이스 프라이머',42000,'이든미네랄(IDUN Minerals)','13.png','13-1.jpg',5,'beauty','메이크업',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','안번지는 비건 마스카라 블랙',23500,'미크릿','14.png','14-1.jpg',5,'beauty','메이크업',sysdate);
insert into product_master values(product_master_seq.nextval,'yj','재사용 화장솜',8500,'원무브먼트','15.jpg','15-1.jpg',5,'beauty','메이크업',sysdate);

--선케어
insert into product_master values(product_master_seq.nextval,'yj','복숭아 톤업 세트 (선크림+마카롱 컨실러)',25000,'퍼스블라썸(CAMPUS BLOSSOM)','04.png','04-1.png',5,'beauty','선케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','아워 비건 시카 선크림 SPF50+ PA++++',19500,'마녀공장','23.png','23-1.jpg',5,'beauty','선케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','비건 선크림 SPF50+ PA++++',17000,'휘게','24.png','24-1.jpg',5,'beauty','선케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','비니페라 바이옴 비건 선크림',44000,'닥토브','25.jpg','25-1.jpg',5,'beauty','선케어',sysdate);




--living
--주방용품
insert into product_master values(product_master_seq.nextval,'jh','(기부텀블러) 유리컵 340ml_안녕, 고래 시리즈 #01',10880,'88하다(88HADA)','01_1_1.jpg','01-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','친환경 밥주걱',4000,'슈가랩','02.jpg','02-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','친환경 위생 지퍼백',2800,'슈가랩','03.jpg','03-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','제로웨이스트 키친키트 - 설거지비누 삼베수세미 병세척솔 소창행주 건조집게',34500,'어반에코','11.jpg','11-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','푸드 커버 랩 대용 천연 삼베 덮개',6200,'예고은삼배','10.jpg','10-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','친환경 일회용 비닐장갑',2200,'슈가랩','12.jpg','12-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','색깔, 먼지 흡착티슈',5300,'해피얼쓰','15.jpg','15-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','본플라 트레이',3000,'본플라','13.jpg','13-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','업사이클링 포레스트 우드 냅킨링',6000,'어반에코','14.jpg','14-1.jpg',5,'living','주방용품',sysdate);

--욕실용품
insert into product_master values(product_master_seq.nextval,'hn','험블 치실',5900,'더험블(THE HUMBLE CO.)','06.jpg','06-1.jpg',5,'living','욕실용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','슈가랩 친환경 칫솔',1800,'슈가랩','07.jpg','07-1.jpg',5,'living','욕실용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','샴푸 린스 SET (샴푸바1+컨디셔닝바1+비누망2)',24000,'퐁(fxng)','08.jpg','08-1.jpg',5,'living','욕실용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','식물성 섬유 잘삼 스크럽 비누망(천연 샤워타올)',4900,'에리제론(erigeron)','16.png','16-1.jpg',5,'living','욕실용품',sysdate);

--생활용품
insert into product_master values(product_master_seq.nextval,'hn','팔로산토 센트스틱',11500,'어반에코','05.jpg','05-1.jpg',5,'living','생활용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','오가닉 코튼 쿠션커버 S 쌈잎',39000,'어스맨','17.jpg','17-1.jpg',5,'living','생활용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','감귤 천연 살균소독제 휴대용 50ml',4500,'코코리 제주','18.jpg','18-1.jpg',5,'living','생활용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','어반 드링크백 /텀블러백 -핸디보틀형 스타일',11000,'어반에코','19.jpg','19-1.jpg',5,'living','생활용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','해피얼쓰(Happy Earth) 스테인레스 빨대',5300,'해피얼쓰','20.jpg','20-1.png',5,'living','생활용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','맘스오가닉 기저귀커버',20000,'로한','21.jpg','21-1.jpg',5,'living','생활용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','쏙, 홀더 거치대',2400,'수딩플레이스','22.jpg','22-1.jpg',5,'living','생활용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','험블 대나무 빨대 (4개입+전용클리너)',8900,'더험블(THE HUMBLE CO.)','24.jpg','24-1.jpg',5,'living','생활용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','종이수납함 딥dip',9500,'페이퍼팝(PAPER POP)','09.jpg','09-1.jpg',5,'living','생활용품',sysdate);

--문구
insert into product_master values(product_master_seq.nextval,'hn','업사이클링 포레스트 우드 핸드폰거치대',8000,'어반에코','25.jpg','25-1.jpg',5,'living','문구',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','연필꽂이 DIY 키트',10900,'기글(GIGL)','04.jpg','04-1.jpg',5,'living','문구',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','금잔화 플라워 엽서 4종',6000,'메리골드','23.jpg','23-1.png',5,'living','문구',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','난나무였어 친환경문구세트',7900,'THE SARANG','26.jpg','26-1.jpg',5,'living','문구',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','더 크라프트테이프 5종',4000,'ZIO TAPE','27.jpg','27-1.jpg',5,'living','문구',sysdate);







update product_master set p_name= 'Blue Wave Typo-art T-shirts_White' where p_name = 'UL:KIN X KWJ Blue Wave Typo-art T-shirts_White';

drop sequence p_num;
drop sequence product_master_seq;

delete from product_master where p_name='아워 비건 시카 선크림 SPF50+ PA++++';

select * from product_master;
select * from product_master where p_category1='fashion';
select * from product_master where p_name like '%크라프트%';
select * from product_detail;


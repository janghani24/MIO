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

insert into product_detail values(product_detail_seq.nextval,'3','의류','5','s','ivory');
insert into product_detail values(product_detail_seq.nextval,'3','의류','3','m','ivory');


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
insert into product_master values(product_master_seq.nextval,'hn','[냉동] 베지프랑크 200g',5000,'베지푸드','20.jpg','20-1.jpg',5,'food','식사거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','[냉동] 베지스테이크 2kg',36200,'베지푸드','21.jpg','21-1.jpg',5,'food','식사거리',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','[냉동] 비건크리스피너겟 1kg',18700,'베지푸드','22.jpg','22-1.jpg',5,'food','식사거리',sysdate);
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
insert into product_master values(product_master_seq.nextval,'hn','밥생각나는 소스 [홍고추 매운맛 - 12 * 10개입]',6000,'더밥','19.jpg','19-1.jpg',5,'food','요리재료',sysdate);


--건강식품



--fashion
--의류
insert into product_master values(product_master_seq.nextval,'hn','지속가능한 뽀글이 플리스 점퍼_아이보리',189000,'그라인','01.jpg','01-1.jpg',5,'fashion','의류',sysdate);




--가방
insert into product_master values(product_master_seq.nextval,'hn','VIENETTA 베네따 토트 쇼퍼백 (skyblue)',89000,'누깍(Nukak)','02.png','02-1.jpg',5,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','CLUTCH 클러치',52000,'누깍(Nukak)','03.png','03-1.jpg',5,'fashion','가방',sysdate);



--지갑




--패션소품
insert into product_master values(product_master_seq.nextval,'hn','세인트바인 길 고양이후원 체인 팔찌',15000,'세인트바인(saintvine)','04.jpeg','04-1.jpg',5,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','독도후원 플로히스 팔찌',13000,'플로히스','05.jpg','05-1.jpg',5,'fashion','패션소품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','[119레오 당근 팔찌] 소방관 기부 후원',22000,'119레오','06.jpg','06-1.jpg',5,'fashion','패션소품',sysdate);



--케이스




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
insert into product_master values(product_master_seq.nextval,'yj','허그 140g 대용량 수분 부족형 피부 비누',16000,'퐁(fxng)','06.jpg','06-1.jpg',5,'beauty','바디케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','허그 140g 대용량 수분 부족형 피부 비누',16000,'퐁(fxng)','06.jpg','06-1.jpg',5,'beauty','바디케어',sysdate);
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
insert into product_master values(product_master_seq.nextval,'jh','[기부텀블러] 유리컵 340ml_안녕, 고래 시리즈 #01',10880,'88하다(88HADA)','01_1_1.jpg','01-1.jpg',5,'living','주방용품',sysdate);
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
insert into product_master values(product_master_seq.nextval,'hn','어반 드링크백 /텀블러백 -핸디보틀형 스타일 ,제로웨이스트',11000,'어반에코','19.jpg','19-1.jpg',5,'living','생활용품',sysdate);
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







update product_master set p_category2= '패션소품' where p_name = '세인트바인 길 고양이후원 체인 팔찌';

drop sequence p_num;
drop sequence product_master_seq;

delete from product_master where p_name='세인트바인 길 고양이후원 체인 팔찌';

select * from product_master;
select * from product_detail;


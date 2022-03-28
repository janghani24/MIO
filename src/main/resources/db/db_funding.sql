create table fundingTbl(
f_num number(6) primary key,
f_owner varchar2(20 char) not null,
f_photo varchar2 (200 char) not null,
f_name varchar2 (100 char) not null,
f_company varchar2 (100 char) not null,
f_category varchar2 (100 char) not null,
f_period date not null,
f_url varchar2 (200 char) not null
)

drop table fundingTbl cascade constraint purge;
drop sequence fundingTbl_seq;

create sequence fundingTbl_seq;
alter sequence fundingTbl_seq nocache;
alter sequence fundingTbl_seq increment by 1; 

--일자리 창출
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','01.jpg','취약계층의 자립을 응원하는 티크 원목 도마','디랜드협동조합','일자리창출','2022-04-06','https://happybean.naver.com/fundings/detail/F479');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','일자리_1.jpg','네팔 여성들의 자립을 돕는 네팔리 백과 굿즈','지구촌공생회','일자리창출','2022-05-02','https://happybean.naver.com/fundings/detail/F497');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','일자리_2.jpg','완주 농산물로 만든 샛노란 단호박 식혜','본앤하이리','일자리창출','2022-04-21','https://happybean.naver.com/fundings/detail/F489');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','일자리_3.jpg','화분과 지구에 나무를 심는 환경교육키트','트리플래닛','일자리창출','2022-04-26','https://happybean.naver.com/fundings/detail/F494');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','일자리_4.jpg','세상을 바꾸는 특별한 커피, 히즈빈스','히즈빈스','일자리창출','2022-04-21','https://happybean.naver.com/fundings/detail/F476');

--친환경

insert into fundingTbl values(fundingTbl_seq.nextval,'hn','02.jpg','자연이 준 선물, 꿀벌 벌집으로 만든 롤밀랍랩','손끋비','친환경','2022-04-05','https://happybean.naver.com/fundings/detail/F481');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','03.jpg','매일 간편하게 즐기는 7가지 해초샐러드','마린이노베이션','친환경','2022-04-28','https://happybean.naver.com/fundings/detail/F475');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','친환경_01.jpg','바다를 위한 동행, 커피 스크럽 바디바 KIT','이디야','친환경','2022-04-21','https://happybean.naver.com/fundings/detail/F493');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','친환경_03.jpg','지구를 위하는 고체 치약과 대나무 칫솔','디어얼스','친환경','2022-04-25','https://happybean.naver.com/fundings/detail/F488');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','친환경_04.jpg','자연이 준 선물, 꿀벌 벌집으로 만든 롤밀랍랩','손끈비','친환경','2022-04-05','https://happybean.naver.com/fundings/detail/F481');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','친환경_05.jpg','미세플라스틱 걱정 덜은 옥수수로 만든 칫솔','HAYAN','친환경','2022-03-27','https://happybean.naver.com/fundings/detail/F474');

--기부

insert into fundingTbl values(fundingTbl_seq.nextval,'hn','기부_01.jpg','루게릭병 환우에게 희망을 선물하는 팔찌','승일희망재단','기부','2022-04-11','https://happybean.naver.com/fundings/detail/F482');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','기부_02.jpg','코로나로 인해 갈 수 없는 집','한빛사랑후원회','기부','2022-06-20','https://happybean.naver.com/donations/H000000183689');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','기부_03.jpg','산불로 새까맣게 타 버린 집','초록우산 어린이재단','기부','2022-04-07','https://happybean.naver.com/donations/H000000183472');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','기부_04.jpg','아이들의 첫 번째 집이자 생명을 지켜주는 보금자리','사단법인 따뜻한하루','기부','2022-06-28','https://happybean.naver.com/donations/H000000183488');

--유기동물후원

insert into fundingTbl values(fundingTbl_seq.nextval,'hn','동물_01.jpg','야생조류가 유리창 충돌로 하루 2만 마리나 죽는다구요?','자연의벗연구소','유기동물후원','2022-04-26','https://happybean.naver.com/donations/H000000182838');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','동물_02.png','죽음을 벗어난 농장동물들의 보호소, 함께 만들어요','사단법인 동물권행동 카라','유기동물후원','2022-04-13','https://happybean.naver.com/donations/H000000182647');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','동물_03.jpg','아이들에게 따뜻한 보호소 공간을 만들어 주고 싶습니다','사단법인 공존','유기동물후원','2022-05-12','https://happybean.naver.com/donations/H000000183062');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','동물_04.jpg','배고프지 않게 유기견들을 도와주세요','행동하는동물사랑','유기동물후원','2022-04-23','https://happybean.naver.com/donations/H000000183266');
insert into fundingTbl values(fundingTbl_seq.nextval,'hn','동물_05.jpg','입양센터의 유기견들을 지켜주는 사람들','사단법인 팅커벨프로젝트','유기동물후원','2022-05-05','https://happybean.naver.com/donations/H000000182961');

delete from fundingTbl where f_name='죽음을 벗어난 농장동물들의 보호소, 함께 만들어요';


update product_master set p_name= 'Blue Wave Typo-art T-shirts_White' where p_name = 'UL:KIN X KWJ Blue Wave Typo-art T-shirts_White';

select * from fundingTbl;

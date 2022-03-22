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

--친환경

insert into fundingTbl values(fundingTbl_seq.nextval,'hn','02.jpg','자연이 준 선물, 꿀벌 벌집으로 만든 롤밀랍랩','손끋비','친환경','2022-04-05','https://happybean.naver.com/fundings/detail/F481');

insert into fundingTbl values(fundingTbl_seq.nextval,'hn','03.jpg','매일 간편하게 즐기는 7가지 해초샐러드','마린이노베이션','친환경','2022-03-28','https://happybean.naver.com/fundings/detail/F475');

--기부

--유기동물후원



select * from fundingTbl;

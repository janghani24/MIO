create table account_mio(
a_id varchar2(20 char) primary key,
a_pw varchar2(30 char) not null, 
a_name varchar2(20 char) not null,
a_addr varchar2(100 char) not null,
a_phone varchar2(20 char) not null,
a_img varchar2(200 char) not null,
a_grade varchar2(20 char) not null,
a_question varchar2(100 char) not null,
a_answer varchar2(30 char) not null
);

select * from account_mio;
delete from account_mio;
insert into ACCOUNT_MIO values ('hntest','hn','hn','경기 성남시 중원구 사기막골로62번길 18!11!13210','01000000000','hn.jpg','admin','q4','a');
insert into ACCOUNT_MIO values ('djtest','dj','dj','경기 광진구 자양강변길 7!111!05088','01000000000','dj.jpg','general','q1','a');
insert into ACCOUNT_MIO values ('yjtest','yj','yj','경기 성남시 중원구 사기막골로62번길 18!11!13210','01000000000','yj.jpg','seller','q2','a');
insert into ACCOUNT_MIO values ('jhtest','jh','jh','경기 안성시 일죽면 판교길 6!11!17532','01000000000','jh.jpg','general','q3','a');

select * from account_sellerjoin;

create table account_sellerjoin(
a_s_id varchar2(20 char) primary key,
s_pw varchar2(30 char) not null, 
s_name varchar2(20 char) not null,
s_addr varchar2(100 char) not null,
s_phone varchar2(20 char) not null,
s_img varchar2(200 char) not null,
s_grade varchar2(20 char) not null,
s_question varchar2(100 char) not null,
s_answer varchar2(30 char) not null,
s_intro varchar2(500 char) not null,
s_sellsort varchar2(20 char) not null
);

insert into account_sellerjoin values('seller1','111111','seller','경기 성남시 중원구 사기막골로62번길 18!11!13210','01000000000','seller1.png','seller','q1','a','sellerintro','fashion');
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
insert into ACCOUNT_MIO values ('hn','hn','hn','addr','phone','img','admin','q','a');
insert into ACCOUNT_MIO values ('test','1','hn','addr','phone','img','admin','q','a');

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

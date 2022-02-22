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

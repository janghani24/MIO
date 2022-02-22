create table product_master(
p_num number(4) primary key, 
p_name varchar2 (30 char) not null,
p_price number(6) not null,
p_photo varchar2 (200 char) not null,
p_content varchar2 (200 char) not null,
p_category1 varchar2(20 char) not null,
p_category2 varchar2(20 char) not null,
p_date date not null
)

create table product_detail(
    p_num number(4) primary key, 
    p_master_num number(4) not null, 
    p_quantity number(3) not null,
    p_size varchar2(20 char),
    p_color varchar2 (20 char)
) 

create sequence product_master_seq;
create sequence product_detail_seq;

alter sequence product_master_seq nocache;
alter sequence product_master_seq increment by 1; 

delete from product_master;
drop table product_master cascade constraint purge;

insert into product_master values(product_master_seq.nextval,'마인탈 유기농 사과즙으로 만든 오렌지잼 200g',4050,'01.jpg','01-1.jpg','food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'파너 유기농 NFC 레몬주스 100% 250ml',6000,'02.jpg','02-1.jpg','food','간식거리',sysdate);
insert into product_master values(product_master_seq.nextval,'[인더비기닝] Polarbear-Logo T-shirt',32000,'01.jpg','01-1.jpg','fashion','의류',sysdate);

update product_master  set p_photo= '01.png' where p_num = 3;
update product_master  set p_content= '01-1.jpg' where p_num = 3;


drop sequence p_num;

drop sequence product_master_seq;


select * from product_master;


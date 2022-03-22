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


create table product_detail(
    d_num number(4) primary key, 
    d_master_num number(10) not null, 
    d_category varchar2(20 char) not null,
    d_quantity number(3) not null,
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
drop sequence product_master_seq;
drop table product_master cascade constraint purge;
drop table product_detail cascade constraint purge;
drop table product_reply cascade constraint purge;

--food
insert into product_master values(product_master_seq.nextval,'hn','유기농 사과즙으로 만든 오렌지잼 200g',4050,'마인탈','01.jpg','01-1.jpg',5,'food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','유기농 NFC 레몬주스 100% 250ml',6000,'파너','02.jpg','02-1.jpg',5,'food','간식거리',sysdate);

--fashion
insert into product_master values(product_master_seq.nextval,'hn','지속가능한 뽀글이 플리스 점퍼_아이보리',189000,'그라인','01.jpg','01-1.jpg',5,'fashion','의류',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','VIENETTA 베네따 토트 쇼퍼백 (skyblue)',89000,'누깍(Nukak)','02.png','02-1.jpg',5,'fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','CLUTCH 클러치',52000,'누깍(Nukak)','03.png','03-1.jpg',5,'fashion','가방',sysdate);

--beauty
insert into product_master values(product_master_seq.nextval,'hn','비건 립밤',14000,'푸루','01.jpg','01-1.jpg',5,'beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','두유 크림 스킨 패드',24000,'캠퍼스블라썸(CAMPUS BLOSSOM)','02.jpg','02-1.jpg',5,'beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','소프넛 자연 비누',8500,'내츄럴리빙','03.png','03-1.jpg',5,'beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'yj','복숭아 톤업 세트 (선크림+마카롱 컨실러)',25000,'퍼스블라썸(CAMPUS BLOSSOM)','04.png','04-1.png',5,'beauty','선케어',sysdate);

--living
insert into product_master values(product_master_seq.nextval,'jh','[기부텀블러] 유리컵 340ml_안녕, 고래 시리즈 #01',10880,'88하다(88HADA)','01_1_1.jpg','01-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','친환경 밥주걱',4000,'슈가랩','02.jpg','02-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','친환경 위생 지퍼백',2800,'슈가랩','03.jpg','03-1.jpg',5,'living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'hn','연필꽂이 DIY 키트',10900,'기글(GIGL)','04.jpg','04-1.jpg',5,'living','문구',sysdate);


update product_master set p_content= '04-1.png' where p_price = 25000;

drop sequence p_num;
drop sequence product_master_seq;

delete from product_master where p_num=14;

select * from product_master;


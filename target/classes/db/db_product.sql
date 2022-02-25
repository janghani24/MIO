create table product_master(
p_num number(10) primary key, 
p_name varchar2 (100 char) not null,
p_price number(10) not null,
p_brand varchar2(200 char) not null,
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

--food
insert into product_master values(product_master_seq.nextval,'유기농 사과즙으로 만든 오렌지잼 200g',4050,'마인탈','01.jpg','01-1.jpg','food','요리재료',sysdate);
insert into product_master values(product_master_seq.nextval,'유기농 NFC 레몬주스 100% 250ml',6000,'파너','02.jpg','02-1.jpg','food','간식거리',sysdate);

--fashion
insert into product_master values(product_master_seq.nextval,'지속가능한 뽀글이 플리스 점퍼_아이보리',189000,'그라인','01.jpg','01-1.jpg','fashion','의류',sysdate);
insert into product_master values(product_master_seq.nextval,'VIENETTA 베네따 토트 쇼퍼백 (skyblue)',89000,'누깍(Nukak)','02.png','02-1.jpg','fashion','가방',sysdate);
insert into product_master values(product_master_seq.nextval,'CLUTCH 클러치',52000,'누깍(Nukak)','03.png','03-1.jpg','fashion','가방',sysdate);

--beauty
insert into product_master values(product_master_seq.nextval,'비건 립밤',14000,'푸루','01.jpg','01-1.jpg','beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'두유 크림 스킨 패드',24000,'캠퍼스블라썸(CAMPUS BLOSSOM)','02.jpg','02-1.jpg','beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'소프넛 자연 비누',8500,'내츄럴리빙','03.jpg','03-1.jpg','beauty','스킨케어',sysdate);
insert into product_master values(product_master_seq.nextval,'복숭아 톤업 세트 (선크림+마카롱 컨실러)',25000,'퍼스블라썸(CAMPUS BLOSSOM)','04.jpg','04-1.jpg','beauty','선케어',sysdate);

--living
insert into product_master values(product_master_seq.nextval,'[기부텀블러] 유리컵 340ml_안녕, 고래 시리즈 #01',10880,'88하다(88HADA)','01_1_1.jpg','01-1.jpg','living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'친환경 밥주걱',4000,'슈가랩','02.jpg','02-1.jpg','living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'친환경 위생 지퍼백',2800,'슈가랩','03.jpg','03-1.jpg','living','주방용품',sysdate);
insert into product_master values(product_master_seq.nextval,'연필꽂이 DIY 키트',10900,'기글(GIGL)','04.jpg','04-1.jpg','living','문구',sysdate);


update product_master set p_category2= '주방용품' where p_price = 10880;

drop sequence p_num;
drop sequence product_master_seq;

delete from product_master where p_num=14;

select * from product_master;


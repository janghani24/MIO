create table product_zzim(

z_no number(10) primary key, 
z_num number(10) not null,
z_id varchar2 (100 char) not null,
 constraint z_test FOREIGN KEY (z_id) REFERENCES account_mio(a_id) on delete cascade,
constraint z_test2 FOREIGN KEY (z_num) REFERENCES product_master(p_num) on delete cascade
)


SELECT *
FROM product_zzim , account_mio, product_master
WHERE product_zzim.z_id = account_mio.a_id
AND product_zzim.z_num = product_master.p_num
AND product_zzim.z_id = #{a_id}
delete from
		product_zzim where z_no = #{p_no}

drop table product_zzim
create sequence product_zzim_seq;
select * from product_zzim;
select * from product_zzim where p_id = 'test'

insert into product_zzim values(product_zzim_seq.nextval,'1','test');

delete from product_zzim where z_no = 61

-------- 여기는 order db ---------

create sequence product_orderItem_seq;
create sequence product_order_seq;

create table product_order(
    orderId varchar2(50) primary key, --주문1 주문2 주문3 구분
    memberId varchar2(50),		--주문자 id
    memberAddr1 varchar2(100) not null,	--주문자 주소1
    memberAddr2 varchar2(100) not null,	--주문자 주소2
    orderState varchar2(30) not null,	--주문 정보 대기 완료이런거
    orderDate date default sysdate,	--주문날짜 
    FOREIGN KEY (memberId) REFERENCES account_mio(a_id)
)

delete from product_orderItem where productid = 43
select * from product_orderItem 
select * from product_order

insert into product_order values('주문고유넘버','test','주소1','주소2','주문대기',sysdate)
insert into product_order values('주문고유넘버2','test','주소1','주소2','주문대기',sysdate)
insert into product_orderItem values(product_orderItem_seq.nextval,'주문고유넘버',101,5,3500)
insert into product_orderItem values(product_orderItem_seq.nextval,'주문고유넘버',44,2,3500)
insert into product_orderItem values(product_orderItem_seq.nextval,'주문고유넘버2',101,5,3500)
insert into product_orderItem values(product_orderItem_seq.nextval,'주문고유넘버2',44,2,3500)

select * from product_order

create table product_orderItem(
    orderItemId number(10) primary key,	--시퀀스로늘림
    orderId varchar2(50) not null,		-- 주문1 주문2 주문3 구분 부모받기	
    productId number(10) not null,	--제품번호
    productCount number(10) not null,	--제품갯수
    productPrice number(10) not null,	--제품가격
    FOREIGN KEY (orderId) REFERENCES product_order(orderId),
    FOREIGN KEY (productId) REFERENCES product_master(p_num)
);



select * from product_orderItem
select * from product_order
--이거는 구매내역 product_order.orderId = product_orderItem.orderId 가 일치 (주문번호가 일치할때 보이게하기)
SELECT * FROM product_order , account_mio, product_master, product_orderItem
WHERE product_order.memberId = account_mio.a_id
AND	product_order.orderId = product_orderItem.orderId
AND product_orderItem.productId = product_master.p_num
AND	product_order.memberId = 'test'
order by orderDate desc
-- 주문을 보여주고 더보기로 주문 상세내역을 보여주자
SELECT product_order.memberId,product_orderItem.productId, product_order.orderId
FROM product_order , account_mio, product_master, product_orderItem
WHERE product_order.memberId = account_mio.a_id
AND product_orderItem.productId = product_master.p_num
AND	product_order.memberId = 'test'
order by orderDate desc


AND product_order.orderId = 'merchant_1648106042242'//고유번호로 get할떄 쓸거

drop table product_orderItem
drop table product_order

insert into product_order
     values(#{orderId},#{memberId},#{productId},#{productCount},#{productPrice},
     #{memberAddr1},#{memberAddr2},#{orderState},sysdate)

이거를 3번반복한다치자 대신에 시퀀스로 프라이머리가 올라감 그럼 같은데이터가 3번이야
갯 프로덕트 바이를 3번굴려야함 단) 굴릴때마다 +1이되게

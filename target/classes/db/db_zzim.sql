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

create table product_detail(
    d_num number(4) primary key, 
    d_master_num number(10) not null, 
    d_category varchar2(20 char) not null,
    d_quantity number(3) not null,
    d_size varchar2(20 char) not null,
    d_color varchar2 (20 char) not null,
    constraint d_test
        foreign key(d_master_num) references product_master(p_num)
        on delete cascade    --마스터 삭제하면 연관된 디테일도 삭제됨

)

select * from product_master
select * from product_detail where d_num = 2



  FOREIGN KEY (orderId) REFERENCES vam_order(orderId),
    FOREIGN KEY (bookId) REFERENCES vam_book(bookId)

    --테스트 시작--

create table testid(
a_id varchar2(20 char) primary key,
a_name varchar2(20 char) not null
)

create table testproduct(
p_num number(10) primary key, 
p_name varchar2 (100 char) not null,
p_price number(10) not null
)

create table testzzim(
t_no number(10) primary key, 
t_num number(10) not null,
t_id varchar2 (100 char) not null,
 constraint f_test FOREIGN KEY (t_id) REFERENCES testid(a_id) on delete cascade,
constraint f_test2 FOREIGN KEY (t_num) REFERENCES testproduct(p_num) on delete cascade
)


constraint f_test FOREIGN KEY (t_id) REFERENCES testid(a_id) on delete cascade,
constraint f_test2 FOREIGN KEY (t_num) REFERENCES testproduct(p_num) on delete cascade

insert into testproduct values(1,'물건1',3000)
insert into testproduct values(2,'물건2',5000)
insert into testproduct values(3,'물건3',5500)
insert into testid values('id1','이름1')
insert into testid values('id2','이름2')
insert into testzzim values(1,2,'id1')
insert into testzzim values(2,1,'id1')
insert into testzzim values(3,1,'id2')
insert into testzzim values(4,2,'id2')
insert into testzzim values(5,3,'id2')


   select * from testproduct
   select * from testid
   select * from testzzim
   delete from testid where a_id= 'id2';
   delete from testproduct where p_name= '물건2';

   
SELECT *
FROM testid , testzzim, testproduct
WHERE testid.a_id = testzzim.t_id
AND testzzim.t_num = testproduct.p_num
AND testzzim.t_id ='id1'

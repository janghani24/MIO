create table mio_community(
c_no number(5) primary key,
c_owner varchar2(20 char) not null,
c_txt varchar2(300 char) not null,
c_date date not null
)

create sequence mio_community_seq;

select * from mio_community;

insert into mio_community values (mio_community_seq.nextval, 'dj' , 'test~~!!', sysdate );

insert into mio_community values (200, 'hn' , 'test~~!!22', sysdate );
insert into mio_community values (201, 'yj' , 'Testtest~~!!2233333', sysdate );
insert into mio_community values (202, 'jh' , 'TestTestTesttest~~!!22444444', sysdate );


insert into mio_community_re values (100, 200 ,'dj' ,'re_test~~!!22', sysdate );
insert into mio_community_re values (101, 200 ,'hn' ,'re_teste_teste_test~~!!22', sysdate );
insert into mio_community_re values (102, 200 ,'jh' ,'re_teste_teste_teste_test~~!!22', sysdate );

create table mio_community_re(
	r_no number(5) primary key,
	r_c_no number(5) not null,
	r_owner varchar2(10 char) not null,
	r_txt varchar2(100 char) not null,
	r_when date not null,
	constraint s_r_
			foreign key(r_c_no)
			references mio_community(c_no)
			on delete cascade
);

create sequence mio_community_re_seq;
select * from mio_community_re;
delete MIO_COMMUNITY_RE;

	
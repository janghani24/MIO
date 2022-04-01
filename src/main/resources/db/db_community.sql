create table mio_community(
c_no number(5) primary key,
c_owner varchar2(20 char) not null,
c_txt varchar2(300 char) not null,
c_date date not null
);

create sequence mio_community_seq;

select * from mio_community;

insert into mio_community values (mio_community_seq.nextval, 'djtest' , '요즘 냉장냉동식품  대부분 물을 얼린 얼음팩 그대로 오는듯해요.예전엔 플라스틱+물 섞인 팩이었다면 지금은 물만 얼려져서 옵니다. 자르고 내용물 버리면 돼요!', sysdate );
insert into mio_community values (mio_community_seq.nextval, 'hntest' , '혹시 비건식 쪽 밀키트 구독서비스 괜찮은데 아는 분 있으신가요?', sysdate );
insert into mio_community values (mio_community_seq.nextval, 'yjtest' , 'ㅇㅇ동에서 비건식당 발견해서 가봤는데 맛있었어요!', sysdate );
insert into mio_community values (mio_community_seq.nextval, 'jhtest' , '어제 저녁에 플로깅다녀왔는데 담배꽁초 너무 많더라구요ㅠㅠ길에 좀 안버렸으면ㅠ', sysdate );
insert into mio_community values (mio_community_seq.nextval, 'hntest' , 'ㅇㅇ에서 나온 샴푸바 써봤는데 괜찮았어요! 담에도 주문 할 듯!', sysdate );
insert into mio_community values (mio_community_seq.nextval, 'yjtest' , '통으로 된 화장품은 재활용이 되는데 튜브형은 뚜껑밖에 재활용이 안된데요. 조금씩 사용 줄이면 좋을것같아요!', sysdate );


insert into mio_community_re values (mio_community_re_seq.nextval, 1 ,'hntest' ,'변화가 생기고있는것같아서 다행이네요', sysdate );
insert into mio_community_re values (mio_community_re_seq.nextval, 2 ,'jhtest' ,'ㅇㅇㅇㅇ에 비건 밀키트 구독서비스 있었던거 같아요!', sysdate );
insert into mio_community_re values (mio_community_re_seq.nextval, 2 ,'djtest' ,'ㅇㅇㅇㅇ에두 도시락 있어서! 저는 가끔씩 주문해서 회사 점심시간에 먹어용', sysdate );
insert into mio_community_re values (mio_community_re_seq.nextval, 4 ,'djtest' ,'저도 오늘 다녀오려구요!', sysdate );
insert into mio_community_re values (mio_community_re_seq.nextval, 3 ,'hntest' ,'오오 저도 가봐야겠네요', sysdate );
insert into mio_community_re values (mio_community_re_seq.nextval, 5 ,'yjtest' ,'저도 그거 써봤어요! 너무 좋았어서 또 구매하려구요', sysdate );

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

alter sequence mio_community_seq nocache;
alter sequence mio_community_seq increment by 1; 
drop table mio_community cascade constraint purge;
drop table mio_community_re cascade constraint purge;
drop sequence mio_community_seq;
drop sequence mio_community_re_seq;

create sequence mio_community_re_seq;
select * from mio_community_re;
delete MIO_COMMUNITY_RE;

	
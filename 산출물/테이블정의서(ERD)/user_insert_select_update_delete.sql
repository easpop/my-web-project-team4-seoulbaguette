--user_info insert--
insert into user_info values('jungwook1234','1234','이정욱','jungwook@naver.com','01012345678',111);
insert into user_info values('yeji2345','2345','한예지','yeji@naver.com','01023456789',222);
insert into user_info values('guntae123','123123','박건태','guntae@naver.com','01023455678',333);
insert into user_info values('woohuck45','4567','이우혁','woohuck@naver.com','01012355678',444);
insert into user_info values('sungjun968','6234','김성준','sungjun@naver.com','01065345678',555);
insert into user_info values('juhee13','1313','이주희','juhee@naver.com','01067895678',666);
insert into user_info values('admin','0000','관리자','admin@naver.com','01000000000',0);

--address insert--
insert into address values(address_add_no_SEQ.nextval,'서울시 강남구  ','jungwook1234');
insert into address values(address_add_no_SEQ.nextval,'경기도 평택시  ','jungwook1234');
insert into address values(address_add_no_SEQ.nextval,'서울시 마포구  ','juhee13');
insert into address values(address_add_no_SEQ.nextval,'서울시 강남구 ','woohuck45');
insert into address values(address_add_no_SEQ.nextval,'경기도 수원시  ','guntae123');
insert into address values(address_add_no_SEQ.nextval,'경기도 오산시  ','guntae123');
insert into address values(address_add_no_SEQ.nextval,'강원도 속초시 ','yeji2345');
insert into address values(address_add_no_SEQ.nextval,'서울시 관악구 ','sungjun968');

desc user_info;

/*
이름            널?       유형            
------------- -------- ------------- 
USER_ID       NOT NULL VARCHAR2(100) 
USER_PASSWORD          VARCHAR2(10)  
USER_NAME              VARCHAR2(100) 
USER_EMAIL             VARCHAR2(100) 
USER_PHONE             VARCHAR2(20)  
USER_POINT             NUMBER(10)    
*/

desc address;
/*
이름      널?       유형            
------- -------- ------------- 
ADD_NO  NOT NULL NUMBER(10)    
ADDRESS          VARCHAR2(50)  
USER_ID          VARCHAR2(100) 
*/


/*select*/
/*'three'회원의 정보 출력*/
select * from user_info where user_id='three';

/*'three' 회원의 주소록 출력*/
select * from address where user_id='three';

/*'three' 회원의 정보 &주소록 한번에 출력*/
select * from user_info u
join address a
on u.user_id= a.user_id
where u.user_id='three';

/*모든 회원의 정보 출력*/
select * from user_info;

/*모든 회원의 주소록 출력*/
select * from address;

/*모든 회원의 정보&주소록 출력*/
select * from user_info u
join address a
on u.user_id=a.user_id;

/**update**/
/*(회원입장) 'two' 회원 정보 수정 - 아이디, 포인트 변경 불가 */
update user_info set user_password='update',user_name='업데이트',user_phone='12121212',user_email='update@email.com'
where user_id='two';

/*회원 포인트 1000원 증가/감소*/
update user_info set user_point=user_point+ 1000
where user_id='two';

update user_info set user_point=user_point+ -1000
where user_id='two';

/*3번 회원이 존재하는 자기의 주소록 중 하나  변경 (login 상태에서 이미 해당 회원id로 주소록 select 되어 있을테니 add_no로 접근)  */
update address set address='변경된 주소' 
where add_no=4;

/*****delete *******/
/*'one'회원의 탈퇴 -주소록도 함께삭제됨*/
delete from user_info where user_id ='one';


/*'three'회원의 주소록 중 1개 삭제*/
delete from address where add_no=6; 

/*'three'회원의 주소록 전체 삭제*/
delete from address where user_id='three';








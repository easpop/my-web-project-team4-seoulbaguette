desc coupon;
/*
이름           널?       유형            
------------ -------- ------------- 
C_NO         NOT NULL NUMBER(10)    
C_START_DATE          DATE          
C_END_DATE            DATE          
C_DISCOUNT            NUMBER(10)    
USER_ID               VARCHAR2(100)
*/

-- insert
insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate,sysdate + 7,20,'juhee13');
insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate,sysdate + 3,30,'juhee13');
insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate,sysdate + 1,10,'juhee13');

insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate,sysdate + 7,20,'yeji2345');
insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate,sysdate + 3,30,'yeji2345');
insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate,sysdate + 1,10,'yeji2345');

insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate-2,sysdate + 7,20,'guntae123');
insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate-1,sysdate + 3,30,'guntae123');
insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate,sysdate + 1,10,'guntae123');

insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate-1,sysdate,100,'guntae123');
insert into coupon(c_no,c_start_date,c_end_date,c_discount,user_id) values(coupon_c_no_SEQ.nextval,sysdate-2,sysdate-1,100,'guntae123');


--select 
-- 쿠폰 번호 하나로 찾기 
select * from coupon where c_no=3;

-- 회원의 전체 쿠폰 출력 
select * from coupon where user_id='juhee13';

--update 
update coupon set c_discount=50 where c_no =2;

--delete

--쿠폰 하나 사용(삭제) 
delete coupon where c_no=8;

-- 기한 지난 쿠폰 삭제
delete coupon where c_end_date < sysdate-1;

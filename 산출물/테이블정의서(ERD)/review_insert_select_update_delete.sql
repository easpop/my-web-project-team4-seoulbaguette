desc review;
/*
이름          널?       유형            
----------- -------- ------------- 
R_NO        NOT NULL NUMBER(10)    
R_TITLE              VARCHAR2(100) 
R_DATE               DATE          
R_STARGRADE          NUMBER(10)    
R_CONTENT            VARCHAR2(300) 
USER_ID              VARCHAR2(100) 
P_NO                 NUMBER(10)    
*/

insert into category values (1,'브레드'); 
insert into category values (2,'케이크'); 
insert into category values (3,'샌드위치'); 
insert into product values (product_p_no_SEQ.nextval,'추억의 소시지빵',2200,'1.jpg','짭조름한 소시지와 옥수수 마요 토핑의 거부할 수 없는 단짠 매력!',0,1); 
insert into product values (product_p_no_SEQ.nextval,'슈크림빵',1600,'2.jpg','폭신한 빵 속에 달콤하고 부드러운 노란빛의 슈크림이 가득!',0,1); 
insert into product values (product_p_no_SEQ.nextval,'초코소라빵',1400,'3.jpg','정성을 다하여 구워낸 왕 소라빵 속에 초코크림이 가득 든 간식빵!',0,1); 
insert into product values (product_p_no_SEQ.nextval,'치츠듬뿍 어니언',3400,'4.jpg','큼지막한 빵에 양파와 치즈가 가득 들어 함께 먹기 좋은 조리빵',0,1); 



insert into review(r_no,r_title,r_date,r_stargrade,r_content,user_id,p_no) values(review_r_no_SEQ.nextval,'리뷰1',sysdate,3,'리뷰1내용','three',8);
insert into review(r_no,r_title,r_date,r_stargrade,r_content,user_id,p_no) values(review_r_no_SEQ.nextval,'리뷰2',sysdate,3,'리뷰2내용','three',9);
insert into review(r_no,r_title,r_date,r_stargrade,r_content,user_id,p_no) values(review_r_no_SEQ.nextval,'리뷰3',sysdate,3,'리뷰3내용','three',10);

insert into review(r_no,r_title,r_date,r_stargrade,r_content,user_id,p_no) values(review_r_no_SEQ.nextval,'리뷰1',sysdate,3,'리뷰1내용','two',8);
insert into review(r_no,r_title,r_date,r_stargrade,r_content,user_id,p_no) values(review_r_no_SEQ.nextval,'리뷰2',sysdate,3,'리뷰2내용','two',13);
insert into review(r_no,r_title,r_date,r_stargrade,r_content,user_id,p_no) values(review_r_no_SEQ.nextval,'리뷰3',sysdate,3,'리뷰3내용','two',12);

insert into review(r_no,r_title,r_date,r_stargrade,r_content,user_id,p_no) values(review_r_no_SEQ.nextval,'리뷰1',sysdate,3,'리뷰1내용','one',8);
insert into review(r_no,r_title,r_date,r_stargrade,r_content,user_id,p_no) values(review_r_no_SEQ.nextval,'리뷰2',sysdate,3,'리뷰2내용','one',14);
insert into review(r_no,r_title,r_date,r_stargrade,r_content,user_id,p_no) values(review_r_no_SEQ.nextval,'리뷰3',sysdate,3,'리뷰3내용','one',15);


/*select */

-- 'three' 회원의 리뷰 전체 출력
select * from review r join product p on r.p_no=p.p_no where user_id='three';

--리뷰 하나 상세보기
select * from review r join product p on r.p_no=p.p_no where r.r_no=10;

--'8' 상품 리뷰 전체 출력
select * from review where p_no=14;

/*update*/
--리뷰 1개의 내용 수정 (가능한 수정 내용 =별점,제목,내용)
update review set r_stargrade=4, r_title='변경리뷰',r_content='변경내용' where r_no=11;

/*delete*/
--리뷰 1개 삭제
delete from review where r_no=14;

/* 상품 삭제시 연계된 리뷰들도 다 삭제 
delete from product where p_no=8;
*/

/*
delete from user_info where user_id='three';
*/



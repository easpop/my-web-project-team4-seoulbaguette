desc cart;
/*
이름       널?       유형            
-------- -------- ------------- 
CART_NO  NOT NULL NUMBER(10)    
CART_QTY          NUMBER(10)    
USER_ID           VARCHAR2(100) 
P_NO              NUMBER(10) 
*/

--insert
insert into cart(cart_no,cart_qty,user_id,p_no) values(cart_cart_no_SEQ.nextval,1,'yeji2345',1);
insert into cart(cart_no,cart_qty,user_id,p_no) values(cart_cart_no_SEQ.nextval,2,'jungwook1234',5);
insert into cart(cart_no,cart_qty,user_id,p_no) values(cart_cart_no_SEQ.nextval,3,'guntae123',12);
insert into cart(cart_no,cart_qty,user_id,p_no) values(cart_cart_no_SEQ.nextval,4,'woohuck45',8);
insert into cart(cart_no,cart_qty,user_id,p_no) values(cart_cart_no_SEQ.nextval,5,'sungjun968',22);
insert into cart(cart_no,cart_qty,user_id,p_no) values(cart_cart_no_SEQ.nextval,6,'juhee13',24);

--update
update cart set qty='update' where user_id='updateuserid' and p_no='updatep_no';

--delete
delete from cart where user_id='deleteuserid';

--select
select*from cart where user_id='selectuserid';
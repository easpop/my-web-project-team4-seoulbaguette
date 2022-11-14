--insert
------------------------------orders-----------------------------------------------------------

insert into orders values(orders_o_no_SEQ.nextval,'배송준비',sysdate,10000,'yeji2345',1);
insert into orders values(orders_o_no_SEQ.nextval,'배송준비',sysdate,5000,'yeji2345',3);
insert into orders values(orders_o_no_SEQ.nextval,'배송중',sysdate,3000,'yeji2345',4);
insert into orders values(orders_o_no_SEQ.nextval,'배송중',sysdate,10000,'yeji2345',2);
insert into orders values(orders_o_no_SEQ.nextval,'배송중',sysdate,2000,'yeji2345',4);
insert into orders values(orders_o_no_SEQ.nextval,'배송완료',sysdate,4000,'yeji2345',2);
insert into orders values(orders_o_no_SEQ.nextval,'배송완료',sysdate,10000,'yeji2345',8);

------------------------------order_item---------------------------------
insert into order_item values(order_item_oi_no_SEQ.nextval,2,1,130);
insert into order_item values(order_item_oi_no_SEQ.nextval,1,2,131);
insert into order_item values(order_item_oi_no_SEQ.nextval,2,3,133);
insert into order_item values(order_item_oi_no_SEQ.nextval,3,4,135);
insert into order_item values(order_item_oi_no_SEQ.nextval,4,5,136);
insert into order_item values(order_item_oi_no_SEQ.nextval,5,6,128);

--delete
-------------------------orders & order_item ------------------------------
--id로 주문리스트 삭제 --> 리스트의 order_item까지 삭제.  
delete from orders where user_id='one' ;

--update
-------------------------orders & order_item ------------------------------
-- 주문상품번호로 상품수량 변경 
update order_item set oi_qty = 3 where oi_no = 1;

-- 배송상태 변경 (관리자계정 만약 한다면 필요할...것 같아서..혹시나해서)
update orders set o_desc = '배송지연' where o_no = 2;


--select
--user Id로 o_no 찾기 
select o_no from orders where user_id='two';
--user Id로 주문리스트 찾기 
select * from orders where user_id = 'two';

--user Id와 날짜로 o_no찾기 
select o_no from orders where user_id='two' and To_char(o_date,'YYYYMMDD')='20220801';

--o_no로 주문상세 상품 보기
--select * from order_item where o_no=2;
select * from orders o join order_item d on o.o_no=d.o_no join product p on d.p_no=p.p_no where o.o_no=2;


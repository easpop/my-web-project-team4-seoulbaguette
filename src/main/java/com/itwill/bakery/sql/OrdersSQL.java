package com.itwill.bakery.sql;

public class OrdersSQL {

	public static final String ORDERS_INSERT = 
		"insert into orders values(orders_o_no_SEQ.nextval,'상품준비중',sysdate,?,?,?)";
	
	public static final String ORDER_ITEM_INSERT =
		"insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,?,orders_o_no_SEQ.currval,?)";

	public static final String SELECT_BY_ID ="select * from orders where user_id=? order by o_date desc";
	
	public static final String SELECT_ALL=
		"select * from orders o join order_item d on o.o_no=d.o_no join product p on d.p_no=p.p_no where o.user_id=? and o.o_no=? ";
	
	//로그인한 멤버의 주문번호 목록 

	public static final String SELECT_ORDER_NO_BY_ID = 
		"select o_no from orders where user_id=?  order by o_date desc";
	
	public static final String DELETE_ALL_BY_ID = "delete from orders where user_id=?";

	public static final String DELETE_SELECT = "delete from orders where o_no=?";
	
}

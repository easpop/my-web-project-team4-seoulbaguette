
package com.itwill.bakery.sql;

public class CartSQL {
	public static final String INSERT_CART =
			"insert into cart(cart_no,user_id,p_no,cart_qty) values(cart_cart_no_SEQ.nextval,?,?,?)";
	public static final String SELECT_CART_BY_USERID=
			"select * from cart c join product p on c.p_no=p.p_no where c.user_id=?";
	public static final String SELECT_CART_BY_CART_NO=
			"select * from cart c join product p on c.p_no=p.p_no where cart_no=?";
	public static final String ADD_QTY=
			"update cart set cart_qty=cart_qty+? where user_id=? and p_no=?";
	public static final String UPDATE_QTY=
			"update cart set cart_qty=? where user_id=? and cart_no=?";
	public static final String DELETE_CART_BY_CART_NO=
			"delete cart where cart_no=?";
	public static final String DELETE_CART_BY_USERID=
			"delete cart where user_id=?";
	public static final String SELECT_CART_PRODUCT_COUNT_BY_USERID_P_NO=
			"select count(*) product_count from cart where user_id=? and p_no=?";
}

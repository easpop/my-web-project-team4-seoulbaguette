package com.itwill.bakery.service;

import java.util.ArrayList;

import com.itwill.bakery.dao.CartDao;
import com.itwill.bakery.vo.Cart;

public class CartService {
	private CartDao cartDao;
	public CartService()throws Exception{
		cartDao=new CartDao();
	}
	
	//cart create
	public int CreateCart(String user_id,int p_no,int cart_qty)throws Exception{
		if(cartDao.cartProductExist(user_id,p_no)){
			return cartDao.addQty(user_id, p_no, cart_qty);
		}else {
			return cartDao.insertCart(user_id,p_no,cart_qty);
		}
	}
	
	//cart update
	public int updateQty(String user_id,int p_no,int cart_qty)throws Exception{
		return cartDao.updateQty(user_id,p_no,cart_qty);
	}
	
	public int addQty(String user_id ,int c_no,int cart_qty)throws Exception{
		return cartDao.addQty(user_id,c_no,cart_qty);
	}
	
	//cart deleteAll
	public int deleteCartByUserId(String userid)throws Exception{
		return cartDao.deleteCart(userid);
	}
	
	//cart deleteByCNo
	public int deleteCartByCNo(int cart_no)throws Exception{
		return cartDao.deleteCartByCNo(cart_no);
	}
	
	//select cartlist
	public ArrayList<Cart> selectCartList(String user_id)throws Exception{
		return cartDao.selectCartByUserid(user_id);
	}
	
	//select cart
	public Cart selectCart(int cart_no)throws Exception{
		return cartDao.selectCartByCartNo(cart_no);
	}
}

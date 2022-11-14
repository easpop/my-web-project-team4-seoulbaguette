package com.itwill.bakery.dao.test;

import com.itwill.bakery.dao.CartDao;
import com.itwill.bakery.vo.Cart;
import com.itwill.bakery.vo.Product;

public class CartDaoTestMain {

	public static void main(String[] args) throws Exception {

		CartDao cartDao=new CartDao();
		
		/*
		 * System.out.println(cartDao.cartProductExist("yeji2345", 1));
		 * System.out.println(cartDao.insertCart("yeji2345",2,3));
		 * System.out.println(cartDao.selectCartByUserid("yeji2345"));
		 * System.out.println(cartDao.selectCartByCartNo(2));
		 * System.out.println(cartDao.deleteCart("woohuck45"));
		 * System.out.println(cartDao.deleteCartByCNo(6));
		 */
		  //System.out.println(cartDao.UpdateQty("yeji2345",7,40));
		  //System.out.println(cartDao.updateQtyByPNo("yeji2345", 3, 5));
		  System.out.println(cartDao.insertCart("yeji2345",5,1));
			/*
			 * System.out.println(cartDao.updateQtyByPNo(new Cart(0, 6, new Product(3,
			 * null,0, null, null, 0, 0), "yeji2345")));
			 */
	}
	

}

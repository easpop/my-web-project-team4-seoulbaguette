package com.itwill.bakery.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.bakery.dao.CartDao;
import com.itwill.bakery.dao.OrdersDao;
import com.itwill.bakery.dao.ProductDao;
import com.itwill.bakery.vo.Cart;
import com.itwill.bakery.vo.OrderItem;
import com.itwill.bakery.vo.Orders;
import com.itwill.bakery.vo.Product;



public class OrderService {
	private OrdersDao ordersDao;
	private ProductDao productDao;
	private CartDao cartDao;
	public OrderService() throws Exception{
		ordersDao=new OrdersDao();
		productDao=new ProductDao();
		cartDao=new CartDao();
	}
	/*
	 * 주문목록
	 */
	public ArrayList<Orders> list(String sUserId) throws Exception{
		return ordersDao.list(sUserId);
	}
	/*
	 * 주문상세보기
	 */
	public Orders detail(String sUserId,int o_no)throws Exception{
		return ordersDao.detail(sUserId,o_no);
	}
	/*
	 * 주문목록 + 상품상세
	 */
	public List<Orders> list_detail(String sUserId) throws Exception{
		
		return ordersDao.list_detail(sUserId);
	}
	/*
	 * 상품에서 직접주문
	 */
	public int create(String sUserId,int p_no,int oi_qty,int add_no) throws Exception{
		Product product=productDao.selectByNo(p_no);
		OrderItem orderItem=new OrderItem(0, oi_qty, p_no, product);
		ArrayList<OrderItem> orderItemList=new ArrayList<OrderItem>();
		orderItemList.add(orderItem);
		int o_price = oi_qty*product.getP_price();
		Orders newOrder=
				new Orders(0,"",null,o_price,sUserId,add_no,orderItemList);
		return ordersDao.create(newOrder);
	}
	
	public int createTest(String sUserId,int p_no,int oi_qty,int add_no,int o_price) throws Exception{
		Product product=productDao.selectByNo(p_no);
		OrderItem orderItem=new OrderItem(0, oi_qty, p_no, product);
		ArrayList<OrderItem> orderItemList=new ArrayList<OrderItem>();
		orderItemList.add(orderItem);
		
		Orders newOrder=
				new Orders(0,"",null,o_price,sUserId,add_no,orderItemList);
		return ordersDao.create(newOrder);
	}
	
	//  cart에서 주문
	 
	public int create(String sUserId) throws Exception{
		List<Cart> cartList=cartDao.selectCartByUserid(sUserId);
		ArrayList<OrderItem> orderItemList=new ArrayList<OrderItem>();
		int o_tot_price=0;
		int oi_tot_count=0;
		for (Cart cart : cartList) {
			OrderItem orderItem=new OrderItem(0,cart.getCart_qty(),0, cart.getProduct());
			orderItemList.add(orderItem);
			o_tot_price+=orderItem.getOi_qty()*orderItem.getProduct().getP_price();
			oi_tot_count+=orderItem.getOi_qty();
		}
		Orders newOrder=new Orders(0,"", null, o_tot_price, sUserId,1,orderItemList);
		ordersDao.create(newOrder);
		cartDao.deleteCart(sUserId);
		return 0;
	}
	
	 // cart에서 선택주문
	
	public int create(String sUserId,String[] cart_item_noStr_array) throws Exception{
		
		ArrayList<OrderItem> orderItemList=new ArrayList<OrderItem>();
		int o_tot_price=0;
		int oi_tot_count=0;
		for(int i =0;i<cart_item_noStr_array.length;i++) {
			Cart  cartItem = cartDao.selectCartByCartNo(Integer.parseInt(cart_item_noStr_array[i]));
			OrderItem orderItem=new OrderItem(0, cartItem.getCart_qty(),0,cartItem.getProduct());
			orderItemList.add(orderItem);
			o_tot_price+=orderItem.getOi_qty()*orderItem.getProduct().getP_price();
			oi_tot_count+=orderItem.getOi_qty();
		}
		Orders newOrder=new Orders(0,"", null, o_tot_price, sUserId,1,orderItemList);
		ordersDao.create(newOrder);
		for(int i =0;i<cart_item_noStr_array.length;i++) {
			cartDao.deleteCartByCNo(Integer.parseInt(cart_item_noStr_array[i]));
		}
		return 0;
	}
public int createTest(String sUserId,String[] cart_item_noStr_array,int tot_price,int address) throws Exception{
		
		ArrayList<OrderItem> orderItemList=new ArrayList<OrderItem>();
		int o_tot_price=0;
		int oi_tot_count=0;
		for(int i =0;i<cart_item_noStr_array.length;i++) {
			Cart  cartItem = cartDao.selectCartByCartNo(Integer.parseInt(cart_item_noStr_array[i]));
			OrderItem orderItem=new OrderItem(0, cartItem.getCart_qty(),0,cartItem.getProduct());
			orderItemList.add(orderItem);
			o_tot_price=tot_price;
			oi_tot_count+=orderItem.getOi_qty();
		}
		Orders newOrder=new Orders(0,"", null, o_tot_price, sUserId,address,orderItemList);
		ordersDao.create(newOrder);
		for(int i =0;i<cart_item_noStr_array.length;i++) {
			cartDao.deleteCartByCNo(Integer.parseInt(cart_item_noStr_array[i]));
		}
		return 0;
	}

	/*
	 * 주문전체삭제
	 */
	public int delete(String sUserId)throws Exception{
		return ordersDao.delete(sUserId);
	}
	
	/*
	 * 주문1개삭제
	 */
	public int deleteByOrderNo(int o_no)throws Exception{
		return ordersDao.deleteByOrderNo(o_no);
	}
	
	
	
}

package com.itwill.bakery.dao.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.bakery.dao.CartDao;
import com.itwill.bakery.dao.OrdersDao;
import com.itwill.bakery.dao.ProductDao;
import com.itwill.bakery.vo.Cart;
import com.itwill.bakery.vo.OrderItem;
import com.itwill.bakery.vo.Orders;
import com.itwill.bakery.vo.Product;


public class OrdersDaoTest {
	public static void main(String[] args) throws Exception {
		ProductDao productDao = new ProductDao();
		OrdersDao ordersDao = new OrdersDao();
		CartDao cartDao = new CartDao();
		List<OrderItem> oList = new ArrayList<OrderItem>(); 
		OrderItem orderItem = new OrderItem(0,2,2,new Product(2,"",1000,"","s",3,4));
		oList.add(orderItem);
		
		//확인 
		//System.out.println("주문 생성");
	    //System.out.println(ordersDao.create(new Orders(0,"",null,1000,"guntae123",11,oList)));
		
		//확인
		//System.out.println("주문 전체");
		//System.out.println(ordersDao.list("guntae123"));
		
		//확인
		//System.out.println("주문 상세보기");
		//System.out.println(ordersDao.detail("three",3));
		
		// 08.03 한번에 촤라락..
		//List<Orders> orderList = ordersDao.list_detail("three");
		//System.out.println(orderList);
		
		//삭제
		//System.out.println(ordersDao.delete("yeji2345"));
		
		
		
		
		
		
		
		
		
	}
}

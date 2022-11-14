package com.itwill.bakery.dao.test;

import com.itwill.bakery.dao.OrderReviewDAO;
import com.itwill.bakery.service.OrderReviewService;

public class OrderReviewDaoTestMain {
	public static void main(String[] args) throws Exception {
		OrderReviewDAO orDao = new OrderReviewDAO();
		OrderReviewService orderReviewService =new OrderReviewService();
		System.out.println("1. 리뷰작성시 or 테이블에 insert");
		//System.out.println(orDao.insertOR(new Order_ReviewDto(33, 2)));
		
		System.out.println("2. 해당 order item 리뷰작성했었는지 check ");
		System.out.println(orDao.checkOR(33));
		System.out.println(orDao.checkOR(36));
		System.out.println(orDao.checkOR(89));
		System.out.println(orderReviewService.checkOR(89));

	}

}

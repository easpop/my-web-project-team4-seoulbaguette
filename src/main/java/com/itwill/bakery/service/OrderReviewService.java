package com.itwill.bakery.service;

import com.itwill.bakery.dao.OrderReviewDAO;
import com.itwill.bakery.vo.Order_Review;

public class OrderReviewService {
	OrderReviewDAO orderReviewDao;
	
	public OrderReviewService() throws Exception {
		this.orderReviewDao=new OrderReviewDAO();
	}
	
	//리뷰작성시 OR 테이블에도 리뷰번호 / 오더아이템번호 추가 
	public int insertOR(Order_Review orderReview) throws Exception{
		return orderReviewDao.insertOR(orderReview);
	}
	
	//orderitem 리뷰작성 버튼 활성화/비활성화 체크시 필요한 메소드 (이미 해당 아이템에 리뷰를 작성했었으면 1 반환 / 작성한적이 없다면 0 반환) 
	public int checkOR(int oi_no) throws Exception{
		return orderReviewDao.checkOR(oi_no);
	}
	
	public int returnRno(int oi_no) throws Exception{
		return orderReviewDao.returnR_no(oi_no);
	}

}

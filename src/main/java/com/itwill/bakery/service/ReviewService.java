package com.itwill.bakery.service;

import java.util.List;

import com.itwill.bakery.dao.ReviewDao;
import com.itwill.bakery.vo.Product;
import com.itwill.bakery.vo.Review;

public class ReviewService {
	public ReviewDao reviewDao;
	
	public ReviewService() throws Exception {
		this.reviewDao=new ReviewDao();
	}

	//리뷰 작성
	public int writeReivew(Review review,int oi_no) throws Exception{
		return reviewDao.createReview(review,oi_no);
	}
	
	//리뷰 삭제
	public int deleteReivew(Review review) throws Exception{
		return reviewDao.deleteReview(review);
		
	}
	
	public int deleteReivew(int r_no) throws Exception{
		Review review=new Review(r_no, null, null, 0, null, null, null);
		return reviewDao.deleteReview(review);
		
	}
	
	
	
	
	
	//리뷰 수정 
	public int updateReview(Review review) throws Exception{
		return reviewDao.updateReview(review);
	}
	
	
	//회원의 리뷰 전체 출력
	public List<Review> selectReviewById(Review review) throws Exception{
		return reviewDao.selectReviewById(review);
	}
	
	public List<Review> selectReviewById(String userId) throws Exception{
		Review review=new Review(0, null, null, 0, null, userId, null);
		return reviewDao.selectReviewById(review);
	}
	
	//상품의 리뷰 전체 출력
	public List<Review> selectReviewByP(Review review)throws Exception{
		return reviewDao.selectReviewByP(review);
	}
	
	public List<Review> selectReviewByP(int p_no)throws Exception{
		Review review=new Review(0, null, null, 0, null, null, new Product(p_no, null, 0, null, null, 0, 0));
		return reviewDao.selectReviewByP(review);
	}
	
	//단일 리뷰 1개 상세 보기 
	public Review selectReview(Review review)throws Exception{
		return reviewDao.selectReviewOne(review);
	}
	
	public Review selectReview(int r_no)throws Exception{
		Review review=new Review(r_no, null, null, 0, null, null, null);
		return reviewDao.selectReviewOne(review);
	}
}

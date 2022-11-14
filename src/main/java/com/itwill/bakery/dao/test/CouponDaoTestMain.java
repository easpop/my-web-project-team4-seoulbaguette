package com.itwill.bakery.dao.test;

import com.itwill.bakery.dao.CouponDao;
import com.itwill.bakery.vo.Coupon;

public class CouponDaoTestMain {
	public static void main(String[] args) throws Exception {
		CouponDao couponDao = new CouponDao();
		System.out.println("쿠폰 생성");
		//System.out.println(couponDao.createCoupon(new Coupon(0, null, null, 99, "juhee13", 10)));
		System.out.println("쿠폰 사용 ");
		//System.out.println(couponDao.deleteCoupon_Use(new Coupon(3, null, null, 0, null, 0)));
		
		System.out.println("쿠폰 날짜 기한 지남");
		System.out.println(couponDao.deleteCoupon_Date());
		
		System.out.println("쿠폰 번호로 1개 찾기");
		System.out.println(couponDao.selectCouponByNo(new Coupon(17, null, null, 0, null, 0)));
	
		System.out.println("회원의 쿠폰리스트 찾기");
		System.out.println(couponDao.selectCouponById(new Coupon(0, null, null, 0, "juhee13", 0)));
		
		
	
	}

}

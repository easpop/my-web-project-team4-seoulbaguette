package com.itwill.bakery.service;

import java.util.List;

import com.itwill.bakery.dao.CouponDao;
import com.itwill.bakery.vo.Coupon;

public class CouponService {
	public CouponDao couponDao;

	public CouponService() throws Exception{
		this.couponDao = new CouponDao();
	}
	
	//쿠폰 발급
	public int createCoupon(Coupon coupon) throws Exception{
		return couponDao.createCoupon(coupon);
	}
	
	//쿠폰 사용(삭제)
	public int useCoupon(Coupon coupon) throws Exception{
		return couponDao.deleteCoupon_Use(coupon);
	}
	
	public int useCoupon(int c_no) throws Exception{
		Coupon coupon=new Coupon(c_no, null, null, 0, null, 0);
		return couponDao.deleteCoupon_Use(coupon);
	}
	
	//쿠폰 기한 지남 (삭제)
	
	public int deleteCouponDate() throws Exception{
		return couponDao.deleteCoupon_Date();
	}
	
	//쿠폰 1개 상세 보기
	
	public Coupon selectCoupon(Coupon coupon) throws Exception{
		return couponDao.selectCouponByNo(coupon);
	}
	
	public Coupon selectCoupon(int c_no) throws Exception{
		Coupon coupon=new Coupon(c_no,null,null,0,null,0);
		return couponDao.selectCouponByNo(coupon);

	}
	
	//회원의 보유 쿠폰 리스트 
	public List<Coupon> selectCouponById(Coupon coupon) throws Exception{
		return couponDao.selectCouponById(coupon);
	}
	
	public List<Coupon> selectCouponById(String userid) throws Exception{
		Coupon coupon=new Coupon(0, null, null, 0, userid, 0);
		return couponDao.selectCouponById(coupon);
	}

}

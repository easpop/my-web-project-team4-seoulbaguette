package com.itwill.bakery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bakery.sql.CouponSQL;
import com.itwill.bakery.vo.Coupon;

public class CouponDao {
	private DataSource dataSource;

	public CouponDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/bakery/common/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}

	public int createCoupon(Coupon coupon) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CouponSQL.COUPON_CREATE);
			pstmt.setInt(1, coupon.getPeriod());
			pstmt.setInt(2, coupon.getC_discount());
			pstmt.setString(3, coupon.getUser_id());

			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return rowCount;
	}

	public int deleteCoupon_Use(Coupon coupon) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CouponSQL.COUPON_USE_DELETE);
			pstmt.setInt(1, coupon.getC_no());

			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return rowCount;
	}

	public int deleteCoupon_Date() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CouponSQL.COUPON_DATE_DELETE);
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return rowCount;
	}

	public Coupon selectCouponByNo(Coupon coupon) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Coupon findCoupon = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CouponSQL.COUPON_SELECT_BY_NO);
			pstmt.setInt(1, coupon.getC_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				findCoupon = new Coupon(rs.getInt("c_no"), rs.getString("c_start_date"), rs.getString("c_end_date"),
						rs.getInt("c_discount"), rs.getString("user_id"), 0);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return findCoupon;
	}

	public List<Coupon> selectCouponById(Coupon coupon) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Coupon> couponList = new ArrayList<Coupon>();
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(CouponSQL.COUPON_SELECT_BY_ID);
			pstmt.setString(1, coupon.getUser_id());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				couponList.add(new Coupon(rs.getInt("c_no"), rs.getString("c_start_date"), rs.getString("c_end_date"),
						rs.getInt("c_discount"), rs.getString("user_id"), 0));
			}

		} catch (Exception e) {

			e.printStackTrace();
		}finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return couponList;
	}

}

package com.itwill.bakery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bakery.sql.OrderReviewSQL;
import com.itwill.bakery.vo.Order_Review;

public class OrderReviewDAO {
	private DataSource dataSource;

	public OrderReviewDAO() throws Exception {
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

	public int insertOR(Order_Review or) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(OrderReviewSQL.INSERT_OR);
			pstmt.setInt(1, or.getR_no());
			pstmt.setInt(2, or.getOi_no());
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

	public int checkOR(int oi_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = 0;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(OrderReviewSQL.SELECT_OR);
			pstmt.setInt(1, oi_no);

			rs = pstmt.executeQuery();
			rs.next();
			check = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}

		return check;
	}

	public int returnR_no(int oi_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int r_no = 0;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(OrderReviewSQL.RETURE_RNO);
			pstmt.setInt(1, oi_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				r_no = rs.getInt("r_no");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return r_no;
	}

}

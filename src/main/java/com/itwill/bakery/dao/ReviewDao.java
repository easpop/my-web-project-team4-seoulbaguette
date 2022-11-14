package com.itwill.bakery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bakery.sql.OrderReviewSQL;
import com.itwill.bakery.sql.ReviewSQL;
import com.itwill.bakery.vo.Product;
import com.itwill.bakery.vo.Review;



public class ReviewDao {

	private DataSource dataSource;

	public ReviewDao() throws Exception {
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

	public int createReview(Review review,int oi_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2=null;
		int rowCount = 0;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.REVIEW_CREATE);
			pstmt2=con.prepareStatement(OrderReviewSQL.INSERT_OR);
			
			pstmt.setString(1, review.getR_title());
			pstmt.setInt(2, review.getR_stargrade());
			pstmt.setString(3, review.getR_content());
			pstmt.setString(4, review.getUser_id());
			pstmt.setInt(5, review.getProduct().getP_no());
			
			pstmt2.setInt(1, oi_no);

			rowCount = pstmt.executeUpdate();
			pstmt2.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}

		return rowCount;
	}

	public int updateReview(Review review) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewSQL.REVIEW_UPDATE);
			//update review set r_stargrade=?, r_title=?,r_content=? where r_no=?
			pstmt.setInt(1, review.getR_stargrade());
			pstmt.setString(2, review.getR_title());
			pstmt.setString(3, review.getR_content());
			pstmt.setInt(4, review.getR_no());
			rowCount=pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		
		return rowCount;
	}
	
	public int deleteReview(Review review) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(ReviewSQL.REVIEW_DELETE);
			pstmt.setInt(1, review.getR_no());
			rowCount=pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		
		return rowCount;
	}
	
	public List<Review> selectReviewById(Review review) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		List<Review> reviewList=new ArrayList<Review>();
		
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_ID);
			pstmt.setString(1, review.getUser_id());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
		//int r_no, String r_title, String r_date, int r_stargrade, String r_content, String user_id,Product product
				reviewList.add(new Review(rs.getInt("r_no"), 
						rs.getString("r_title"), 
						rs.getString("r_date"), 
						rs.getInt("r_stargrade"), 
						rs.getString("r_content"), 
						rs.getString("user_id"), 
	//int p_no, String p_name, String p_price, String p_image, String p_desc, String p_click_count,int category_no						
						 new Product(rs.getInt("p_no"), 
									rs.getString("p_name"), 
									rs.getInt("p_price"), 
									rs.getString("p_image"), 
									rs.getString("p_desc"), 
									rs.getInt("p_click_count"),
									rs.getInt("category_no")
									)
						));
						}			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		
		return reviewList;
	}
	
	public List<Review> selectReviewByP(Review review) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		List<Review> reviewList=new ArrayList<Review>();
		
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_P);
			pstmt.setInt(1, review.getProduct().getP_no());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
						reviewList.add(new Review(
								rs.getInt("r_no"), 
								rs.getString("r_title"), 
								rs.getString("r_date"), 
								rs.getInt("r_stargrade"), 
								rs.getString("r_content"), 
								rs.getString("user_id"), 
								 new Product(
//int p_no, String p_name, int p_price, String p_image, String p_desc, int p_click_count,int category_no									 
										 rs.getInt("p_no"), 
										 rs.getString("p_name"), 
										 rs.getInt("p_price"), 
										 rs.getString("p_image"), 
										 rs.getString("p_desc"), 
										 rs.getInt("p_click_count"), 
										 rs.getInt("category_no"))
								 
											)
								);
								}		
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		
		return reviewList;
		
	}
	
	public Review selectReviewOne(Review review) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		Review findReview=null;
		
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(ReviewSQL.REVIEW_SELECT);
			pstmt.setInt(1, review.getR_no());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				findReview=new Review(rs.getInt("r_no"), 
						rs.getString("r_title"), 
						rs.getString("r_date"), 
						rs.getInt("r_stargrade"), 
						rs.getString("r_content"), 
						rs.getString("user_id"),  
						new Product(rs.getInt("p_no"), 
								rs.getString("p_name"), 
								rs.getInt("p_price"), 
								rs.getString("p_image"), 
								rs.getString("p_desc"), 
								rs.getInt("p_click_count"),
								rs.getInt("category_no")
								));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		
		return findReview;
	}

}

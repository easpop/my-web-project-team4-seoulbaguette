package com.itwill.bakery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bakery.sql.ProductSQL;
import com.itwill.bakery.vo.Product;

public class ProductDao {

	private DataSource dataSource;
	
	public ProductDao() throws Exception {
		BasicDataSource basicDataSource=new BasicDataSource();
		
		Properties properties=new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/bakery/common/jdbc.properties"));
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource = basicDataSource;
	}
	/*
	 * 상품 검색
	 */
	
	public Product selectByNo(int p_no) throws Exception {
		Product product = null;
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_NO);
		pstmt.setInt(1, p_no);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			product = new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"), 
								  rs.getString("p_image"), rs.getString("p_desc"), 
								  rs.getInt("p_click_count"), rs.getInt("category_no"));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return product;
	}
	/*
	 * 카테고리별 상품 검색
	 */
	public List<Product> selectByCategory(int category_no) throws Exception {
		List<Product> productList=new ArrayList<Product>();
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_CATEGORY);
		pstmt.setInt(1, category_no);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()) {
			Product product = new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"), 
					  			  rs.getString("p_image"), rs.getString("p_desc"), 
					  			  rs.getInt("p_click_count"), rs.getInt("category_no"));
			productList.add(product);
		}
		rs.close();
		pstmt.close();
		con.close();
		return productList;
	}

	
	/*
	 * 전체 상품검색
	 */
	public List<Product> selectAll() throws Exception {
		List<Product> productList=new ArrayList<Product>();
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(ProductSQL.PRODUCT_SELECT_ALL);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()) {
			Product product = new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"), 
					  			  rs.getString("p_image"), rs.getString("p_desc"), 
					  			  rs.getInt("p_click_count"), rs.getInt("category_no"));
			productList.add(product);
		}
		rs.close();
		pstmt.close();
		con.close();
		return productList;
	}
	
	/*
	 * 상품수정
	 */
	public int update(Product product) throws Exception {
		int rowCount=0;
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(ProductSQL.PRODUCT_UPDATE_BY_NO);
		pstmt.setString(1, product.getP_name());
		pstmt.setInt(2, product.getP_price());
		pstmt.setString(3, product.getP_desc());
		pstmt.setInt(4, product.getCategory_no());
		pstmt.setInt(5, product.getP_no());
		rowCount=pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	
	/*
	 * 상품삭제
	 */
	public int delete(int p_no) throws Exception {
		int rowCount=0;
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(ProductSQL.PRODUCT_DELETE_BY_NO);
		pstmt.setInt(1, p_no);
		rowCount=pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	public int insert(Product product) throws Exception{
		int rowCount=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(ProductSQL.PRODUCT_INSERT);
			pstmt.setString(1, product.getP_name());
			pstmt.setInt(2, product.getP_price());
			pstmt.setString(3, product.getP_image());
			pstmt.setString(4, product.getP_desc());
			pstmt.setInt(5, product.getCategory_no());
			
			rowCount=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(con!=null) {
				con.close();
			}
		}
		
		return rowCount;
	}

}

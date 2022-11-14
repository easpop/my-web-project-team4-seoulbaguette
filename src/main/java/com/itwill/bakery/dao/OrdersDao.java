package com.itwill.bakery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bakery.sql.OrdersSQL;
import com.itwill.bakery.vo.OrderItem;
import com.itwill.bakery.vo.Orders;
import com.itwill.bakery.vo.Product;



public class OrdersDao {
	
	private DataSource dataSource;
	public OrdersDao() throws Exception {
		BasicDataSource basicDataSource = new BasicDataSource();

		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/bakery/common/jdbc.properties"));
		/*** Apache DataSource ***/
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource = basicDataSource;
	}
	
	
	/*
	 * 주문생성
	 */
	public int create(Orders orders) throws Exception{
		
		Connection con=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		try {
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt1=con.prepareStatement(OrdersSQL.ORDERS_INSERT);
			pstmt1.setInt(1, orders.getO_price());
			pstmt1.setString(2, orders.getUser_id());
			pstmt1.setInt(3, orders.getAdd_no());
			pstmt1.executeUpdate();
			
			pstmt2=con.prepareStatement(OrdersSQL.ORDER_ITEM_INSERT);
			for(OrderItem orderItem:orders.getOrderItemList()) {
				pstmt2.setInt(1, orderItem.getOi_qty());
				pstmt2.setInt(2, orderItem.getProduct().getP_no());
				pstmt2.executeUpdate();
			}
			con.commit();
		}catch (Exception e) {
			e.printStackTrace();
			con.rollback();
			throw e;
		}finally {
			if(con!=null)con.close();
		}
		return 0;
	}
	
	
	/*
	 * 주문전체(특정사용자)
	 */
	public ArrayList<Orders> list(String sUserId) throws Exception{
		ArrayList<Orders> orderList=new ArrayList<Orders>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(OrdersSQL.SELECT_BY_ID);
			pstmt.setString(1,sUserId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				orderList.add(new Orders(rs.getInt("o_no"),
										rs.getString("o_desc"),
								       rs.getDate("o_date"),
								       rs.getInt("o_price"),
								       rs.getString("user_id"),
								       rs.getInt("add_no"),
								       null));
			}
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return orderList;
	}
	/*
	 * 주문1개보기(주문상세리스트)
	 */
	public Orders detail(String sUserId,int o_no)throws Exception{
		Orders orders = null;
		List<OrderItem> orderList = new ArrayList<OrderItem>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		con=dataSource.getConnection();
		pstmt=con.prepareStatement(OrdersSQL.SELECT_ALL);
		pstmt.setString(1,sUserId);
		pstmt.setInt(2,o_no);
		rs=pstmt.executeQuery();
		System.out.println(rs);
		
		
		if(rs.next()) {
			orders=new Orders(rs.getInt("o_no"), 
					rs.getString("o_desc"),
					rs.getDate("o_date"),
					rs.getInt("o_price"),rs.getString("user_id"),rs.getInt("add_no"),orderList);
			do{
				orders.getOrderItemList()
					.add(new OrderItem(
								rs.getInt("oi_no"), 
								rs.getInt("oi_qty"), 
								rs.getInt("o_no"), 
								new Product(rs.getInt("p_no"),
											rs.getString("p_name"),
											rs.getInt("p_price"),
											rs.getString("p_image"),
											rs.getString("p_desc"),
											rs.getInt("p_click_count"),rs.getInt("category_no"))
								)
							);
			}while(rs.next());
		}
		
		con.close();
		return orders;
	}
	
	public List<Orders> list_detail(String userId) throws Exception{
		List<Orders> orderList = new ArrayList<Orders>();
		
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt1 = con.prepareStatement(OrdersSQL.SELECT_ORDER_NO_BY_ID);
		PreparedStatement pstmt2 = con.prepareStatement(OrdersSQL.SELECT_ALL);
		
		pstmt1.setString(1, userId);
		ResultSet rs1 = pstmt1.executeQuery();
		while(rs1.next()) {
			int temp_o_no = rs1.getInt("o_no");

			pstmt2.setString(1, userId);
			pstmt2.setInt(2, temp_o_no);
			ResultSet rs2 = pstmt2.executeQuery();
			Orders order = null;
			if(rs2.next()) {
					   order = new Orders(rs2.getInt("o_no"),
										  rs2.getString("o_desc"),
										  rs2.getDate("o_date"),
										  rs2.getInt("o_price"),
										  rs2.getString("user_id"),
										  rs2.getInt("add_no"),
										  null);
				List<OrderItem> orderItemList = new ArrayList<OrderItem>();
				do{
					orderItemList.add(new OrderItem(rs2.getInt("oi_no"),
													rs2.getInt("oi_qty"),
													rs2.getInt("o_no"),
													new Product(rs2.getInt("p_no"),
															    rs2.getString("p_name"),
															    rs2.getInt("p_price"),
															    rs2.getString("p_image"),
															    rs2.getString("p_desc"),
															    rs2.getInt("p_click_count"),
															    rs2.getInt("category_no")
															)));
				}while(rs2.next());
				order.setOrderItemList(orderItemList);
			}
			orderList.add(order);
			
		}
			con.close();
			return orderList;

	}
	/*
	 * 주문전체삭제(ON DELETE CASCADE)
	 */
	public int delete(String sUserId)throws Exception{
		
		Connection con=null;
		PreparedStatement pstmt=null;
		int rowCount=0;
		try {
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(OrdersSQL.DELETE_ALL_BY_ID);
			pstmt.setString(1, sUserId);
			rowCount = pstmt.executeUpdate();
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw e;
		}finally {
			if(con!=null)con.close();
		}
		return rowCount;
	}
	/*
	 * 주문1건삭제
	 */
	
	public int deleteByOrderNo(int o_no)throws Exception{
		String deleteSql="delete from orders where o_no=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		int rowCount=0;
		try {
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(deleteSql);
			pstmt.setInt(1, o_no);
			rowCount= pstmt.executeUpdate();
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw e;
		}finally {
			if(con!=null)con.close();
		}
		return rowCount;
	}
	
	



}

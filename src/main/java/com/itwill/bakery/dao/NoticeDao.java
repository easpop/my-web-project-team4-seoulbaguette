package com.itwill.bakery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bakery.sql.NoticeSQL;
import com.itwill.bakery.sql.QnASQL;
import com.itwill.bakery.vo.Notice;
import com.itwill.bakery.vo.QnA;

public class NoticeDao {
	
	private DataSource dataSource;
	
	public NoticeDao() throws Exception {
		BasicDataSource basicDataSource=new BasicDataSource();
		
		Properties properties=new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/bakery/common/jdbc.properties"));
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource = basicDataSource;
	}

//	/*
//	 * selelctByNo : 게시물 번호로 검색
//	 */
//	public Notice selectByNoticeNo(int notice_no) throws Exception {
//		Notice notice = null;
//		Connection con = dataSource.getConnection();
//		PreparedStatement pstmt = con.prepareStatement(NoticeSQL.NOTICE_SELECT_BY_NO);
//		pstmt.setInt(1, notice_no);
//		ResultSet rs = pstmt.executeQuery();
//
//		if (rs.next()) {
//			notice = new Notice(
//					rs.getInt("notice_no"),
//					rs.getString("notice_title"),
//					rs.getDate("notice_date"),
//					rs.getString("notice_content"),
//					rs.getInt("groupno"),
//					rs.getInt("step"),
//					rs.getInt("depth"));
//		}
//		rs.close();
//		pstmt.close();
//		con.close();
//		return notice;
//	}

	/*
	 * selectAll : 게시물 전체 검색
	 */
//	public List<Notice> selectAllNotice() throws Exception {
//		List<Notice> noticeList = new ArrayList<Notice>();
//
//		Connection con = dataSource.getConnection();
//		PreparedStatement pstmt = con.prepareStatement(NoticeSQL.NOTICE_LIST);
//		ResultSet rs = pstmt.executeQuery();
//		while (rs.next()) {
//			Notice notice = new Notice(rs.getInt("notice_no"), rs.getString("notice_title"), rs.getDate("notice_date"),
//					rs.getString("notice_content"), rs.getInt("groupno"), rs.getInt("step"), rs.getInt("depth"));
//			noticeList.add(notice);
//		}
//		rs.close();
//		pstmt.close();
//		con.close();
//		return noticeList;
//	}
	
	
	//게시물 전체 검색
	public ArrayList<Notice> findList(int start, int end) throws Exception {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		ArrayList<Notice> notices=new ArrayList<Notice>();
		
		try {
			con=dataSource.getConnection();
			StringBuffer sql=new StringBuffer();
			sql.append(NoticeSQL.NOTICE_LIST);
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice(rs.getInt("notice_no"), rs.getString("notice_title"), rs.getDate("notice_date"),
						rs.getString("notice_content"), rs.getInt("groupno"), rs.getInt("step"), rs.getInt("depth"));
				notices.add(notice);
			}
			
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch (Exception ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception ex) {
				}
			}
		}
		return notices;
	}
	
	// 공지 총 개수

		public int getNoticeCount() throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int count = 0;
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(NoticeSQL.NOTICE_TOTAL_COUNT);
				rs = pstmt.executeQuery();

				if (rs.next())
					count = rs.getInt(1); 

			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (Exception ex) {
				}
				try {
					if (pstmt != null)
						pstmt.close();
				} catch (Exception ex) {
				}
				try {
					if (con != null)
						con.close();
				} catch (Exception ex) {
				}
			}

			return count;
		}
		
		// 공지 번호별 정보반환

		public Notice findByNoticeNo(int notice_no) throws Exception {

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Notice notice = null;

			try {
				con = dataSource.getConnection();
				StringBuffer sql=new StringBuffer(); //buffer에 담으면 실행속도 빨라짐,사이즈 설정은 하지 않아도됨
				sql.append(NoticeSQL.NOTICE_SELECT_BY_NOTICE_NO);
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, notice_no);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					notice = new Notice(rs.getInt("notice_no"), rs.getString("notice_title"),
							rs.getDate("notice_date"), rs.getString("notice_content"),
							rs.getInt("groupno"), rs.getInt("step"), rs.getInt("depth")
							);
				}
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (Exception ex) {
				}
				try {
					if (pstmt != null)
						pstmt.close();
				} catch (Exception ex) {
				}
				try {
					if (con != null)
						con.close();
				} catch (Exception ex) {
				}
			}

			return notice;
		}
	
		
		// 공지 추가

		public int insertNotice(Notice notice) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(NoticeSQL.NOTICE_INSERT);
				pstmt.setString(1, notice.getNotice_title());
				pstmt.setString(2, notice.getNotice_content());

				int result = pstmt.executeUpdate();
				con.close();
				return result;

		}
	
	
		// 공지 수정

		public int updateNotice(Notice notice) throws Exception {

			Connection con = null;
			PreparedStatement pstmt = null;
			int rowCount = 0;

			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(NoticeSQL.NOTICE_UPDATE);
				pstmt.setString(1, notice.getNotice_title());
				pstmt.setString(2, notice.getNotice_content());
				pstmt.setInt(3, notice.getNotice_no());
				rowCount = pstmt.executeUpdate();

			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
				} catch (Exception ex) {
				}
				try {
					if (con != null)
						con.close();
					;
				} catch (Exception ex) {
				}
			}

			return rowCount;
		}
	
	
		// 공지 삭제

		public int deleteNotice(int notice_no) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			int count = 0;

			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(NoticeSQL.NOTICE_DELETE);
				pstmt.setInt(1, notice_no);
				count = pstmt.executeUpdate();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
				} catch (Exception ex) {
				}
				try {
					if (con != null)
						con.close();
					;
				} catch (Exception ex) {
				}
			}
			return count;
		}
	
	
	
	
}
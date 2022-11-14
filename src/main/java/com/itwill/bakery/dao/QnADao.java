package com.itwill.bakery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.naming.spi.DirStateFactory.Result;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bakery.sql.QnASQL;
import com.itwill.bakery.vo.QnA;

public class QnADao {

	private DataSource dataSource;

	public QnADao() throws Exception {
		BasicDataSource basicDataSource = new BasicDataSource();

		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/bakery/common/jdbc.properties"));
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource = basicDataSource;
	}

	// 게시물insert

	public int create(QnA qna) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(QnASQL.QNA_INSERT);
			pstmt.setString(1, qna.getUser_id());
			pstmt.setString(2, qna.getQna_title());
			pstmt.setString(3, qna.getQna_content());

			int result = pstmt.executeUpdate();
			con.close();
			return result;

	}

	// 답글추가

	public int createReply(QnA qna) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		
			QnA temp = this.findByQnANo(qna.getQna_no());

			con = dataSource.getConnection();
			pstmt = con.prepareStatement(QnASQL.QNA_REPLY_UPDATE);
			pstmt.setInt(1, temp.getStep());
			pstmt.setInt(2, temp.getGroupno());
			pstmt.executeUpdate();
			pstmt.close();

			pstmt = con.prepareStatement(QnASQL.QNA_REPLY_INSERT);
			pstmt.setString(1, qna.getUser_id());
			pstmt.setString(2, qna.getQna_title());
			pstmt.setString(3, qna.getQna_content());
			pstmt.setInt(4, temp.getGroupno());
			pstmt.setInt(5, temp.getStep()+1);
			pstmt.setInt(6, temp.getDepth()+1);

			rowCount = pstmt.executeUpdate();
			con.close();
			return rowCount;
	}

	// 게시물 번호별 정보반환

	public QnA findByQnANo(int qna_no) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnA qna = null;

		try {
			con = dataSource.getConnection();
			StringBuffer sql=new StringBuffer(); //buffer에 담으면 실행속도 빨라짐,사이즈 설정은 하지 않아도됨
			sql.append(QnASQL.QNA_SELECT_BY_QNA_NO);
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, qna_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				qna = new QnA(rs.getInt("qna_no"), rs.getString("qna_title"), rs.getString("user_id"),
						rs.getString("qna_content"), rs.getDate("qna_date"), rs.getInt("qna_readcount"),
						rs.getInt("groupno"), rs.getInt("step"), rs.getInt("depth"));

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
		
		return qna;
	}

//	// 아이디별 게시물 반환
//
//	public QnA findByUserId(String user_id) throws Exception {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		QnA qna = null;
//
//		try {
//			con = dataSource.getConnection();
//			StringBuffer sql=new StringBuffer();
//			sql.append(QnASQL.QNA_SELECT_BY_USERID);
//			pstmt=con.prepareStatement(sql.toString());
//			pstmt.setString(1, user_id);
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				qna = new QnA(rs.getInt("qna_no"), rs.getString("qna_title"), rs.getString("user_id"),
//						rs.getString("qna_content"), rs.getDate("qna_date"), rs.getInt("qna_readcount"));
//			}
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//			} catch (Exception ex) {
//			}
//			try {
//				if (pstmt != null)
//					pstmt.close();
//			} catch (Exception ex) {
//			}
//			try {
//				if (con != null)
//					con.close();
//			} catch (Exception ex) {
//			}
//		}
//
//		return qna;
//	}

	// 게시물 총 건수

	public int getQnACount() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(QnASQL.QNA_TOTAL_COUNT);
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

	// 리스트출력 (게시물 시작,끝번호)
	public ArrayList<QnA> findList(int start,int end) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		ArrayList<QnA> qnas=new ArrayList<QnA>();
		
		try {
			con=dataSource.getConnection();
			StringBuffer sql=new StringBuffer();
			sql.append(QnASQL.QNA_LIST);
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				QnA qna=new QnA(rs.getInt("qna_no"), rs.getString("qna_title"), rs.getString("user_id"), 
								rs.getDate("qna_date"), rs.getInt("qna_readcount"), rs.getInt("groupno"), 
								rs.getInt("step"), rs.getInt("depth"));
				qnas.add(qna);
			}
		}finally {
			if(pstmt != null)
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
		return qnas;
	}
	
	

	// 게시글 수정

	public int update(QnA qna,String user_id) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(QnASQL.QNA_UPDATE);
			pstmt.setString(1, qna.getQna_title());
			pstmt.setString(2, qna.getQna_content());
			pstmt.setInt(3, qna.getQna_no());
			pstmt.setString(4, user_id);
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

	// 조회수 증가
	
	public int updateReadCount(int qna_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(QnASQL.QNA_UPDATE_READ_COUNT);
			pstmt.setInt(1, qna_no);
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

	// 게시글 삭제(그룹으로 묶어 답글까지 달린 글 전체삭제)

	public int delete(int groupno) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(QnASQL.QNA_DELETE);
			pstmt.setInt(1, groupno);
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
	
	//답변 게시물 존재여부 확인
	public boolean countReply(QnA qna) throws Exception {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Boolean isExist = false;
		int cnt=0;
		try {
			con=dataSource.getConnection();
			StringBuffer sql=new StringBuffer();
			sql.append(QnASQL.QNA_REPLY_EXIST);
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, qna.getGroupno());
			pstmt.setInt(2, qna.getDepth());
			pstmt.setInt(3, qna.getStep());
			
			rs=pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
			if (cnt > 1) {
				isExist = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
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
		return isExist;
	}

	//게시물삭제(qna_no기준)
	public int remove(int qna_no,String user_id) throws Exception {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(QnASQL.QNA_DELETE_BY_NO);
			pstmt.setInt(1, qna_no);
			pstmt.setString(2, user_id);
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;
	}
	
	
	
	
	
	
	
	
}

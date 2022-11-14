package com.itwill.bakery.sql;

public class NoticeSQL {
	public final static String NOTICE_LIST =
			"SELECT * FROM ( SELECT rownum idx, s.*  FROM"
					+"	( SELECT notice_no, notice_title, notice_date, notice_content, groupno, step, depth FROM Notice"
					+"		ORDER BY groupno DESC,step ASC"
					+"	) s"
					+"	 )WHERE idx >= ? AND idx <= ? ";
	
//	public final static String NOTICE_SELECT_BY_NO =
//			"select * from notice where notice_no=?";

//	public final static String NOTICE_LIST_PAGE
//			="SELECT * FROM ( SELECT rownum idx, s.*  FROM"
//					+"	( SELECT * FROM Notice"
//					+"		ORDER BY notice_no ASC"
//					+"	) s"
//					+"	 )WHERE idx >= ? AND idx <= ? ";
	
	public static final String NOTICE_TOTAL_COUNT
			="select count(*) from Notice";
	
	public static final String NOTICE_SELECT_BY_NOTICE_NO
	="select * from Notice where notice_no=?";
	
	public static final String NOTICE_INSERT
	= "insert into notice(notice_no, notice_title, notice_content, notice_date, groupno, step) values(NOTICE_NOTICE_NO_SEQ.nextval,?,?,sysdate,NOTICE_NOTICE_NO_SEQ.currval,1)";

	public static final String NOTICE_UPDATE
	="update Notice set notice_title=?,notice_content=? where notice_no=?";
	
	public static final String NOTICE_DELETE
	="delete from Notice where notice_no=?";
}
package com.itwill.bakery.vo;

import java.sql.Date;

public class QnA {
	private int qna_no;
	private String qna_title;
	private String user_id;
	private String qna_content;
	private Date qna_date;
	private int qna_readcount;
	private int groupno;
	private int step;
	private int depth;
	
	public QnA() {
		// TODO Auto-generated constructor stub
	}

	public QnA(int qna_no, String qna_title, String user_id, String qna_content, Date qna_date, int qna_readcount) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.user_id = user_id;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_readcount = qna_readcount;
	
	}
	public QnA(int qna_no, String qna_title, String user_id,  Date qna_date, int qna_readcount,
			    int groupno, int step, int depth) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.user_id = user_id;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_readcount = qna_readcount;
		this.groupno = groupno;
		this.step = step;
		this.depth = depth;
	}
	public QnA(int qna_no, String qna_title, String user_id, String qna_content, Date qna_date, int qna_readcount,
			int groupno, int step, int depth) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.user_id = user_id;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_readcount = qna_readcount;
		this.groupno = groupno;
		this.step = step;
		this.depth = depth;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public int getQna_readcount() {
		return qna_readcount;
	}

	public void setQna_readcount(int qna_readcount) {
		this.qna_readcount = qna_readcount;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	@Override
	public String toString() {
		return "QnA [qna_no=" + qna_no + ", qna_title=" + qna_title + ", user_id=" + user_id + ", qna_content="
				+ qna_content + ", qna_date=" + qna_date + ", qna_readcount=" + qna_readcount + ", groupno=" + groupno
				+ ", step=" + step + ", depth=" + depth + "]";
	}
	
}

package com.itwill.bakery.dao.test;

import com.itwill.bakery.dao.NoticeDao;
import com.itwill.bakery.vo.Notice;
import com.itwill.bakery.vo.QnA;

public class NoticeDaoTestMain {
	public static void main(String[] args) throws Exception {
		NoticeDao noticeDao = new NoticeDao();
		
		Notice test1=new Notice();
		test1.setNotice_no(1);
		test1.setNotice_title("신규공지1");
		test1.setNotice_content("신규공지 1 입니다!");
		test1.setGroupno(0);
		test1.setStep(1);
		test1.setDepth(0);
		
		

		System.out.println("1. 전체공지 보기");
		System.out.println(" "+noticeDao.findList(1, 10));
		System.out.println("2. 게시물 번호로 공지 보기");
		System.out.println(" "+noticeDao.findByNoticeNo(1));
		System.out.println("3. 질문작성");
		System.out.println(" "+noticeDao.insertNotice(test1));
		System.out.println("4. 게시글 수정");
		System.out.println(" "+noticeDao.updateNotice(test1));
		System.out.println("5. 게시글 삭제");
		System.out.println(" "+noticeDao.deleteNotice(15));
		
	}

}

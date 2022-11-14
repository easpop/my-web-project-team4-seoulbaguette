package com.itwill.bakery.dao.test;

import com.itwill.bakery.dao.QnADao;
import com.itwill.bakery.vo.QnA;

public class QnADaoTestMain {

	public static void main(String[] args) throws Exception {
		QnADao qnaDao=new QnADao();
		
		
		QnA test1=new QnA();
		test1.setQna_no(3);
		test1.setQna_title("질문");
		test1.setUser_id("yeji2345");
		test1.setQna_content("내용");
		test1.setGroupno(0);
		test1.setStep(1);
		test1.setDepth(0);
		
		QnA test2=new QnA();
		test2.setQna_no(3);
		test2.setQna_title("제목");
		test2.setUser_id("yeji2345");
		test2.setQna_content("내용");
		test2.setGroupno(0);
		test2.setStep(1);
		test2.setDepth(0);
		
		
		System.out.println("질문작성");
		System.out.println(qnaDao.create(test1));
		
		System.out.println("답글"); 
		System.out.println(qnaDao.createReply(test1));
		
		System.out.println("게시물번호별 반환");
		System.out.println(qnaDao.findByQnANo(3));
		
		System.out.println("게시물 총건수");
		System.out.println(qnaDao.getQnACount());
		
		System.out.println("리스트 출력");
		System.out.println(qnaDao.findList(1, 10));
		
		System.out.println("게시글 수정");
		System.out.println(qnaDao.update(test2,"yeji2345"));
		
		System.out.println("조회수 증가");
		System.out.println(qnaDao.updateReadCount(5));
		
		System.out.println("게시글 삭제");
		System.out.println(qnaDao.delete(13));
		
		
		
		
		
	}

}

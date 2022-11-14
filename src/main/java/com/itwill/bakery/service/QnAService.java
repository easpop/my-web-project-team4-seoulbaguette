package com.itwill.bakery.service;

import java.util.List;

import com.itwill.bakery.dao.QnADao;
import com.itwill.bakery.vo.PageMaker;
import com.itwill.bakery.vo.QnA;
import com.itwill.bakery.vo.QnAListPageMaker;
public class QnAService {
	private static QnAService _instance; //싱글턴 패턴으로 구현된 클래스는 프로그램 내에서 하나의 객체만 갖음
	
	private QnADao qnaDao;
	
	public QnAService() throws Exception{
		qnaDao=new QnADao();
	}
	public static QnAService getInstance() throws Exception{
		if(_instance==null) {
			_instance=new QnAService();
		}
		return _instance;
	}
	//게시물 생성
	public int create(QnA qna) throws Exception {
		return qnaDao.create(qna);
	}
	
	//답글쓰기
	public int createReply(QnA qna) throws Exception {
		return qnaDao.createReply(qna);
	}
	
	//게시물1개
	public QnA findQnA(int qna_no) throws Exception {
		return qnaDao.findByQnANo(qna_no);
	}
	
	//게시물수정
	public int update(QnA qna,String user_id) throws Exception {
		return qnaDao.update(qna,user_id);
	}
	
	//전체게시물리스트
	public QnAListPageMaker findQnAList(int currPage) throws Exception{
		int totalCount = qnaDao.getQnACount();
		
		PageMaker pageMaker=new PageMaker(totalCount, currPage);
		
		List<QnA> qnaList = 
				qnaDao.findList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		
		QnAListPageMaker pageMakerQnAList=new QnAListPageMaker();
		pageMakerQnAList.totCount=totalCount;
		pageMakerQnAList.itemList=qnaList;
		pageMakerQnAList.pageMaker=pageMaker;
		return pageMakerQnAList;
	}
	
	//조회수증가
	public void updateReadCount(int qna_no) throws Exception {
		qnaDao.updateReadCount(qna_no);
	}
	
	//게시물삭제(답글까지 전체삭제)
	public int delete(int groupno) throws Exception{
		return qnaDao.delete(groupno);
	}
	
	//게시물삭제(qna_no기준)
	public int remove(int qna_no,String user_id)throws Exception{
		QnA tempQnA=qnaDao.findByQnANo(qna_no);

		return qnaDao.remove(tempQnA.getQna_no(),user_id);
		
		
		
	}
	
}

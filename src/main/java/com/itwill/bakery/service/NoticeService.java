package com.itwill.bakery.service;

import java.util.List;

import com.itwill.bakery.dao.NoticeDao;
import com.itwill.bakery.vo.Notice;
import com.itwill.bakery.vo.NoticeListPageMaker;
import com.itwill.bakery.vo.PageMaker;
import com.itwill.bakery.vo.QnA;
import com.itwill.bakery.vo.QnAListPageMaker;

public class NoticeService {
	private static NoticeService _instance;

	private NoticeDao noticeDao;

	public NoticeService() throws Exception {
		noticeDao = new NoticeDao();
	}
	
	public static NoticeService getInstance() throws Exception{
		if(_instance==null) {
			_instance=new NoticeService();
		}
		return _instance;
	}

	// 게시물 번호로 공지사항 보기
	public Notice selectByNoticeNo(int notice_no) throws Exception {
		return noticeDao.findByNoticeNo(notice_no);
	}

//	// 전체 공지사항 보기
//	public List<Notice> selectAllNotice() throws Exception {
//		return noticeDao.selectAllNotice();
//	}

	// 전체리스트(페이지)
//	public NoticeListPageMaker findNoticeList(int currPage) throws Exception {
//		int totalCount = noticeDao.getNoticeCount();
//
//		PageMaker pageMaker = new PageMaker(totalCount, currPage);
//
//		List<Notice> noticeList = noticeDao.findList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
//
//		NoticeListPageMaker pageMakerNoticeList = new NoticeListPageMaker();
//		pageMakerNoticeList.totCount = totalCount;
//		pageMakerNoticeList.itemList = noticeList;
//		pageMakerNoticeList.pageMaker = pageMaker;
//		return pageMakerNoticeList;
//	}
	
	//게시물1개
		public Notice findNotice(int notice_no) throws Exception {
			return noticeDao.findByNoticeNo(notice_no);
		}

	// 공지 추가
	public int createNotice(Notice notice) throws Exception {
		return noticeDao.insertNotice(notice);
	}

	// 공지 수정
	public int updateNotice(Notice notice) throws Exception {
		return noticeDao.updateNotice(notice);
	}

	// 공지 삭제
	public int deleteNotice(int notice_no) throws Exception {
		return noticeDao.deleteNotice(notice_no);
	}
	
	//전체게시물리스트
		public NoticeListPageMaker findNoticeList(int currPage) throws Exception{
			int totalCount = noticeDao.getNoticeCount();
			PageMaker pageMaker = new PageMaker(totalCount, currPage);
			
			List<Notice> noticeList = 
					noticeDao.findList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
			
			NoticeListPageMaker pageMakerNoticeList=new NoticeListPageMaker();
			pageMakerNoticeList.totCount=totalCount;
			pageMakerNoticeList.itemList = noticeList;
			pageMakerNoticeList.pageMaker = pageMaker;
			return pageMakerNoticeList;
		}

}

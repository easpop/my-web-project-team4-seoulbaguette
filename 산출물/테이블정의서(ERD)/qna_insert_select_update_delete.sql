--새글쓰기
--insert
desc QnA;
                
insert into QnA(qna_no,user_id,qna_title,qna_content,groupno,step,depth) 
        values(QnA_qna_no_SEQ.nextval,'yeji2345','게시판타이틀','내용',QnA_qna_no_SEQ.currval,1,0);
insert into QnA(qna_no,user_id,qna_title,qna_content,groupno,step,depth) 
        values(QnA_qna_no_SEQ.nextval,'jungwook1234','게시판타이틀','내용',QnA_qna_no_SEQ.currval,1,0);
insert into QnA(qna_no,user_id,qna_title,qna_content,groupno,step,depth) 
        values(QnA_qna_no_SEQ.nextval,'guntae123','게시판타이틀','내용',QnA_qna_no_SEQ.currval,1,0);
insert into QnA(qna_no,user_id,qna_title,qna_content,groupno,step,depth) 
        values(QnA_qna_no_SEQ.nextval,'sungjun968','게시판타이틀','내용',QnA_qna_no_SEQ.currval,1,0);
insert into QnA(qna_no,user_id,qna_title,qna_content,groupno,step,depth) 
        values(QnA_qna_no_SEQ.nextval,'juhee13','게시판타이틀','내용',QnA_qna_no_SEQ.currval,1,0);
insert into QnA(qna_no,user_id,qna_title,qna_content,groupno,step,depth) 
        values(QnA_qna_no_SEQ.nextval,'woohuck45','게시판타이틀','내용',QnA_qna_no_SEQ.currval,1,0);
        
--답변쓰기   
--update
update QnA set step=step+1 where step > 1 and groupno=2;

--insert
insert into QnA(qna_no,user_id,qna_title,qna_content,groupno,step,depth) 
        values(QnA_qna_no_SEQ.nextval,'jungwook1234','게시판타이틀','내용',2,2,1);
        
--select 1개게시물
select * from QnA where user_id='jungwook1234'; 

--select 게시물 총건수 확인
select count(*) from QnA;

--select 리스트전체
select qna_no,qna_title,user_id,qna_date,qna_readcount,groupno,step,depth 
from QnA order by groupno desc,step asc; 

--리스트 페이지시작,끝번호
SELECT * FROM
		( SELECT rownum idx, s.*  FROM
				( SELECT qna_no, qna_title, user_id,qna_date,qna_readcount,groupno,step, depth FROM QnA
					ORDER BY groupno DESC,step ASC
				) s
		 )
WHERE idx >=1 AND idx <= 5 ;

--게시물존재여부
SELECT count(*) cnt FROM qna WHERE groupno = 3 AND depth >= 0 AND step >= 1 ORDER BY step,depth ASC;

--select 게시물번호로
select * from QnA where qna_no=128;

--update 게시물수정
update QnA set qna_title='변경제목',qna_content='변경내용' where qna_no=6;

--update 게시물조회수 증가
update QnA set qna_readcount=qna_readcount+1 where qna_no=2;

--delete
delete from QnA where groupno=1;

--delete (게시물번호로)
delete from QnA where qna_no=128 and user_id='guntae123';
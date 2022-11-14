desc notice;

/*
이름            널?       유형            
------------- -------- ------------- 
NOTICE_NO      NOT NULL NUMBER(10)    
NOTICE_TITLE            VARCHAR2(100) 
NOTICE_DATE             DATE          
NOTICE_CONTENT          VARCHAR2(200)  
*/


--insert


insert into notice (notice_no, notice_title, notice_date, notice_content,groupno,step,depth)
        values (NOTICE_NOTICE_NO_SEQ.nextval, '우리 가게 영업시간 공지', '2022-07-15', '07시부터 18시까지 영업합니다!',NOTICE_NOTICE_NO_SEQ.currval,1,0);
insert into notice (notice_no, notice_title, notice_date, notice_content,groupno,step,depth)
        values (NOTICE_NOTICE_NO_SEQ.nextval, '우리 가게 찾아오는 법', '2022-07-11', 'xx역 1번출구에 도보 10분 거리입니다~',NOTICE_NOTICE_NO_SEQ.currval,1,0);
insert into notice (notice_no, notice_title, notice_date, notice_content,groupno,step,depth)
        values (NOTICE_NOTICE_NO_SEQ.nextval, '대량 주문은 미리 예약 전화주세요', '2022-07-07', '연락처는 010-1234-5678 입니다.',NOTICE_NOTICE_NO_SEQ.currval,1,0);
insert into notice (notice_no, notice_title, notice_date, notice_content,groupno,step,depth)
        values (NOTICE_NOTICE_NO_SEQ.nextval, '신선한 우리가게 빵 온라인 오더 하는 법', '2022-07-03', '홈페이지에 접속해서 주문해주세요',NOTICE_NOTICE_NO_SEQ.currval,1,0);
insert into notice (notice_no, notice_title, notice_date, notice_content,groupno,step,depth)
        values (NOTICE_NOTICE_NO_SEQ.nextval, '우리가게 선정 이달의 추천 빵', '2022-07-01', '이번달에는 페스츄리를 추천합니다~',NOTICE_NOTICE_NO_SEQ.currval,1,0);
        
        desc notice;

/*
이름            널?       유형            
------------- -------- ------------- 
NOTICE_NO      NOT NULL NUMBER(10)    
NOTICE_TITLE            VARCHAR2(100) 
NOTICE_DATE             DATE          
NOTICE_CONTENT          VARCHAR2(200)  
*/


--insert

insert into notice (notice_no, notice_title, notice_date, notice_content, groupno,step,depth)
        values (NOTICE_NOTICE_NO_SEQ.nextval, '우리가게 선정 이달의 추천 빵', sysdate, '이번달에는 토스트를 추천합니다~',2,2,1);

        
--update
update notice set notice_content = '이번달에는 소시지빵을 추천합니다~' where notice_no = 1 and notice_title = '우리가게 선정 이달의 추천 빵';

--delete
delete from notice where notice_no = 2;

--select
--전체 출력
select * from notice;

--게시물 번호로 출력
select * from notice where notice_no = 4;

--게시물 제목으로 출력
select * from notice where notice_title like '%영업시간%';

-- 리스트 페이지 시작,끝부분
SELECT * FROM ( SELECT rownum idx, s.*  FROM ( SELECT * FROM Notice ORDER BY notice_no ASC ) s)WHERE idx >= 1 AND idx <= 4;

--select 게시물 총건수 확인
select count(*) from Notice;
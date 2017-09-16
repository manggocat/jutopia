drop table board;
select * from board;
-- 1. 테이블 생성
create table Board (
	num number(7) not null,		          -- 내부적으로 처리될 글번호 
	writer varchar2(20) not null,		  --작성자
	email varchar2(30) ,			      -- 메일
	subject varchar2(50) not null,	      -- 제목
	passwd varchar2(12) not null,   	  -- 비밀번호
	reg_date  date not null, 		      -- 글쓴 날짜   
	readcount   number(3) default 0,	  -- 조회수
	ref  number  not null, 		          -- 그룹( 글에 대한...)
	re_step number not null,		      -- 그룹 스텝
	re_level  number not null,		      -- 그룹 레벨
	content  nvarchar2(2000) not null,	  -- 글내용
	ip varchar2(20)  not null,   		  --글 쓴 곳의 아이피
	constraint  board_num_pk  primary key(num)
	
) SEGMENT creation IMMEDIATE ;

-- 2. sequence 생성
create sequence board_num;		-- 자동 증가 번호
drop sequence board_num;

----------------------------------------------------------------
DROP SEQUENCE booking_N_BOOK_NUM;
drop table BOOKING;

create table Booking(
	N_BOOK_NUM number(7) not null,
	SZ_BOOK_ID_EMAIL varchar2(50) NOT NULL,
	SZ_BOOK_NAME varchar2(30) not null,
	SZ_BOOK_CAR_NUM varchar2(20) not null,
	SZ_BOOK_CAR_KINDS varchar2(50) not null,
	SZ_BOOK_TEL varchar2(30) not null,
	DATE_BOOK_DAY varchar2(30),
	DATE_BOOK_START_TIME varchar2(30),
	DATE_BOOK_END_TIME varchar2(30),
	constraint  book_num_pk  primary key(N_BOOK_NUM)
);
create table Booking(
	N_BOOK_NUM number(7) not null,
	SZ_BOOK_ID_EMAIL varchar2(50) NOT NULL,
	SZ_BOOK_NAME varchar2(30) not null,
	SZ_BOOK_CAR_NUM varchar2(20) not null,
	SZ_BOOK_POSITION varchar2(20) not null,
	SZ_BOOK_CAR_KINDS varchar2(50) not null,
	SZ_BOOK_REDUCTION varchar2(50),
	DATE_BOOK_START_TIME Date,
	DATE_BOOK_END_TIME Date,
	SZ_BOOK_TEL varchar2(30) not null,
	constraint  book_num_pk  primary key(N_BOOK_NUM)
	);

create sequence booking_N_BOOK_NUM;

select * from booking;

select max(num) from board;


insert into board(num, writer, subject, email, content, passwd, reg_date, ref, re_step, re_level, ip) 
		values(2, 'b', 'b', 'b', 'b', 'b', '2016-03-21', 2, 2, 2, 2);
		
		
select count(*) from board;


select rownum, num, writer, ref from (select num, writer, ref from BOARD order by ref desc) where writer='a';


select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, r  
	from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, rownum r 
		from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount 
			from board order by ref desc, re_step asc) order by ref desc, re_step asc, re_level asc, reg_date asc) where r>=1 and r<=50;

select * from board;
delete from board;

UPDATE BOARD SET RE_STEP = RE_STEP + 1, RE_LEVEL = RE_LEVEL + 1 WHERE ref=1;

SELECT MAX(RE_STEP) FROM BOARD where ref = 83 and re_level = 1
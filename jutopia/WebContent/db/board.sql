drop table board;
select * from board;
-- 1. 占쏙옙占싱븝옙 占쏙옙占쏙옙
create table Board (
	num number(7) not null,		          -- 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 처占쏙옙占쏙옙 占쌜뱄옙호 
	writer varchar2(20) not null,		  --占쌜쇽옙占쏙옙
	email varchar2(30) ,			      -- 占쏙옙占쏙옙
	subject varchar2(50) not null,	      -- 占쏙옙占쏙옙
	passwd varchar2(12) not null,   	  -- 占쏙옙橘占싫�
	reg_date  date not null, 		      -- 占쌜억옙 占쏙옙짜   
	readcount   number(3) default 0,	  -- 占쏙옙회占쏙옙
	ref  number  not null, 		          -- 占쌓뤄옙( 占쌜울옙 占쏙옙占쏙옙...)
	re_step number not null,		      -- 占쌓뤄옙 占쏙옙占쏙옙
	re_level  number not null,		      -- 占쌓뤄옙 占쏙옙占쏙옙
	content  nvarchar2(2000) not null,	  -- 占쌜놂옙占쏙옙
	ip varchar2(20)  not null,   		  --占쏙옙 占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	
	constraint  board_num_pk  primary key(num)
	
) SEGMENT creation IMMEDIATE ;

select * from seasonticket;
-- 2. sequence 占쏙옙占쏙옙
create sequence board_num;		-- 占쌘듸옙 占쏙옙占쏙옙 占쏙옙호
drop sequence board_num;

delete from SEASONTICKET where sz_season_ticket_parking_lot='광교주차장';
----------------------------------------------------------------
select* from board;
create table SEASONTICKET(
   N_TICKET_NUM number(7),
   SZ_SEASON_TICKET_PARKING_LOT varchar2(30),
   SZ_SEASON_TICKET_ID_EMAIL varchar2(30),
   SZ_SEASON_TICKET_NAME varchar2(30),
   SZ_SEASON_TICKET_CAR_NUM varchar2(30),
   SZ_SEASON_TICKET_POSITION varchar2(30),
   SZ_SEASON_TICKET_CAR_KINDS varchar2(30),
   SZ_SEASON_TICKET_REDUCTION varchar2(30),
   N_SEASON_TICKET_START_DATE number(7),
   SZ_SEASON_TICKET_END_DATE varchar2(30),
   SZ_SEASON_TICKET_TEL varchar2(30),
   N_SEASON_TICKET_DISCRIMINATE number(7),
   constraint seasonticket_num_pk primary key(N_TICKET_NUM)
);

create sequence SEASONTICKET_N_TICKET_NUM;

create table BOOKING(
	N_BOOK_NUM number(7) not null,
	SZ_PARKING_LOCATION varchar2(40) NOT NULL,
	SZ_BOOK_ID_EMAIL varchar2(50) NOT NULL,
	SZ_BOOK_NAME varchar2(30) not null,
	SZ_BOOK_CAR_NUM varchar2(20) not null,
	SZ_BOOK_CAR_KINDS varchar2(50) not null,
	SZ_BOOK_TEL varchar2(30) not null,
	DATE_BOOK_DAY varchar2(10),
	N_BOOK_START number(7),
	N_BOOK_END number(7),
	SZ_PARKING_PLACE varchar2(30),
	N_RESERVE_DISCRIMINATE number(7),
	constraint  booking_num_pk  primary key(N_BOOK_NUM)
);

create table Parking(
	N_PARKING_NUM number(7),
	SZ_PARKING_LOT varchar2(30),
	N_PARKING_DISCRIMINATE number(7),
	SZ_PARKING_BOOK_DAY varchar2(30),
	N_PARKING_BOOK_START number(7),
	N_PARKING_BOOK_END number(7),
	SZ_PARKING_POSITION varchar2(30),
	N_PARKING_SEASON_START_DATE number(7),
	constraint parking_num_pk primary key(N_PARKING_NUM)
);

SELECT SZ_PARKING_LOCATION, DATE_BOOK_DAY, N_BOOK_START, N_BOOK_END FROM BOOKING WHERE SZ_BOOK_ID_EMAIL = 'wangi0304@naver.com'; 
select * from booking;
select * from parking;
select * from SEASONTICKET;


delete from parking where sz_parking_lot='잠실주차장';
delete from booking where sz_parking_location='잠실주차장';

delete from booking where sz_book_id_email='15150304@hanmail.net';

SELECT n_book_num, SZ_PARKING_LOCATION, DATE_BOOK_DAY, N_BOOK_START, N_BOOK_END FROM BOOKING WHERE SZ_BOOK_ID_EMAIL = 'wangi0304@naver.com' order by n_book_num desc;

create sequence booking_N_BOOK_NUM;
create sequence parking_N_PARKING_NUM;

DROP SEQUENCE booking_N_BOOK_NUM;
drop table BOOKING;
DROP SEQUENCE parking_N_PARKING_NUM;
DROP TABLE PARKING;

--------------------------------------------------------------

INSERT INTO Booking(N_BOOK_NUM, 
					SZ_PARKING_LOCATION,
					SZ_BOOK_ID_EMAIL, 
					SZ_BOOK_NAME, 
					SZ_BOOK_CAR_NUM, 
					SZ_BOOK_CAR_KINDS, 
					SZ_BOOK_TEL, 
					DATE_BOOK_DAY, 
					SZ_BOOK_START, 
					SZ_BOOK_END, 
					SZ_PARKING_PLACE, 
					N_RESERVE_DISCRIMINATE)
VALUES(31, '占쏙옙占쏙옙占쏙옙占쏙옙占�', '효占쏙옙占쏙옙占쏙옙','woroe', 'woroe', 'woreo', '010010010', '2017-09-19', '05:00','06:00', '5-2', 1);
create table Booing(
	N_BOOK_NUM number(7) not null,
	SZ_PARKING_LOCATION varchar2(40) NOT NULL,
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



SELECT SZ_PARKING_PLACE, N_RESERVE_DISCRIMINATE FROM BOOKING WHERE DATE_BOOK_DAY= '2017-09-19' AND SZ_BOOK_START='05:00' AND SZ_PARKING_LOCATION ='占싼곤옙占쏙옙占쏙옙占쏙옙';

select * from SEASONTICKET;

select max(num) from board;

select SZ_PARKING_PLACE from BOOKING;

select SZ_PARKING_PLACE from BOOKING where DATE_BOOK_DAY = '2017-09-15' AND DATE_BOOK_START_TIME = '14:00' AND DATE_BOOK_END_TIME = '16:00';

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
delete booking where n_book_num = 43;
delete booking where n_book_num = 44;
delete parking where n_parking_num = 83;
delete parking where n_parking_num = 84;

select * from PARKING;
select * from booking;
SELECT SZ_PARKING_PLACE, N_RESERVE_DISCRIMINATE,N_BOOK_START FROM (select * from BOOKING WHERE SZ_PARKING_LOCATION = '占쏙옙占쏙옙占쏙옙占쏙옙占�' AND DATE_BOOK_DAY='2017-09-24');
SELECT SZ_PARKING_PLACE, N_RESERVE_DISCRIMINATE,N_BOOK_START FROM (select * from BOOKING WHERE SZ_PARKING_LOCATION = '占쏙옙占쏙옙占쏙옙占쏙옙占�' AND DATE_BOOK_DAY='2017-09-24')where N_BOOK_START BETWEEN 600 AND 700;
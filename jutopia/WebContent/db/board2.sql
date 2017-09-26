 drop table board;

-- 1. 占쏙옙占싱븝옙 占쏙옙占쏙옙
create table Board (
	num number(7) not null,		-- 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 처占쏙옙占쏙옙 占쌜뱄옙호 
	writer varchar2(20) not null,		--占쌜쇽옙占쏙옙
	email varchar2(30) ,			-- 占쏙옙占쏙옙
	subject varchar2(50) not null,		 -- 占쏙옙占쏙옙
	passwd varchar2(12) not null,   	 -- 占쏙옙橘占싫�
	reg_date  date not null, 		 -- 占쌜억옙 占쏙옙짜   
	readcount   number(3) default 0,	  -- 占쏙옙회占쏙옙
	ref  number  not null, 		-- 占쌓뤄옙( 占쌜울옙 占쏙옙占쏙옙...)
	re_step number not null,		-- 占쌓뤄옙 占쏙옙占쏙옙
	re_level  number not null,		-- 占쌓뤄옙 占쏙옙占쏙옙
	content  nvarchar2(2000) not null,	-- 占쌜놂옙占쏙옙
	ip varchar2(20)  not null,   		--占쏙옙 占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	constraint  board_num_pk  primary key(num)
	
) SEGMENT creation IMMEDIATE ;

-- 2. sequence 占쏙옙占쏙옙
create sequence board_num;		-- 占쌘듸옙 占쏙옙占쏙옙 占쏙옙호


select *from BOARD;
select *from MEMBER;
select max(num) from board;

SELECT * FROM BOARD WHERE NUM =15;
SELECT PASSWD FROM BOARD WHERE NUM = 15

insert into board(num, writer, subject, email, content, passwd, reg_date, ref, re_step, re_level, ip) 
		values(board_num.nextval, 'b', 'b', 'b', 'b', 'b', '2016-03-21', 1, 1, 1, 1);

		
		
	
		
	
select count(*) from board;


select rownum, num, writer, ref from 
(select num, writer, ref from BOARD order by ref desc) where writer='占쏙옙'; 占쏙옙占쏙옙占쏙옙 占쏙옙占싱븝옙占쏙옙 占쏙옙占쏙옙占쏙옙占�


select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, r  
	from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, rownum r 
		from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount 
			from board order by ref desc, re_step asc) order by ref desc, re_step asc, re_level asc, reg_date asc) where r>=1 and r<=50;

select * from board;
delete from board;

UPDATE BOARD SET RE_STEP = RE_STEP + 1, RE_LEVEL = RE_LEVEL + 1 WHERE ref=1;

SELECT MAX(RE_STEP) FROM BOARD where ref = 83 and re_level = 1










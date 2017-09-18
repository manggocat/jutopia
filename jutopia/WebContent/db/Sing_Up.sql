create table SIGN_UP (
	sz_SIGN_UP_ID_EMAIL varchar2(50),  -- : 아이디대체
	sz_SIGN_UP_NAME varchar2(50),      -- : 이름
	sz_SIGN_UP_PWD varchar2(50),       -- : 비번
	sz_SIGN_UP_TEL varchar2(50),       -- : 번호
	sz_SIGN_UP_REDUCTION varchar2(50),	-- : 감면 정책
	primary key(SIGN_UP_ID_EMAIL)
	);
	select * from SIGN_UP;

	create table SIGN_UP (
	szSIGN_UP_ID_EMAIL varchar2(50),  -- : 아이디대체
	szSIGN_UP_NAME varchar2(50),      -- : 이름
	szSIGN_UP_PWD varchar2(50),       -- : 비번
	szSIGN_UP_TEL varchar2(50),       -- : 번호
	szSIGN_UP_REDUCTION varchar2(50),	-- : 감면 정책
	szMANAGER char(1) ,            -- : 매니저 여부
	primary key(szSIGN_UP_ID_EMAIL)
	);

ALTER TABLE SIGN_UP add SIGN_UP_REDUCTION varchar2(50);
DELETE FROM SIGN_UP where szSIGN_UP_ID_EMAIL = 'wangi0304@naver.com';

select * from SIGN_UP;
drop table SIGN_UP;

INSERT INTO SIGN_UP(SIGN_UP_ID_EMAIL, SIGN_UP_NAME, SIGN_UP_PWD, SIGN_UP_TEL) VALUES('aa', 'bb', 'cc', 'dd') ;

commit

create table SEASON_TICKET (
	SEASON_TICKET_ID_EMAIL varchar2(50),  -- : 아이디 대체
	SEASON_TICKET_NAME varchar2(30),      -- : 정기권 구매자 이름
	SEASON_TICKET_CAR_NUM varchar2(20),       -- : 차 번호
	SEASON_TICKET_POSITION varchar2(20),       -- : 정기권 위치
	SEASON_TICKET_CAR_KINDS varchar2(50),  -- : 차종
	SEASON_TICKET_PARKING_LOT varchar2(20),      -- : 선택한 주차장
	SEASON_TICKET_REDUCTION varchar2(50),       -- : 감면 정책
	SEASON_TICKET_DAY_SALE varchar2(20),       -- : 요일제 할인
	SEASON_TICKET_START_DATE DATE,      -- : 정기권 시작일
	SEASON_TICKET_END_DATE DATE,       -- : 정기권 마감일
	SEASON_TICKET_TEL varchar2(30),       -- : 전화번호
	primary key(SEASON_TICKET_CAR_NUM)
	);

select * from SEASON_TICKET;

drop table SEASON_TICKET;
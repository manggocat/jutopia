create table SIGN_UP (
	sz_SIGN_UP_ID_EMAIL varchar2(50),  -- : ���̵��ü
	sz_SIGN_UP_NAME varchar2(50),      -- : �̸�
	sz_SIGN_UP_PWD varchar2(50),       -- : ���
	sz_SIGN_UP_TEL varchar2(50),       -- : ��ȣ
	sz_SIGN_UP_REDUCTION varchar2(50),	-- : ���� ��å
	primary key(SIGN_UP_ID_EMAIL)
	);
	select * from SIGN_UP;

	create table SIGN_UP (
	szSIGN_UP_ID_EMAIL varchar2(50),  -- : ���̵��ü
	szSIGN_UP_NAME varchar2(50),      -- : �̸�
	szSIGN_UP_PWD varchar2(50),       -- : ���
	szSIGN_UP_TEL varchar2(50),       -- : ��ȣ
	szSIGN_UP_REDUCTION varchar2(50),	-- : ���� ��å
	szMANAGER char(1) ,            -- : �Ŵ��� ����
	primary key(szSIGN_UP_ID_EMAIL)
	);

ALTER TABLE SIGN_UP add SIGN_UP_REDUCTION varchar2(50);
DELETE FROM SIGN_UP where szSIGN_UP_ID_EMAIL = 'wangi0304@naver.com';

select * from SIGN_UP;
drop table SIGN_UP;

INSERT INTO SIGN_UP(SIGN_UP_ID_EMAIL, SIGN_UP_NAME, SIGN_UP_PWD, SIGN_UP_TEL) VALUES('aa', 'bb', 'cc', 'dd') ;

commit

create table SEASON_TICKET (
	SEASON_TICKET_ID_EMAIL varchar2(50),  -- : ���̵� ��ü
	SEASON_TICKET_NAME varchar2(30),      -- : ����� ������ �̸�
	SEASON_TICKET_CAR_NUM varchar2(20),       -- : �� ��ȣ
	SEASON_TICKET_POSITION varchar2(20),       -- : ����� ��ġ
	SEASON_TICKET_CAR_KINDS varchar2(50),  -- : ����
	SEASON_TICKET_PARKING_LOT varchar2(20),      -- : ������ ������
	SEASON_TICKET_REDUCTION varchar2(50),       -- : ���� ��å
	SEASON_TICKET_DAY_SALE varchar2(20),       -- : ������ ����
	SEASON_TICKET_START_DATE DATE,      -- : ����� ������
	SEASON_TICKET_END_DATE DATE,       -- : ����� ������
	SEASON_TICKET_TEL varchar2(30),       -- : ��ȭ��ȣ
	primary key(SEASON_TICKET_CAR_NUM)
	);

select * from SEASON_TICKET;

drop table SEASON_TICKET;
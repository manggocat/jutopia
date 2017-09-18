DROP SEQUENCE booking_N_BOOK_NUM;
drop table BOOKING;
DROP SEQUENCE parking_N_PARKING_NUM;
DROP TABLE PARKING;

create table BOOKING(
	N_BOOK_NUM number(7) not null,
	SZ_PARKING_LOCATION varchar2(40) NOT NULL,
	SZ_BOOK_ID_EMAIL varchar2(50) NOT NULL,
	SZ_BOOK_NAME varchar2(30) not null,
	SZ_BOOK_CAR_NUM varchar2(20) not null,
	SZ_BOOK_CAR_KINDS varchar2(50) not null,
	SZ_BOOK_TEL varchar2(30) not null,
	DATE_BOOK_DAY varchar2(10),
	SZ_BOOK_START varchar2(10),
	SZ_BOOK_END varchar2(10),
	SZ_PARKING_PLACE varchar2(30),
	N_RESERVE_DISCRIMINATE number(7),
	constraint  booking_num_pk  primary key(N_BOOK_NUM)
);

create table Parking(
	N_PARKING_NUM number(7),
	DATE_PARKING_DAY varchar2(10),
	DATE_PARKING_START_TIME varchar2(50),
	DATE_PARKING_END_TIME varchar2(50),
	SZ_PARKING_PLACE varchar2(30),
	constraint parking_num_pk primary key(N_PARKING_NUM)
);

create sequence booking_N_BOOK_NUM;
create sequence parking_N_PARKING_NUM;

select * from booking;
select * from parking;
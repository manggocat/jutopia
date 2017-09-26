select * from SIGN_UP;

update SIGN_UP set sz_user_name  where sz_user_name 

desc SIGN_UP;
 
drop table board;

insert into sign_up(szSIGN_UP_id_email , szSIGN_UP_name , szSIGN_UP_pwd , szSIGN_UP_TEL,szMANAGER) values( 'jutopia@gmail.com' , 'jutopia' , 'jutopia' , '010-5055-0240' , null ); 

select sz_user_id_email, sz_user_pwd from Sign_up;

select sz_user_id_email, sz_user_pwd from Sign_up ;

delete from sign_up where szsign_up_name = 'jutopthia';

select sz_user_id_email, sz_user_pwd from Sign_up where sz_user_id_email = 'wangi0304@naver.com';
commit

drop table SIGN_UP;
select * from board;
0104796
 
create table SearchWord(
szSIGN_UP_ID_EMAIL varchar2(50) not null,
szSearch varchar2(30)not null,
szAddress varchar2(50)not null,
datesearchtime date not null
)

drop table SearchWord;
select * from searchword;

delete from searchword where szsearch = '판교공영주차장';


delete from Sign_up where sz_user_name = 'qqqqqqqqqq';
delete from Sign_up where sz_user_id_Email = '15150304@hanmail.net';
delete from Sign_up where szuser_id_Email = 'wangi0304@naver.com';

select szSearch,szAddress from searchword where szsign_up_id_email= 'vovug@hanmail.net' order by datesearchtime desc;





create table board(
N_NUM number(7) not null,
str_id_email varchar(30) not null,
str_subject varchar(50) not null,
date_reg_date date not null,
n_readcount number(3),
n_ref number not null,
n_re_step number not null,
n_re_level number not null,
str_content nvarchar(2000) not null,
str_boardfile varchar(20),

constraint  board_num_pk  primary key(N_NUM)
) SEGMENT creation IMMEDIATE ;

create sequence board_n_num;

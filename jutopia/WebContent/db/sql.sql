select * from SIGN_UP;

update SIGN_UP set sz_user_name  where sz_user_name 

desc SIGN_UP;

insert into sign_up(sz_user_id_email , sz_user_name , sz_user_pwd , sz_user_tel,sz_manamer) values( 'wangi0304@naver.com' , 'hong' , 'q' , '010-5055-0240' , null ) 

select sz_user_id_email, sz_user_pwd from Sign_up;

select sz_user_id_email, sz_user_pwd from Sign_up ;

select sz_user_id_email, sz_user_pwd from Sign_up where sz_user_id_email = 'wangi0304@naver.com';
commit

drop table SIGN_UP;
 
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
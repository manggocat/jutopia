create table note (
note_num number constraint note_num_pk primary key,  --�궡遺��쟻�쑝濡� 泥섎━�맆 湲�踰덊샇
note_recipient varchar2(50) not null,  -- 諛쏅뒗 �궗�엺
note_sender varchar2(50) not null,  --蹂대궡�뒗 �궗�엺
note_contents varchar2(2000),  -- �궡�슜
note_reply varchar2(2000), --�떟蹂�
note_send_time date not null,  --蹂대궡�뒗 �떆媛�
note_reply_time date --�떟蹂� �떆媛�
);

drop table note;


 select count(*) cnt 
            from   note 
            where  note_sender = 'wangi0304@naver.com ';

        2 jutopia@gmail.com wangi0304@naver.com  asd           sdfdfsf    2017-09-24 16:59:47.0 2017-09-24 17:00:02.0

select * from note;

select * from note order by note_reply_time, note_send_time desc;

create sequence note_num;		-- �옄�룞 利앷� 踰덊샇//�깮�꽦�븯湲� �쟾�뿉 �쟾�뿉 留뚮뱾�뼱 �몦寃� �엳�쑝硫� 吏��썙二쇨퀬 �떎�떆 �깮�꽦�빐�빞 �븳�떎(洹몃옒�빞 �떎�떆 num�씠 1踰� 遺��꽣 �떆�옉�븿)

drop sequence note_num; 

insert into note values (board_num.nextval, '愿�
由ъ옄', 'vovug@hanmail.net', 'hi', '2017-09-15');

delete from note where note_num = 20;


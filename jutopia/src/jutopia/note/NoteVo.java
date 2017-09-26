package jutopia.note;

public class NoteVo {

    private int note_num; // ?¼? ¨ë²ˆí˜¸
    private String note_sender; // ë³´ë‚¸?‚¬?Œ
    private String note_recipient; // ë°›ëŠ”?‚¬?Œ
    private String note_contents; // ë³´ë‚¸?‚´?š©
    private String note_reply; // ?‹µë³?
    private String note_send_time; // ë³´ë‚¸?¼?‹œ
    private String note_reply_time; // ?‹µ?¥?¼?‹œ

    private int page_num = 1; // ?˜?´ì§? ë²ˆí˜¸
    private int page_limit = 10;

    public int getPage_num() {
        return page_num;
    }

    public void setPage_num(int page_num) {
        this.page_num = page_num;
    }

    public int getPage_limit() {
        return page_limit;
    }

    public void setPage_limit(int page_limit) {
        this.page_limit = page_limit;
    }

    public int getNote_num() {
        return note_num;
    }

    public void setNote_num(int note_num) {
        this.note_num = note_num;
    }

    public String getNote_sender() {
        return note_sender;
    }

    public void setNote_sender(String note_sender) {
        this.note_sender = note_sender;
    }

    public String getNote_recipient() {
        return note_recipient;
    }

    public void setNote_recipient(String note_recipient) {
        this.note_recipient = note_recipient;
    }

    public String getNote_contents() {
        return note_contents;
    }

    public void setNote_contents(String note_contents) {
        this.note_contents = note_contents;
    }

    public String getNote_reply() {
        return note_reply;
    }

    public void setNote_reply(String note_reply) {
        this.note_reply = note_reply;
    }

    public String getNote_send_time() {
        return note_send_time;
    }

    public void setNote_send_time(String note_send_time) {
        this.note_send_time = note_send_time;
    }

    public String getNote_reply_time() {
        return note_reply_time;
    }

    public void setNote_reply_time(String note_reply_time) {
        this.note_reply_time = note_reply_time;
    }
}

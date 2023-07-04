package com.multi.muluckup.member;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberInquiryVO {
    private int myinquiry_no; //칼럼 no
    private int inquiry_writer; //문의 작성자 no
    private int inquiry_no; //문의 no
    private String inquiry_title; //문의 제목
    private Date inquiry_udate; //수정 날짜
    private String answer_check; //답변 유무(inquiry_manager가 null인지 체크해서)
    private Date inquiry_adate; //답변날짜


    public int getMyinquiry_no() {
        return myinquiry_no;
    }

    public void setMyinquiry_no(int myinquiry_no) {
        this.myinquiry_no = myinquiry_no;
    }

    public int getInquiry_writer() {
        return inquiry_writer;
    }

    public void setInquiry_writer(int inquiry_writer) {
        this.inquiry_writer = inquiry_writer;
    }

    public int getInquiry_no() {
        return inquiry_no;
    }

    public void setInquiry_no(int inquiry_no) {
        this.inquiry_no = inquiry_no;
    }

    public String getInquiry_title() {
        return inquiry_title;
    }

    public void setInquiry_title(String inquiry_title) {
        this.inquiry_title = inquiry_title;
    }

    public Date getInquiry_udate() {
        return inquiry_udate;
    }

    public void setInquiry_udate(Date inquiry_udate) {
        this.inquiry_udate = inquiry_udate;
    }

    public String getAnswer_check() {
        return answer_check;
    }

    public void setAnswer_check(String answer_check) {
        this.answer_check = answer_check;
    }

    public Date getInquiry_adate() {
        return inquiry_adate;
    }

    public void setInquiry_adate(Date inquiry_adate) {
        this.inquiry_adate = inquiry_adate;
    }

    public String getFormattedInquiryUdate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(inquiry_udate);
    }

    public String getFormattedInquiryAdate() {
        if (inquiry_adate == null) {
            return ""; // inquiry_adate가 null인 경우 빈 문자열 반환
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // HH:mm:ss
            return sdf.format(inquiry_adate);
        }
    }

    @Override
    public String toString() {
        return "MemberInquiryVO [myinquiry_no=" + myinquiry_no + ", inquiry_writer=" + inquiry_writer + ", inquiry_no="
                + inquiry_no + ", inquiry_title=" + inquiry_title + ", inquiry_udate=" + inquiry_udate
                + ", answer_check=" + answer_check + ", inquiry_adate=" + inquiry_adate + "]";
    }
}

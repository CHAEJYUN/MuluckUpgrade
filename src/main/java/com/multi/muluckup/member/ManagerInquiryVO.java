package com.multi.muluckup.member;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ManagerInquiryVO {
	private int no; // 칼럼 no
	private int inquiry_no; // 문의 no
	private String inquiry_title; // 문의 제목
    private int inquiry_writer; //문의 작성자 no
    private String writer_nickname; ////문의 작성자 닉네임
	private Date inquiry_udate; // 문의 수정 날짜
	private int inquiry_manager; // 답변 관리자 no
	private String answer_nickname; // 답변 관리자 닉네임
	private Date inquiry_adate; // 문의 답변 날짜
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getInquiry_writer() {
		return inquiry_writer;
	}
	public void setInquiry_writer(int inquiry_writer) {
		this.inquiry_writer = inquiry_writer;
	}
	public String getWriter_nickname() {
		return writer_nickname;
	}
	public void setWriter_nickname(String writer_nickname) {
		this.writer_nickname = writer_nickname;
	}
	public Date getInquiry_udate() {
		return inquiry_udate;
	}
	public void setInquiry_udate(Date inquiry_udate) {
		this.inquiry_udate = inquiry_udate;
	}
	public int getInquiry_manager() {
		return inquiry_manager;
	}
	public void setInquiry_manager(int inquiry_manager) {
		this.inquiry_manager = inquiry_manager;
	}
	public String getAnswer_nickname() {
		return answer_nickname;
	}
	public void setAnswer_nickname(String answer_nickname) {
		this.answer_nickname = answer_nickname;
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
		return "ManagerInquiryVO [no=" + no + ", inquiry_no=" + inquiry_no + ", inquiry_title=" + inquiry_title
				+ ", inquiry_writer=" + inquiry_writer + ", writer_nickname=" + writer_nickname + ", inquiry_udate="
				+ inquiry_udate + ", inquiry_manager=" + inquiry_manager + ", answer_nickname=" + answer_nickname
				+ ", inquiry_adate=" + inquiry_adate + "]";
	}
	
}

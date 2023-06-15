package com.multi.muluckup.member;

import java.util.Date;

public class InquiryVO {
	private int inquiry_no;
	private int inquiry_writer;
	private String inquiry_title;
	private String inquiry_content;
	private Date inquiry_cdate;
	private Date inquiry_udate;
	private int inquiry_manager;
	private String inquiry_answer;
	private Date inquiry_adate;
	
	public int getInquiry_no() {
		return inquiry_no;
	}
	public void setInquiry_no(int inquiry_no) {
		this.inquiry_no = inquiry_no;
	}
	public int getInquiry_writer() {
		return inquiry_writer;
	}
	public void setInquiry_writer(int inquiry_writer) {
		this.inquiry_writer = inquiry_writer;
	}
	public String getInquiry_title() {
		return inquiry_title;
	}
	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}
	public String getInquiry_content() {
		return inquiry_content;
	}
	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}
	public Date getInquiry_cdate() {
		return inquiry_cdate;
	}
	public void setInquiry_cdate(Date inquiry_cdate) {
		this.inquiry_cdate = inquiry_cdate;
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
	public String getInquiry_answer() {
		return inquiry_answer;
	}
	public void setInquiry_answer(String inquiry_answer) {
		this.inquiry_answer = inquiry_answer;
	}
	public Date getInquiry_adate() {
		return inquiry_adate;
	}
	public void setInquiry_adate(Date inquiry_adate) {
		this.inquiry_adate = inquiry_adate;
	}
	
	@Override
	public String toString() {
		return "InquiryVO [inquiry_no=" + inquiry_no + ", inquiry_writer=" + inquiry_writer + ", inquiry_title="
				+ inquiry_title + ", inquiry_content=" + inquiry_content + ", inquiry_cdate=" + inquiry_cdate
				+ ", inquiry_udate=" + inquiry_udate + ", inquiry_manager=" + inquiry_manager + ", inquiry_answer="
				+ inquiry_answer + ", inquiry_adate=" + inquiry_adate + "]";
	}
	
}

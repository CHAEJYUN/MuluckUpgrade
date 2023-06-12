package com.multi.muluckup.business;

import java.sql.Timestamp;

public class CommentVO {
	private int comment_no;
	private int business_no;
	private String writer;
	private String write;
	private Timestamp comment_date;
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	
	public int getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(int business_no) {
		this.business_no = business_no;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
	}
	
	public Timestamp getComment_date() {
		return comment_date;
	}
	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}
	
	@Override
	public String toString() {
		return "CommentVO [comment_no=" + comment_no + ", business_no=" + business_no + ", writer=" + writer
				+ ", write=" + write + ", comment_date=" + comment_date + "]";
	}
}

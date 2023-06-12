package com.multi.muluckup.community;

public class ReplyVO {
	
	private int reply_no;
	private String reply_content;
	private int bbs_no;
	private int member_no;
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public int getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", reply_content=" + reply_content + ", bbs_no=" + bbs_no
				+ ", member_no=" + member_no + "]";
	}
	
}

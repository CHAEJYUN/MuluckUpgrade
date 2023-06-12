package com.multi.muluckup.member;

public class MemberReplyVO {
	private int my_no;
	private int reply_no;
	private int member_no;
	private int bbs_no;
	private String bbs_title;
	private String reply_content;
	
	public int getMy_no() {
		return my_no;
	}
	public void setMy_no(int my_no) {
		this.my_no = my_no;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	
	@Override
	public String toString() {
		return "MemberReplyVO [my_no=" + my_no + ", reply_no=" + reply_no + ", member_no=" + member_no + ", bbs_no="
				+ bbs_no + ", bbs_title=" + bbs_title + ", reply_content=" + reply_content + "]";
	}
	
}

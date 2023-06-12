package com.multi.muluckup.member;

public class MemberPostVO {
	private int post_no;
	private int member_no;
	private int bbs_no;
	private String bbs_title;
	private int heart_count;
	private int reply_count;
	
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
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
	public int getHeart_count() {
		return heart_count;
	}
	public void setHeart_count(int heart_count) {
		this.heart_count = heart_count;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	@Override
	public String toString() {
		return "MemberPostVO [post_no=" + post_no + ", member_no=" + member_no + ", bbs_no=" + bbs_no + ", bbs_title="
				+ bbs_title + ", heart_count=" + heart_count + ", reply_count=" + reply_count + "]";
	}
	
}

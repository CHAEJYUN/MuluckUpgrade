package com.multi.muluckup.community;

public class BookmarkVO {
	
	private int bookmark_no;
	private int bbs_no;
	private int member_no;
	
	public int getBookmark_no() {
		return bookmark_no;
	}
	public void setBookmark_no(int bookmark_no) {
		this.bookmark_no = bookmark_no;
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
		return "BookmarkVO [bookmark_no=" + bookmark_no + ", bbs_no=" + bbs_no + ", member_no=" + member_no + "]";
	}
	
}

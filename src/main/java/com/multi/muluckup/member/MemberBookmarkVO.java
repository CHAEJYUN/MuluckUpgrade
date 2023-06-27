package com.multi.muluckup.member;

public class MemberBookmarkVO {
	private int my_bookmark;
	private int bookmark_no;
	private int member_no;
	private int bbs_no;
	private String bbs_title;
	private int community_no;
	private String community_category;
	
	
	public int getMy_bookmark() {
		return my_bookmark;
	}
	public void setMy_bookmark(int my_bookmark) {
		this.my_bookmark = my_bookmark;
	}
	public int getBookmark_no() {
		return bookmark_no;
	}
	public void setBookmark_no(int bookmark_no) {
		this.bookmark_no = bookmark_no;
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
	public int getCommunity_no() {
		return community_no;
	}
	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}
	public String getCommunity_category() {
		return community_category;
	}
	public void setCommunity_category(String community_category) {
		this.community_category = community_category;
	}
	
	
	@Override
	public String toString() {
		return "MemberBookmarkVO [my_bookmark=" + my_bookmark + ", bookmark_no=" + bookmark_no + ", member_no="
				+ member_no + ", bbs_no=" + bbs_no + ", bbs_title=" + bbs_title + ", community_no=" + community_no
				+ ", community_category=" + community_category + "]";
	}
	
}

package com.multi.muluckup.community;

public class BbsVO {
	
	private int bbs_no;
	private String bbs_title;
	private String bbs_content;
	private String bbs_img;
	private int community_no;
	private int member_no;
	
	//검색
	private String type;
	private String keyword;
	
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
	public String getBbs_content() {
		return bbs_content;
	}
	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}
	public String getBbs_img() {
		return bbs_img;
	}
	public void setBbs_img(String bbs_img) {
		this.bbs_img = bbs_img;
	}
	public int getCommunity_no() {
		return community_no;
	}
	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "BbsVO [bbs_no=" + bbs_no + ", bbs_title=" + bbs_title + ", bbs_content=" + bbs_content + ", bbs_img="
				+ bbs_img + ", community_no=" + community_no + ", member_no=" + member_no + ", type=" + type
				+ ", keyword=" + keyword + "]";
	}

}

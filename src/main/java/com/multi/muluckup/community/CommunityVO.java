package com.multi.muluckup.community;

public class CommunityVO {

	private int community_no;
	private String community_category;

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
		return "CommunityVO [community_no=" + community_no + ", community_category=" + community_category + "]";
	}

}

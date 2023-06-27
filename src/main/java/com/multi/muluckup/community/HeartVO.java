package com.multi.muluckup.community;

public class HeartVO {

	private int heart_no;
	private int bbs_no;
	private int member_no;

	public int getHeart_no() {
		return heart_no;
	}

	public void setHeart_no(int heart_no) {
		this.heart_no = heart_no;
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
		return "HeartVO [heart_no=" + heart_no + ", bbs_no=" + bbs_no + ", member_no=" + member_no + "]";
	}

}

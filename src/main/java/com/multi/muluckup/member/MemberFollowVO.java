package com.multi.muluckup.member;

public class MemberFollowVO {
	private int follow_no;
	private int follower_user;
	private int following_user;
	private String member_img;
	private String member_nickname;
	private String member_id;
	
	public int getFollow_no() {
		return follow_no;
	}
	public void setFollow_no(int follow_no) {
		this.follow_no = follow_no;
	}
	public int getFollower_user() {
		return follower_user;
	}
	public void setFollower_user(int follower_user) {
		this.follower_user = follower_user;
	}
	public int getFollowing_user() {
		return following_user;
	}
	public void setFollowing_user(int following_user) {
		this.following_user = following_user;
	}
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	@Override
	public String toString() {
		return "MemberFollowVO [follow_no=" + follow_no + ", follower_user=" + follower_user + ", following_user="
				+ following_user + ", member_img=" + member_img + ", member_nickname=" + member_nickname
				+ ", member_id=" + member_id + "]";
	}
	
}

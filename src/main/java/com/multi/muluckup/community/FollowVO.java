package com.multi.muluckup.community;

import java.util.Date;

public class FollowVO {
	
	private int follow_no;
	private int follower_user;
	private int following_user;
	private Date follow_date;
	
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
	public Date getFollow_date() {
		return follow_date;
	}
	public void setFollow_date(Date follow_date) {
		this.follow_date = follow_date;
	}
	
	@Override
	public String toString() {
		return "FollowVO [follow_no=" + follow_no + ", follower_user=" + follower_user + ", following_user="
				+ following_user + ", follow_date=" + follow_date + "]";
	}
	
}

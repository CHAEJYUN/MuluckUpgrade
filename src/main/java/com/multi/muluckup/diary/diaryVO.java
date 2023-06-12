package com.multi.muluckup.diary;

import java.util.*;

public class diaryVO {

	private int diary_no;
	private String diary_img;
	private String diary_nickname;
	private String diary_title;
	private String diary_contents;
	private String diary_mood;
	private Date diary_date;
	private int member_no;
	private int card_no;
	
	public int getDiary_no() {
		return diary_no;
	}
	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
	}
	public String getDiary_img() {
		return diary_img;
	}
	public void setDiary_img(String diary_img) {
		this.diary_img = diary_img;
	}
	public String getDiary_nickname() {
		return diary_nickname;
	}
	public void setDiary_nickname(String diary_nickname) {
		this.diary_nickname = diary_nickname;
	}
	public String getDiary_title() {
		return diary_title;
	}
	public void setDiary_title(String diary_title) {
		this.diary_title = diary_title;
	}
	public String getDiary_contents() {
		return diary_contents;
	}
	public void setDiary_contents(String diary_contents) {
		this.diary_contents = diary_contents;
	}
	public String getDiary_mood() {
		return diary_mood;
	}
	public void setDiary_mood(String diary_mood) {
		this.diary_mood = diary_mood;
	}
	public Date getDiary_date() {
		return diary_date;
	}
	public void setDiary_date(Date diary_date) {
		this.diary_date = diary_date;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getCard_no() {
		return card_no;
	}
	public void setCard_no(int card_no) {
		this.card_no = card_no;
	}
	
	@Override
	public String toString() {
		return "diaryVO [diary_no=" + diary_no + ", diary_img=" + diary_img + ", diary_nickname=" + diary_nickname
				+ ", diary_title=" + diary_title + ", diary_contents=" + diary_contents + ", diary_mood=" + diary_mood
				+ ", diary_date=" + diary_date + ", member_no=" + member_no + ", card_no=" + card_no + "]";
	}
	
	
}
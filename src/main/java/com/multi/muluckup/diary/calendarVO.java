package com.multi.muluckup.diary;

//RAM에 만드는 저장공간을 만든다.
public class calendarVO {
	

	
	
	public int getCalendar_id() {
		return calendar_id;
	}
	public void setCalendar_id(int calendar_id) {
		this.calendar_id = calendar_id;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getCalendar_start() {
		return calendar_start;
	}
	public void setCalendar_start(String calendar_start) {
		this.calendar_start = calendar_start;
	}
	public String getCalendar_end() {
		return calendar_end;
	}
	public void setCalendar_end(String calendar_end) {
		this.calendar_end = calendar_end;
	}
	public String getCalendar_title() {
		return calendar_title;
	}
	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}
	public String getCalendar_mood() {
		return calendar_mood;
	}
	public void setCalendar_mood(String calendar_mood) {
		this.calendar_mood = calendar_mood;
	}
	
	@Override
	public String toString() {
		return "calendarVO [calendar_id=" + calendar_id + ", member_no=" + member_no + ", calendar_start="
				+ calendar_start + ", calendar_end=" + calendar_end + ", calendar_title=" + calendar_title
				+ ", calendar_mood=" + calendar_mood + "]";
	}

	private int calendar_id;
	private int member_no;
	private String calendar_start;
	private String calendar_end;
	private String calendar_title;
	private String calendar_mood;
	
	
	
}

package com.multi.muluckup.business;

import java.sql.Timestamp;

public class BusinessVO {

		private int business_no;
		private String business_title;
		private Timestamp business_date;
		private String business_write;
		private String business_image;
		private String business_place;
		private int member_no;
		private boolean business_choose;
		private boolean business_share;
		private String member_nickname; //member table과 조인하여 member의 특정 member_nickname 컬럼의 값을 가져오기 위해 추가
		

		public int getBusiness_no() {
			return business_no;
		}
		public void setBusiness_no(int business_no) {
			this.business_no = business_no;
		}
		public String getBusiness_title() {
			return business_title;
		}
		public void setBusiness_title(String business_title) {
			this.business_title = business_title;
		}
		public Timestamp getBusiness_date() {
			return business_date;
		}
		public void setBusiness_date(Timestamp business_date) {
			this.business_date = business_date;
		}
		public String getBusiness_write() {
			return business_write;
		}
		public void setBusiness_write(String business_write) {
			this.business_write = business_write;
		}
		public String getBusiness_image() {
			return business_image;
		}
		public void setBusiness_image(String business_image) {
			this.business_image = business_image;
		}
		public String getBusiness_place() {
			return business_place;
		}
		public void setBusiness_place(String business_place) {
			this.business_place = business_place;
		}

		
		//위도와 경도 값을 문자열로 합쳐서 business_place에 설정하는 메소드
		public void mapsLatitudeLongitude(double latitude, double longitude) {
			this.business_place= latitude + "/" + longitude;
		}
		

		public int getMember_no() {
			return member_no;
		}
		public void setMember_no(int member_no) {
			this.member_no = member_no;
		}
		public boolean isBusiness_choose() {
			return business_choose;
		}
		public void setBusiness_choose(boolean business_choose) {
			this.business_choose = business_choose;
		}
		public boolean isBusiness_share() {
			return business_share;
		}
		public void setBusiness_share(boolean business_share) {
			this.business_share = business_share;
		}

		public String getMember_nickname() {
			return member_nickname;
		}
		public void setMember_nickname(String member_nickname) {
			this.member_nickname = member_nickname;
			
		}

		@Override
		public String toString() {
			return "BusinessVO [business_no=" + business_no + ", business_title=" + business_title + ", business_date="
					+ business_date + ", business_write=" + business_write + ", business_image=" + business_image
					+ ", business_place=" + business_place + ", member_no=" + member_no + ", business_choose="
					+ business_choose + ", business_share=" + business_share + "]";
		}
		
	}


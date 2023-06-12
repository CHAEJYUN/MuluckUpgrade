package com.multi.muluckup.card;

import java.sql.Date;
import java.sql.Timestamp;

public class CardVO {
	private Integer card_no;
	private String card_name;
	private String card_species;
	private Date card_birth;
	private String card_mmti;
	private String card_img;
	private Timestamp card_date;

	public Integer getCard_no() {
		return card_no;
	}

	public void setCard_no(Integer card_no) {
		this.card_no = card_no;
	}

	public String getCard_name() {
		return card_name;
	}

	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}

	public String getcard_species() {
		return card_species;
	}

	public void setcard_species(String card_species) {
		this.card_species = card_species;
	}

	public Date getCard_birth() {
		return card_birth;
	}

	public void setCard_birth(Date card_birth) {
		this.card_birth = card_birth;
	}

	public String getCard_mmti() {
		return card_mmti;
	}

	public void setCard_mmti(String card_mmti) {
		this.card_mmti = card_mmti;
	}

	public String getCard_img() {
		return card_img;
	}

	public void setCard_img(String card_img) {
		this.card_img = card_img;
	}

	public Timestamp getCard_date() {
		return card_date;
	}

	public void setCard_date(Timestamp card_date) {
		this.card_date = card_date;
	}

	@Override
	public String toString() {
		return "CardVO [card_no=" + card_no + ", card_name=" + card_name + ", card_species="
				+ card_species + ", card_birth=" + card_birth + ", card_mmti=" + card_mmti + ", card_img=" + card_img
				+ ", card_date=" + card_date + "]";
	}

}
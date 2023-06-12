package com.multi.muluckup.mmti;

public class MmtiVO {
	private Integer question_id;
	private String question_type;
	private String question_title;
	private String option_a;
	private String option_b;

	public Integer getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(Integer question_id) {
		this.question_id = question_id;
	}

	public String getQuestion_type() {
		return question_type;
	}

	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}

	public String getQuestion_title() {
		return question_title;
	}

	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}

	public String getOption_a() {
		return option_a;
	}

	public void setOption_a(String option_a) {
		this.option_a = option_a;
	}

	public String getOption_b() {
		return option_b;
	}

	public void setOption_b(String option_b) {
		this.option_b = option_b;
	}

	@Override
	public String toString() {
		return "MmtiVO [question_id=" + question_id + ", question_type=" + question_type + ", question_title="
				+ question_title + ", option_a=" + option_a + ", option_b=" + option_b + "]";
	}

}

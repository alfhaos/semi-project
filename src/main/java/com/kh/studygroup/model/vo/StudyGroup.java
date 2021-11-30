package com.kh.studygroup.model.vo;

public class StudyGroup {
	
	
	private int group_number;
	private String group_name;	
	private int max_number;
	private String status;
	private String on_off;
	private String area;
	private String language;
	
	public StudyGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudyGroup(int group_number, String group_name, int max_number, String status, String on_off, String area,
			String language) {
		super();
		this.group_number = group_number;
		this.group_name = group_name;
		this.max_number = max_number;
		this.status = status;
		this.on_off = on_off;
		this.area = area;
		this.language = language;
	}

	public StudyGroup(String group_name, int max_number, String status, String on_off, String area, String language) {
		super();
		this.group_name = group_name;
		this.max_number = max_number;
		this.status = status;
		this.on_off = on_off;
		this.area = area;
		this.language = language;
	}

	public int getGroup_number() {
		return group_number;
	}

	public void setGroup_number(int group_number) {
		this.group_number = group_number;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public int getMax_number() {
		return max_number;
	}

	public void setMax_number(int max_number) {
		this.max_number = max_number;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOn_off() {
		return on_off;
	}

	public void setOn_off(String on_off) {
		this.on_off = on_off;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	@Override
	public String toString() {
		return "StudyGroup [group_number=" + group_number + ", group_name=" + group_name + ", max_number=" + max_number
				+ ", status=" + status + ", on_off=" + on_off + ", area=" + area + ", language=" + language + "]";
	}
	
	
	
	
	
}

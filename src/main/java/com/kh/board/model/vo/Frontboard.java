package com.kh.board.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;






public class Frontboard extends FrontboardEntity implements Serializable{
	

	private int commentCount;
	private List<Attachment> attachments;
	private String language;
	private int like_count;
	private String area;
	private int max_member;
	private int now_member;
	private String recruitment_status;

	public Frontboard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Frontboard(int no, String title, String writer, String content, int readCount, Date regDate) {
		super(no, title, writer, content, readCount, regDate);
		// TODO Auto-generated constructor stub
	}

	public Frontboard(int no, String title, String writer, String content, int readCount, Date regDate,
			int commentCount, List<Attachment> attachments, String language, int like_count, String area,
			int max_member, int now_member, String recruitment_status) {
		super(no, title, writer, content, readCount, regDate);
		this.commentCount = commentCount;
		this.attachments = attachments;
		this.language = language;
		this.like_count = like_count;
		this.area = area;
		this.max_member = max_member;
		this.now_member = now_member;
		this.recruitment_status = recruitment_status;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getMax_member() {
		return max_member;
	}

	public void setMax_member(int max_member) {
		this.max_member = max_member;
	}

	public int getNow_member() {
		return now_member;
	}

	public void setNow_member(int now_member) {
		this.now_member = now_member;
	}

	public String getRecruitment_status() {
		return recruitment_status;
	}

	public void setRecruitment_status(String recruitment_status) {
		this.recruitment_status = recruitment_status;
	}

	@Override
	public String toString() {
		return "Frontboard [commentCount=" + commentCount + ", attachments=" + attachments + ", language=" + language
				+ ", like_count=" + like_count + ", area=" + area + ", max_member=" + max_member + ", now_member="
				+ now_member + ", recruitment_status=" + recruitment_status + "]";
	}

	



	
	
	

}

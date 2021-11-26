package com.kh.board.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class BoardEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private String title;
	private String writer;
	private String content;
	private int readCount;
	private int likeCount;
	private Date regDate;
	private String area;
	private String language;
	private int max_member;
	private int now_member;
	private char recruit_status;
	public BoardEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardEntity(int no, String title, String writer, String content, int readCount, int likeCount, Date regDate,
			String area, String language, int max_member, int now_member, char recruit_status) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.readCount = readCount;
		this.likeCount = likeCount;
		this.regDate = regDate;
		this.area = area;
		this.language = language;
		this.max_member = max_member;
		this.now_member = now_member;
		this.recruit_status = recruit_status;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
	public char getRecruit_status() {
		return recruit_status;
	}
	public void setRecruit_status(char recruit_status) {
		this.recruit_status = recruit_status;
	}
	@Override
	public String toString() {
		return "BoardEntity [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", readCount=" + readCount + ", likeCount=" + likeCount + ", regDate=" + regDate + ", area=" + area
				+ ", language=" + language + ", max_member=" + max_member + ", now_member=" + now_member
				+ ", recruit_status=" + recruit_status + "]";
	}
	

}

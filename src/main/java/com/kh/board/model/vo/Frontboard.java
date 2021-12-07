package com.kh.board.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;


public class Frontboard extends FrontboardEntity implements Serializable{
	

	private int commentCount;
	private List<Attachment> attachments;
	
	public Frontboard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Frontboard(int no, String title, String writer, String content, int readCount, Date regDate, int group_no) {
		super(no, title, writer, content, readCount, regDate, group_no);
	}

	public Frontboard(int commentCount, List<Attachment> attachments) {
		super();
		this.commentCount = commentCount;
		this.attachments = attachments;
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

	@Override
	public String toString() {
		return "Frontboard [commentCount=" + commentCount + ", attachments=" + attachments + "]";
	}

	



	
	
	

}

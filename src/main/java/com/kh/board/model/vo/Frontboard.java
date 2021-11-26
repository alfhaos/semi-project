package com.kh.board.model.vo;

import java.io.Serializable;
import java.sql.Date;





public class Frontboard extends FrontboardEntity implements Serializable{
	

	private int commentCount;

	public Frontboard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Frontboard(int no, String title, String writer, String content, int readCount, Date regDate) {
		super(no, title, writer, content, readCount, regDate);
		// TODO Auto-generated constructor stub
	}

	public Frontboard(int commentCount) {
		super();
		this.commentCount = commentCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "Frontboard [commentCount=" + commentCount + "]";
	}
	
	
	

}

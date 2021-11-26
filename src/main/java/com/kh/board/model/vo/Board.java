package com.kh.board.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Board extends BoardEntity implements Serializable {

	private int attachCount; // 첨부파일수
	private List<Attachment> attachments;
	private int commentCount;
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int no, String title, String writer, String content, int readCount, int likeCount, Date regDate, String area, String language, int max_member, int now_member, char recruit_status) {
		super(no, title, writer, content, readCount, likeCount, regDate, area, language, max_member, now_member, recruit_status);
		// TODO Auto-generated constructor stub
	}
	
	
	public Board(int no, String title, String writer, String content, int readCount, int likeCount, Date regDate,
			String area, String language, int max_member, int now_member, char recruit_status, int attachCount,
			List<Attachment> attachments, int commentCount) {
		super(no, title, writer, content, readCount, likeCount, regDate, area, language, max_member, now_member,
				recruit_status);
		this.attachCount = attachCount;
		this.attachments = attachments;
		this.commentCount = commentCount;
	}
	public int getAttachCount() {
		return attachCount;
	}
	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}
	public List<Attachment> getAttachments() {
		return attachments;
	}
	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	@Override
	public String toString() {
		return "Board [" + super.toString() 
		     + ", attachCount=" + attachCount 
		     + ", commentCount=" + commentCount 
		     + ", attachments=" + attachments + "]";
	}
	
	
	
}

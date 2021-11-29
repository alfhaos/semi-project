package com.kh.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private int frontboardNo;
	private String originalFilename; 	// 사용자가 업로드한 파일명
	private String renamedFilename;		// 서버컴퓨터 저장된 파일명
	private Date regDate;
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Attachment(int no, int frontboardNo, String originalFilename, String renamedFilename, Date regDate) {
		super();
		this.no = no;
		this.frontboardNo = frontboardNo;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFrontBoardNo() {
		return frontboardNo;
	}

	public void setFrontBoardNo(int frontboardNo) {
		this.frontboardNo = frontboardNo;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getRenamedFilename() {
		return renamedFilename;
	}

	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Attachment [no=" + no + ", frontboardNo=" + frontboardNo + ", originalFilename=" + originalFilename
				+ ", renamedFilename=" + renamedFilename + ", regDate=" + regDate + "]";
	}
	
}
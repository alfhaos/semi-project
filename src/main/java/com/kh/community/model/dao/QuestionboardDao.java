package com.kh.community.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.kh.community.model.exception.FreeboardException;
import com.kh.community.model.exception.QuestionboardException;
import com.kh.community.model.vo.Attachment;
import com.kh.community.model.vo.Questionboard;

public class QuestionboardDao {
	
private Properties prop = new Properties();
	
	public QuestionboardDao() {
		File file = new File(FreeboardDao.class.getResource("/questionboard-query.properties").getPath());
		try {
			prop.load(new FileReader(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public List<Questionboard> selectAllQuestionBoard(Connection conn, Map<String, Integer> param) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllQuestionBoard");
		ResultSet rset = null;
		List<Questionboard> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, param.get("start"));
			pstmt.setInt(2, param.get("end"));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Questionboard board = new Questionboard();
				board.setNo(rset.getInt("no"));
				board.setTitle(rset.getString("title")); 
				board.setWriter(rset.getString("writer"));
				board.setContent(rset.getString("content"));
				board.setReadCount(rset.getInt("read_count"));
				board.setRegDate(rset.getDate("reg_date"));
				board.setAsk(rset.getString("ask"));			
				board.setLikeCount(rset.getInt("like_count"));
				//board.setCommentCount(rset.getInt("comment_count"));
				board.setAttachCount(rset.getInt("attach_count"));
				list.add(board);
			}
			
		} catch (SQLException e) {
			throw new FreeboardException("게시글 목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public int insertQuestionBoard(Connection conn, Questionboard questionboard) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQuestionBoard");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, questionboard.getTitle());
			pstmt.setString(2, questionboard.getWriter());
			pstmt.setString(3, questionboard.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new QuestionboardException("게시물 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int selectLastQuestionBoardNo(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectLastQuestionBoardNo");
		ResultSet rset = null;
		int boardNo = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				boardNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new QuestionboardException("최근 게시글번호 조회 오류", e);
		} finally {
			close(pstmt);
		}
		return boardNo;
	}


	public int insertAttachment(Connection conn, Attachment attach) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, attach.getBoardNo());
			pstmt.setString(2, attach.getOriginalFilename());
			pstmt.setString(3, attach.getRenamedFilename());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new QuestionboardException("첨부파일 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	

}

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
import com.kh.community.model.vo.Freeboard;
import com.kh.community.model.vo.FreeboardComment;



public class FreeboardDao {
	
	private Properties prop = new Properties();
	
	public FreeboardDao() {
		File file = new File(FreeboardDao.class.getResource("/freeboard-query.properties").getPath());
		try {
			prop.load(new FileReader(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

	public List<Freeboard> selectAllFreeBoard(Connection conn, Map<String, Integer> param) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllFreeBoard");
		ResultSet rset = null;
		List<Freeboard> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, param.get("start"));
			pstmt.setInt(2, param.get("end"));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Freeboard board = new Freeboard();
				board.setNo(rset.getInt("no"));
				board.setTitle(rset.getString("title")); 
				board.setWriter(rset.getString("writer"));
				board.setContent(rset.getString("content"));
				board.setReadCount(rset.getInt("read_count"));
				board.setRegDate(rset.getDate("reg_date"));
				board.setLikeCount(rset.getInt("like_count"));
				board.setCommentCount(rset.getInt("comment_count"));
				list.add(board);
			}
			
		} catch (SQLException e) {
			throw new FreeboardException("게시글 목록 조회 오류!", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public int insertFreeBoard(Connection conn, Freeboard freeboard) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFreeBoard");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, freeboard.getTitle());
			pstmt.setString(2, freeboard.getWriter());
			pstmt.setString(3, freeboard.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new FreeboardException("게시물 등록 오류!", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public Freeboard selectAllFreeBoard(Connection conn, int no) {
		Freeboard freeboard = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOneFreeBoard");
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				freeboard = new Freeboard();
				freeboard.setNo(rset.getInt("no"));
				freeboard.setTitle(rset.getString("title"));
				freeboard.setWriter(rset.getString("writer"));
				freeboard.setContent(rset.getString("content"));
				freeboard.setReadCount(rset.getInt("read_count"));
				freeboard.setRegDate(rset.getDate("reg_date"));
				freeboard.setLikeCount(rset.getInt("like_count"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return freeboard;
	}



	public int updateReadCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReadCount");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new FreeboardException("조회수 증가 처리 오류!", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public int deleteFreeBoard(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteFreeBoard"); 
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, no);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



	public int updateFreeBoard(Connection conn, Freeboard freeboard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateFreeBoard"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, freeboard.getTitle());
			pstmt.setString(2, freeboard.getContent());
			pstmt.setInt(3, freeboard.getNo());
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



	public List<FreeboardComment> selectFreeBoardCommentList(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectFreeBoardCommentList");
		ResultSet rset = null;
		List<FreeboardComment> commentList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				FreeboardComment bc = new FreeboardComment();
				bc.setNo(rset.getInt("no"));
				bc.setCommentLevel(rset.getInt("comment_level"));
				bc.setWriter(rset.getString("writer"));
				bc.setContent(rset.getString("content"));
				bc.setBoardNo(rset.getInt("board_no"));
				bc.setCommentRef(rset.getInt("comment_ref")); // 댓글인 경우 null이고, 이는 0으로 치환된다.
				bc.setRegDate(rset.getDate("reg_date"));
				commentList.add(bc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return commentList;
	}





}

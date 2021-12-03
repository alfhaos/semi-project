package com.kh.board.model.dao;



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

import com.kh.board.model.exception.FrontboardException;
import com.kh.board.model.vo.Frontboard;


public class FrontboardDao {
	
	private Properties prop = new Properties();
	
	/**
	 * board-query.properties 파일의 key=value 쿼리를 가져온다.
	 * - 클래스객체를 통해 build-path에 배포된 파일에 접근할 것!
	 * 
	 */
	public FrontboardDao() {
		File file = new File(FrontboardDao.class.getResource("/frontboard-query.properties").getPath());
		try {
			prop.load(new FileReader(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Frontboard> selectAllBoard(Connection conn, Map<String, Integer> param) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllBoard");
		ResultSet rset = null;
		List<Frontboard> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, param.get("start"));
			pstmt.setInt(2, param.get("end"));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Frontboard frontboard = new Frontboard();
				frontboard.setNo(rset.getInt("no")); // number
				frontboard.setTitle(rset.getString("title")); // varchar2, char
				frontboard.setWriter(rset.getString("writer"));
				frontboard.setContent(rset.getString("content"));
				frontboard.setReadCount(rset.getInt("read_count"));
				frontboard.setRegDate(rset.getDate("reg_date"));
				frontboard.setCommentCount(rset.getInt("comment_count"));
				frontboard.setLanguage(rset.getString("language"));
				
				list.add(frontboard);
			}
			
		} catch (SQLException e) {
			throw new FrontboardException("게시글 목록 조회 오류!", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public int selectTotalBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectTotalBoardCount");
		ResultSet rset = null;
		int totalCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalCount;
	}

	public int insertBoard(Connection conn, Frontboard board) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new FrontboardException("게시물 등록 오류!", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectLastBoardNo(Connection conn){
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectLastBoardNo");
		ResultSet rset = null;
		int boardNo = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				boardNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new FrontboardException("최근 게시글번호 조회 오류!", e);
		} finally {
			close(pstmt);
		}
		return boardNo;
	}

	public List<Frontboard> myboardlist(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("myboardlist");
		ResultSet rset = null;
		List<Frontboard> list = new ArrayList<>();
		System.out.println("myboardList sql = " + sql);
		System.out.println(memberId);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				Frontboard frontboard = new Frontboard();
				frontboard.setNo(rset.getInt("no")); // number
				frontboard.setTitle(rset.getString("title")); // varchar2, char
				frontboard.setWriter(rset.getString("writer"));
				frontboard.setContent(rset.getString("content"));
				frontboard.setReadCount(rset.getInt("read_count"));
				frontboard.setRegDate(rset.getDate("reg_date"));
				frontboard.setCommentCount(rset.getInt("comment_count"));
				frontboard.setLanguage(rset.getString("language"));
				list.add(frontboard);
			}
			
		} catch (SQLException e) {
			throw new FrontboardException("게시글 목록 조회 오류!", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
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
			throw new FrontboardException("조회수 증가 처리 오류!", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Frontboard selectOneBoard(Connection conn, int no) {
		Frontboard frontboard = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOneBoard");
		try{
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, no);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				frontboard = new Frontboard();
				frontboard.setNo(rset.getInt("no"));
				frontboard.setTitle(rset.getString("title"));
				frontboard.setWriter(rset.getString("writer"));
				frontboard.setContent(rset.getString("content"));
				frontboard.setReadCount(rset.getInt("read_count"));
				frontboard.setRegDate(rset.getDate("reg_date"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return frontboard;
	}
				
				

}

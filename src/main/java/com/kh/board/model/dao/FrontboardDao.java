package com.kh.board.model.dao;



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

import com.kh.board.model.vo.Frontboard;
import static com.kh.common.JDBCTemplate.close;


import com.kh.board.model.exception.FrontboardException;



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

}

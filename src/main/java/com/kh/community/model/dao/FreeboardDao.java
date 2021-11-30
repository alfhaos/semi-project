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

}

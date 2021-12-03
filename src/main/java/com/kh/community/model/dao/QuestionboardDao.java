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
			throw new FreeboardException("게시글 목록 조회 오류!", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}

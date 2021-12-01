package com.kh.community.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.kh.community.model.dao.FreeboardDao;
import com.kh.community.model.vo.Freeboard;


public class FreeboardService {

	private FreeboardDao freeboardDao = new FreeboardDao();

	public List<Freeboard> selectAllFreeBoard(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Freeboard> list = freeboardDao.selectAllFreeBoard(conn, param);
		close(conn);
		return list;
	}
	

	public int insertFreeBoard(Freeboard freeboard) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			result = freeboardDao.insertFreeBoard(conn, freeboard);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


	public Freeboard selectOneFreeBoard(int no) {
		Connection conn = getConnection();
		Freeboard freeboard = freeboardDao.selectAllFreeBoard(conn, no);
		close(conn);
		return freeboard;
	}
	
}

package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.kh.board.model.dao.FrontboardDao;
import com.kh.board.model.vo.Frontboard;


public class FrontboardService {
	
	private FrontboardDao frontboardDao = new FrontboardDao();

	public List<Frontboard> selectAllBoard(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Frontboard> list = frontboardDao.selectAllBoard(conn, param);
		close(conn);
		return list;
	}
	

	public int selectTotalBoardCount() {
		Connection conn = getConnection();
		int totalCount = frontboardDao.selectTotalBoardCount(conn);
		close(conn);
		return totalCount;
	}
	
	
}

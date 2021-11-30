package com.kh.community.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

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
	
}

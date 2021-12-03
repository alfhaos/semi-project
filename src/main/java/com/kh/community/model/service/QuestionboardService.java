package com.kh.community.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.kh.community.model.dao.QuestionboardDao;
import com.kh.community.model.vo.Freeboard;
import com.kh.community.model.vo.Questionboard;

public class QuestionboardService {
	private QuestionboardDao questionboardDao = new QuestionboardDao();

	public List<Questionboard> selectAllQuestionBoard(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Questionboard> list = questionboardDao.selectAllQuestionBoard(conn, param);
		close(conn);
		return list;
	}

}

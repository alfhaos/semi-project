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


	public int insertBoard(Frontboard board) throws Exception {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = frontboardDao.insertBoard(conn, board);
			
			// 방금 insert된 boardNo 조회 : select seq_board_no.currval from dual
			int boardNo = frontboardDao.selectLastBoardNo(conn);
			System.out.println("[BoardService] boardNo = " + boardNo);
			board.setNo(boardNo); // servlet에서 참조할 수 있도록한다.
			
			
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


	public List<Frontboard> myboardlist(String memberId) {
		Connection conn = getConnection();
		List<Frontboard> list = frontboardDao.myboardlist(conn, memberId);
		close(conn);
		return list;
	}


	public int updateReadCount(int no) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = frontboardDao.updateReadCount(conn, no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


	public Frontboard selectOneBoard(int no) {
		Connection conn = getConnection();
		Frontboard board = frontboardDao.selectOneBoard(conn, no);
//		List<Attachment> attachments = boardDao.selectAttachmentByBoardNo(conn, no);
//		board.setAttachments(attachments);
		close(conn);
		return board;
	}
	
	
}

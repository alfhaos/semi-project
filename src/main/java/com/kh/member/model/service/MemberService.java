package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;
//import static com.kh.mvc.common.JdbcTemplate.close;
//import static com.kh.mvc.common.JdbcTemplate.commit;
//import static com.kh.mvc.common.JdbcTemplate.getConnection;
//import static com.kh.mvc.common.JdbcTemplate.rollback;


import java.sql.Connection;

import com.kh.member.model.vo.Member;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.exception.MemberException;

public class MemberService {

	public static final String USER_ROLE = "U";
	public static final String ADMIN_ROLE = "A";
	
	private static MemberDao memberDao = new MemberDao();
	
	public Member selectOneMember(String memberId) {
		
		Connection conn = getConnection();
		Member member = new Member();
		
		try {
			
			member = memberDao.selectOneMember(memberId,conn);
			
			
		}
		catch(Exception e) {
			rollback(conn);
		}
		finally {
			close(conn);
			
		}
		
		
		
		return member;
	}


	public int updateMember(Member member) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = memberDao.updateMember(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	public int updatePassword(Member member) {
		Connection conn = null;
		int result = 0;;
		try {
			conn = getConnection();
			result = memberDao.updatePassword(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn = null;
		int result = 0;
		try{
			conn = getConnection();
			result = memberDao.deleteMember(conn, memberId);
			if(result == 0)
				throw new MemberException("해당 회원은 존재하지 않습니다.");
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);			
		}
		return result;
	}
	
		public int insertMember(Member member) {
		Connection conn = null;
		int result = 0;
		try {
			// 1.Connection객체 생성
			conn = getConnection();
			// 2.Dao요청
			result = memberDao.insertMember(conn, member);
			// 3.트랜잭션처리
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			// 4.Connection 자원반납
			close(conn);
		}
		return result;
	}

}

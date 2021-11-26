package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;
//import static com.kh.mvc.common.JdbcTemplate.close;
//import static com.kh.mvc.common.JdbcTemplate.commit;
//import static com.kh.mvc.common.JdbcTemplate.getConnection;
//import static com.kh.mvc.common.JdbcTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.vo.Member;
import com.kh.member.model.dao.MemberDao;

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

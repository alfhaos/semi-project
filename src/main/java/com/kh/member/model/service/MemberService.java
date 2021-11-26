package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;


import java.sql.Connection;

import com.kh.member.model.vo.Member;
import com.kh.member.MemberException;
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

}

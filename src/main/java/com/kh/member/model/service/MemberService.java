package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

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

}

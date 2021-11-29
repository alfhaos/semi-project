package com.kh.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;
//import static com.kh.mvc.common.JdbcTemplate.close;

import com.kh.member.MemberException;
import com.kh.member.model.vo.Member;

public class MemberDao {

	private static Properties prop = new Properties();
	
	public MemberDao(){
		// /build/classes 하위에서 파일을 조회
		String filepath = MemberDao.class.getResource("/member-query.properties").getPath();

		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Member selectOneMember(String memberId,Connection conn) {

		String sql = prop.getProperty("SelectOneMember");

		PreparedStatement pstmt = null;
		Member member = null;
		ResultSet rset = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				member = new Member();
				
				member.setMember_id(rset.getString("member_id"));
				member.setPassword(rset.getString("password"));
				member.setMember_name(rset.getString("member_name"));
				member.setMember_role(rset.getString("member_role"));
				member.setGender(rset.getString("gender"));
				member.setLanguage(rset.getString("language"));
				member.setEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));
				member.setAddress(rset.getString("address"));
				member.setEnroll_date(rset.getDate("enroll_date"));
			}
			
		} catch (SQLException e) {
			throw new MemberException("로그인 오류 발생",e);
		}
		finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return member;
	}



	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		int result = 0;
		
		try {
			// 1.PreapredStatement객체 준비 - sql값대입
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getMember_name());
			pstmt.setString(4, member.getMember_role());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getLanguage());
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getPhone());
			pstmt.setString(9, member.getAddress());
			
			// 2.실행 - executeUpdate
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new MemberException("회원가입 오류!", e);
		} finally {
			// 3.자원반납
			close(pstmt);
		}
		
		
		return result;
	}


}

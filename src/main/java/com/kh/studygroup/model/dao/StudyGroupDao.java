package com.kh.studygroup.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.member.MemberException;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

import com.kh.studygroup.model.exception.GroupException;
import com.kh.studygroup.model.vo.StudyGroup;

public class StudyGroupDao {

	private static Properties prop = new Properties();
	
	public StudyGroupDao(){
		// /build/classes 하위에서 파일을 조회
		String filepath = MemberDao.class.getResource("/study-group-query.properties").getPath();

		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int InsertGroup(StudyGroup group, Connection conn) {
	
		String sql = prop.getProperty("InsertGroup");
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, group.getGroup_name());
			pstmt.setInt(2, group.getMax_number());
			pstmt.setString(3, group.getStatus());
			pstmt.setString(4, group.getArea());
			pstmt.setString(5, group.getLanguage());
			
			result = pstmt.executeUpdate();
			
		}
		 catch (SQLException e) {
				throw new GroupException("그룹 생성 오류!",e);
			}
		finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int selectLastGroupNo(StudyGroup group, Connection conn) {
		
		String sql = prop.getProperty("selectLastGroupNo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int num = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				num = rset.getInt(1);
			}
			
			
			
		} catch (SQLException e) {
			throw new GroupException("최근 그룹 번호 조회 오류!",e);
		}
		finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return num;
	}

	public int InsertGroupMember(Connection conn, String memberId, String memberName, String adminRole, int groupNum) {
		
		String sql = prop.getProperty("InsertGroupMember");

		PreparedStatement pstmt = null;
		int result = 0;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,groupNum);
			pstmt.setString(2, memberId);
			pstmt.setString(3, memberName);
			pstmt.setString(4, adminRole);
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			throw new GroupException("그룹 멤버 업데이트 오류!",e);
		}
		finally {
			close(pstmt);
		}
		
		
		return result;
	}

}

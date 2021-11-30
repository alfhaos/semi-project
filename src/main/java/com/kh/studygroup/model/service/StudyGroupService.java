package com.kh.studygroup.model.service;

import static com.kh.common.JDBCTemplate.*;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.member.model.vo.Member;
import com.kh.studygroup.model.dao.StudyGroupDao;
import com.kh.studygroup.model.vo.StudyGroup;
import com.kh.studygroup.model.vo.StudyGroupMember;

public class StudyGroupService {
	
	public static final String USER_ROLE = "U";
	public static final String ADMIN_ROLE = "A";
	
	private static StudyGroupDao groupDao = new StudyGroupDao();
	
	
	public int InsertGroup(StudyGroup group,Member member) {
		Connection conn = getConnection();
		int result = 0;
		try {
			
			result += groupDao.InsertGroup(group,conn);
			int groupNum = groupDao.selectLastGroupNo(group,conn);
			
			member.setStudy_group(groupNum); // servlet에서 참조할 수 있도록 한다.
			
			
			result += groupDao.InsertGroupMember(conn,member, ADMIN_ROLE,groupNum);
			result += groupDao.UpdateMemberStudyGroup(conn,groupNum,member);

			
			if(result != 3 ) {
				result = 0;
			}
			commit(conn);
			
		}
		catch(Exception e) {
			rollback(conn);
		}
		finally {
			close(conn);
			
		}
		
		
		
		return result;
	}


	public List<StudyGroupMember> selectAllGroupMember(int studyGroup) {
		Connection conn = getConnection();
		List<StudyGroupMember> MemberList = null;
		
		try {
		MemberList = groupDao.selectAllGroupMember(conn,studyGroup);
		
		}
		
		catch(Exception e) {
			rollback(conn);
		}
		finally {
			close(conn);
			
		}
		
		
		
		return MemberList;
	}

}

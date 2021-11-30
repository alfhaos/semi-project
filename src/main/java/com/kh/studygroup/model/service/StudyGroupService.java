package com.kh.studygroup.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.vo.Member;
import com.kh.studygroup.model.dao.StudyGroupDao;
import com.kh.studygroup.model.vo.StudyGroup;

public class StudyGroupService {
	
	public static final String USER_ROLE = "U";
	public static final String ADMIN_ROLE = "A";
	
	private static StudyGroupDao groupDao = new StudyGroupDao();
	
	
	public int InsertGroup(StudyGroup group, String memberId, String memberName) {
		Connection conn = getConnection();
		int result1 = 0;
		int result2 = 0;
		try {
			
			result1 = groupDao.InsertGroup(group,conn);
			int groupNum = groupDao.selectLastGroupNo(group,conn);
			
			
			result2 = groupDao.InsertGroupMember(conn,memberId,memberName, ADMIN_ROLE,groupNum);
			
			if(result2 == 0 ) {
				result1 = 0;
				rollback(conn);
			}
			
			
		}
		catch(Exception e) {
			rollback(conn);
		}
		finally {
			close(conn);
			
		}
		
		
		
		return result1;
	}

}

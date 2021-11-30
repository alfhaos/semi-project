package com.kh.studygroup.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.studygroup.model.service.StudyGroupService;
import com.kh.studygroup.model.vo.StudyGroup;

/**
 * Servlet implementation class StudyGroupCreate
 */
@WebServlet("/studygroup/create")
public class StudyGroupCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudyGroupService groupService = new StudyGroupService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		// 0. 인코딩 처리    필터 만들면 지우기!!!!!
		request.setCharacterEncoding("utf-8");
		
		
		request
			.getRequestDispatcher("/WEB-INF/views/group/studyGroupCreate.jsp")
			.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0. 인코딩 처리    필터 만들면 지우기!!!!!
		request.setCharacterEncoding("utf-8");
		
		// 1. 사용자 입력값 처리
		String group_name = request.getParameter("groupName");
		int max_member = Integer.parseInt(request.getParameter("max_member"));
		String status = request.getParameter("status");
		String on_off = request.getParameter("on/off");
		String area = request.getParameter("area");
		String language = request.getParameter("language");
		
		StudyGroup group = new StudyGroup(group_name,max_member,status,on_off,area,language);
		System.out.println("[StudyGroupCreate@Servlet] group = " + group);
		
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		Member member = new Member(memberId,memberName,0);
		
		// 2. 업무로직
		int result = 0;
		
		result = groupService.InsertGroup(group,member);

		String msg = result > 0 ? "스터디 그룹 생성 완료" : "스터디 그룹 생성 실패";
		request.getSession().setAttribute("msg", msg);
		
		
		// 3. view 단
		String location = request.getContextPath() + "/studygroup/view";
		response.sendRedirect(location);
		
	}

}

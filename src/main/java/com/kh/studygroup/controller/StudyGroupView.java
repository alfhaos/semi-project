package com.kh.studygroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudyGroupView
 */
@WebServlet("/studygroup/view")
public class StudyGroupView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0. 인코딩 처리    필터 만들면 지우기!!!!!
		request.setCharacterEncoding("utf-8");
		

		// 1. 사용자 입력값 처리
		
		
		
		
		request
			.getRequestDispatcher("/WEB-INF/views/group/studyGroupMain.jsp")
			.forward(request, response);
		
		
		
		
	}

}

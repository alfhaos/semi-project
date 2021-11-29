package com.kh.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AdminMemberListServlet
 */
@WebServlet("/admin/memberList")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/**
	 * sql 
	 * select * from member order by enroll_date desc
	 * 
	 * paging recipe
	 * 1. content section
	 *  - cPage 현재페이지
	 *  - numPerPage 한페이지의 게시물수 10
	 * 	- startNum, endNum
	 * 
	 * 
	 * 2. pagebar section
	 * 	- totalContent 총게시물수
	 *  - totalPage 12
	 *  - pagebarSize 5
	 *  - pageNo 증감변수
	 *  - pageStart | pageEnd
	 *  - url
	 * 
	 * 
	 * 
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request
			.getRequestDispatcher("/WEB-INF/views/admin/memberList.jsp")
			.forward(request, response);
			
	
	
	}

}

package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyBoardListServlet
 */
@WebServlet("/board/MyBoardList")
public class MyBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		Member loginMember = (Member) request.getAttribute("loginMember");
//		System.out.println(loginMember);
		
		request
		.getRequestDispatcher("/WEB-INF/views/board/myboardList.jsp")
		.forward(request, response);
		
	}

}

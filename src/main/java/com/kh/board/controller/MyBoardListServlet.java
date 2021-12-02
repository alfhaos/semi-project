package com.kh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.FrontboardService;
import com.kh.board.model.vo.Frontboard;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyBoardListServlet
 */
@WebServlet("/board/MyBoardList")
public class MyBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FrontboardService frontboardService = new FrontboardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String memberId = request.getParameter("memberId");
			
			List<Frontboard> list = frontboardService.myboardlist(memberId);
			System.out.println("myboardList@servlet = " + list);
			
			request.setAttribute("list", list);
			
			request
			.getRequestDispatcher("/WEB-INF/views/board/myboardList.jsp")
			.forward(request, response);
			
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}

}

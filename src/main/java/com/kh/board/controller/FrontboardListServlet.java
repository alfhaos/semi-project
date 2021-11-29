package com.kh.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.FrontboardService;
import com.kh.board.model.vo.Frontboard;


/**
 * Servlet implementation class FrontboardListServlet
 */
@WebServlet("/board/frontboardList")
public class FrontboardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FrontboardService frontboardService = new FrontboardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		final int numPerPage = 5;
		int cPage = 1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {}
		int start = (cPage - 1) * numPerPage + 1; 
		int end = cPage * numPerPage;
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		
		// 2. 업무로직
		// 2-a. content영역 : 페이징쿼리
		List<Frontboard> list = frontboardService.selectAllBoard(param);
		System.out.println("list@servlet = " + list);
		
		request.setAttribute("list", list);
		request
				.getRequestDispatcher("/WEB-INF/views/board/frontboardList.jsp")
				.forward(request, response);
	}

}

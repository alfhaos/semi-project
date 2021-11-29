package com.kh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.exception.FrontboardException;
import com.kh.board.model.service.FrontboardService;
import com.kh.board.model.vo.Frontboard;

/**
 * Servlet implementation class BoardEnrollServlet
 */
@WebServlet("/board/boardEnroll")
public class BoardEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FrontboardService boardService = new FrontboardService();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			
			
			// 1.사용자입력값 -> Board객체
			// MultipartRequest객체 생성하는 경우, 기존 request가 아닌 MultipartRequest객체에서 값을 가져와야 한다.
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			Frontboard board = new Frontboard(0, title, writer, content, 0, null);
			
			
			System.out.println("[BoardEnrollServlet] board = " + board);
			
			// 2.업무로직
			int result = boardService.insertBoard(board);
			System.out.println("[BoardEnrollServlet] result = " + result);
			String msg = result > 0 ? "게시물 등록 성공!" : "게시물 등록 실패!";
			
			// 3.redirect: <d></d>ML은 redirect해서 url을 변경한다.
			// location: /mvc/board/boardList
			request.getSession().setAttribute("msg", msg);
			String location = request.getContextPath() + "/board/boardView?no=" + board.getNo();
			response.sendRedirect(location);
		} catch(Exception e) {
			e.printStackTrace();
			throw new FrontboardException("게시물 등록 오류!", e);
		}
	}

}

package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.exception.FrontboardException;
import com.kh.board.model.service.FrontboardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Frontboard;
import com.kh.common.MvcFileRenamePolicy;
import com.kh.common.MvcUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class FrontboardEnrollServlet
 */
@WebServlet("/board/frontboardEnroll")
public class FrontboardEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FrontboardService frontboardService = new FrontboardService();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String encoding = "utf-8";
			
			// 1.사용자입력값 -> Board객체
			// MultipartRequest객체 생성하는 경우, 기존 request가 아닌 MultipartRequest객체에서 값을 가져와야 한다.
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			Frontboard frontboard = new Frontboard(0, title, writer, content, 0, null);
			
			
			System.out.println("[BoardEnrollServlet] board = " + frontboard);
			
			// 2.업무로직
			int result = frontboardService.insertBoard(frontboard);
			System.out.println("[BoardEnrollServlet] result = " + result);
			String msg = result > 0 ? "게시물 등록 성공!" : "게시물 등록 실패!";
			
			// 3.redirect: <d></d>ML은 redirect해서 url을 변경한다.
			// location: /mvc/board/boardList
			request.getSession().setAttribute("msg", msg);
			String location = request.getContextPath() + "/board/boardView?no=" + frontboard.getNo();
			response.sendRedirect(location);
		} catch(FrontboardException e) {
			e.printStackTrace();
			throw e;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

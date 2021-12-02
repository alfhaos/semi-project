package com.kh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.exception.FrontboardException;
import com.kh.board.model.service.FrontboardService;
import com.kh.board.model.vo.Frontboard;

/**
 * Servlet implementation class FreeboardViewServlet
 */
@WebServlet("/board/frontboardView")
public class FrontboardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FrontboardService frontboardService = new FrontboardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.파라미터핸들링
		int no  = Integer.parseInt(request.getParameter("no"));
		
		//조회수
		Cookie[] cookies = request.getCookies();
		boolean hasRead = false;
		String frontboardCookieVal = "";
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				String name = cookie.getName();
				String value = cookie.getValue();
				if("frontboardCookie".equals(name)) {
					frontboardCookieVal = value; // 기존쿠키값
					if(value.contains("[" + no + "]")) {
						hasRead = true;
						break;
					}
				}
			}
		}
		if(!hasRead) {
			int result = frontboardService.updateReadCount(no);
			
			Cookie cookie = new Cookie("frontboardCookie", frontboardCookieVal + "[" + no + "]");
			cookie.setPath(request.getContextPath() + "/board/frontboardView");
			cookie.setMaxAge(1 * 24 * 60 * 60);
			response.addCookie(cookie);
			
			System.out.println("[FrontboardViewServlet] 조회수 증가 및 boardCookie 생성");
			
		}
		
		
		
		Frontboard frontboard = frontboardService.selectOneBoard(no);
		System.out.println("[FrontboardViewServlet] frontboard = " + frontboard);
		//게시글 가져오기에 실패한경우
		if(frontboard == null) {
			throw new FrontboardException("해당 게시글이 존재하지 않습니다.");
		}
		
		// XSS공격대비 <> 변환처리
		String content = frontboard.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		
		// 개행문자처리
		content = content.replaceAll("\n", "<br/>");
		frontboard.setContent(content);
		
		//3. jsp forwarding
//		request.setAttribute("commentList", commentList);
		request.setAttribute("frontboard", frontboard);
		request.getRequestDispatcher("/WEB-INF/views/board/frontboardView.jsp")
			   .forward(request, response);

		
	}

}
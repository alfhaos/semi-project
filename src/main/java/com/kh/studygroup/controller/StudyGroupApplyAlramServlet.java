package com.kh.studygroup.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.exception.FrontboardException;
import com.kh.board.model.service.FrontboardService;
import com.kh.board.model.vo.Frontboard;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.StudyGroupAlarm;
import com.kh.studygroup.model.vo.Alram;

/**
 * Servlet implementation class StudyGroupApplyAlramServlet
 */
@WebServlet("/group/groupApply")
public class StudyGroupApplyAlramServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FrontboardService frontboardService = new FrontboardService();
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String writer = request.getParameter("writer");
		
		HttpSession session = request.getSession(true);
		//memberservice에서 처리
		int result = memberService.insertAlram(memberId, writer);
		String msg = result > 0 ? "신청 완료" : "신청 실패";
		session.setAttribute("msg", msg);
		
		String location = request.getHeader("Referer");
		System.out.println("location = "+ location);
		response.sendRedirect(location);

	}

}

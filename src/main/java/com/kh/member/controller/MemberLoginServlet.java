package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. 인코딩 처리    필터 만들면 지우기!!!!!
		request.setCharacterEncoding("utf-8");
		
		
		// 1. 사용자 입력값 처리
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String msg;
		
		System.out.println("[MemberLogin@Servlet] memberId = " + memberId + ", password = " + password );
		
		
		// 2. 업무 로직
		Member member  = memberService.selectOneMember(memberId);
		
		
		System.out.println("[member@MemberLoginServlet] member = " + member);
		
		
		
		//HttpSession session = request.getSession();
		HttpSession session = request.getSession(true);
		
		
		// timeout설정 - web.xml 설정보다 우선순위가 높다.
		session.setMaxInactiveInterval(10*60); // 초단위
		
		
		
		if (member != null && password.equals(member.getPassword())) {
			
			
			
			// 로그인 성공
			session.setAttribute("msg", "로그인 성공!");
			session.setAttribute("loginMember", member);
			System.out.println(session.getId());
			
			
			// 로그인객체를 session 저장
			session.setAttribute("loginMember", member);
			
		}
		
		else {
			// 로그인 실패
			session.setAttribute("msg", "로그인 실패!");
		}
		
		
		
		// 3. view단 제공
		String location = request.getHeader("Referer");
		System.out.println("location = "+ location);
		response.sendRedirect(location);
		
		
	}



}

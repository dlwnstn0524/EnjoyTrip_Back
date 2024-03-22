package com.ssafy.enjoytrip.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.ssafy.enjoytrip.dto.Member;
import com.ssafy.enjoytrip.exception.AuthenticationException;
import com.ssafy.enjoytrip.model.dao.MemberDao;
import com.ssafy.enjoytrip.model.dao.MemberDaoImpl;
import com.ssafy.enjoytrip.model.service.MemberService;
import com.ssafy.enjoytrip.model.service.MemberServiceImpl;

@WebServlet("/enjoytrip")
public class EnjoyTripController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService mSer;
	private MemberDao mDao;
	
    public EnjoyTripController() {
        super();
    }

	@Override
	public void init() throws ServletException {
		super.init();
		mSer = MemberServiceImpl.getInstance();
		mDao = MemberDaoImpl.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}


	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String url = "";
		try {
			if (action.equals("register")) {
				url = register(request, response);
			} else if (action.equals("login")) {
				url = login(request, response);
			} else if (action.equals("logout")) {
				url = "";
			} else if (action.equals("modify")) {
				url = "";
			} else if (action.equals("delete")) {
				url = "";
			} else if (action.equals("mypage")) {
				url = "";
			} else if (action.equals("init")) {
				url = "/main.html";
			}
		} catch(Exception e) {
			e.printStackTrace();
			//error page 처리
			request.setAttribute("msg", "에러에요 ;ㅁ;");
			url = "error/error.jsp";
		}
		if (url.startsWith("redirect")) {
			url = url.substring(url.indexOf(":")+1);
			response.sendRedirect(request.getContextPath()+url);		
		} else {
			request.getRequestDispatcher(url).forward(request, response);	
		}
	}
	
	private String register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		mSer.register(new Member(id, pw, email));
		// register 주소 매핑
		return "/enjoytrip?action=register";
	}
	
	private String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");	
		try {
			mSer.login(id, pw);
			HttpSession session = request.getSession();
			session.setAttribute("login", id);
		} catch (AuthenticationException e) {
			return "redirect:/enjoytrip?action=loginFailed";
		}
		return "/enjoytrip?action=init";
	}
}

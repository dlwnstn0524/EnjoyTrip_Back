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
import java.sql.SQLIntegrityConstraintViolationException;

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
			if (action.equals("mvregister")) {
				url = "/join.jsp";
			} else if (action.equals("register")) {
				url = register(request, response);
			} else if (action.equals("login")) {
				url = login(request, response);
			} else if (action.equals("logout")) {
				url = logout(request, response);
			} else if (action.equals("update")) {
				url = update(request, response);
			} else if (action.equals("delete")) {
				url = delete(request, response);
			} else if (action.equals("mvmypage")) {
				url = myPage(request, response);
			} else if (action.equals("mypage")) {
				url = "/myPage.jsp";
			} else if (action.equals("init")) {
				url = "/index.jsp";
			}
		} catch (SQLIntegrityConstraintViolationException e) {
			e.printStackTrace();
			request.setAttribute("msg", "중복된 아이디 입니다. 다시 시도하세요.");
			// 
			url = "error/error.jsp";
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
		String name = request.getParameter("name");
		System.out.println(id + " " + pw + " " + email);
		mSer.register(new Member(id, pw, email, name));
		// register 주소 매핑
		// 이후 마이페이지로 수정?
		return "/enjoytrip?action=index.jsp";
	}
	
	private String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");	
		System.out.println(id + " " + pw);
		try {
			mSer.login(id, pw);
			HttpSession session = request.getSession();
			session.setAttribute("login", id);
			
			Cookie c = new Cookie("login", id);
			c.setMaxAge(60 * 60);
			response.addCookie(c);
		} catch (AuthenticationException e) {
			return "redirect:/enjoytrip?action=loginFailed";
		}
		return "redirect:/enjoytrip?action=init";
	}
	
	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		Cookie[] cookies = request.getCookies();
		for (Cookie c: cookies) {
			if (c.getName() == "login") {
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
		return "/enjoytrip?action=init";
	}
	
	
	private String update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Update");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		Member m = new Member();
		m.setId(id);
		m.setPw(pw);
		m.setEmail(email);
		m.setName(name);
		mSer.updateMember(m);
		return "redirect:/enjoytrip?action=myPage";
	}
	
	private String delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Delete");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		mSer.deleteMember(id, pw);
		return "redirect:/enjoytrip?action=init";
	}
	
	private String myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member m = mSer.getMember((String)request.getSession().getAttribute("login"));
		request.setAttribute("m", m);
		System.out.println(m);
		return "/enjoytrip?action=mypage";
	}
}

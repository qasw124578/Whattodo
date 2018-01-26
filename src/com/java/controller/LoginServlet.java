package com.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.model.dao.UserDAO;
import com.java.model.vo.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		//post만 가능 -> 한글 깨지지 않게 
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String password = request.getParameter("password"); //getParameter() 하나의 데이터 받아와
//		String[] hobby = request.getParameterValues("hobby"); //getParameterValues() 다수의 데이터 받아와 
		
		// 유효성 검사 부분
		if(userid == null || userid.trim().length() ==0 ||
				password== null || password.trim().length() ==0){
				
			System.out.println("유효성 검사 실패");
			
			/*request.setAttribute("errorMessage", "유효성 검사 실패"); //setAttribute(key,값)
			request.getRequestDispatcher("login.jsp").forward(request, response);*/
			//response.sendRedirect("login.jsp");	//login.jsp 페이지로 이동 코드, 항상 페이지 이동 코드를 사용할땐 반드시 return문 써줘
			return;									//response.sendRedirect("login.jsp"); 이코드로는 정보를 전달할 수 없다.
		}
		
		UserDAO userdao = new UserDAO();
		String name = userdao.login(userid, password); // UserDAO에서 받아온 id, password를 name이란 변수에 넣는것 
		if(name !=null){
			//로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("user", new User(userid, name));
			System.out.println(name);
			System.out.println("로그인 성공");
			response.sendRedirect("recommend.jsp");
			return;
		}else{
			//로그인 실패
			System.out.println("로그인 실패"); // server쪽 실행 콘솔에 나오는 sysout
			request.setAttribute("errorMessage", "사번과 비밀번호를 다시 확인해 주세요."); //setAttribute(key,값)			
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;		
		}
			
		
		
	}

}

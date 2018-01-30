package com.java.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChoiceServlet
 */
@WebServlet("/choice.do")
public class ChoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			HttpSession session = request.getSession();
			
			String location = request.getParameter("location");
			if (location.equals("seocho"))
				location = "서초";
			else if (location.equals("mapo"))
				location = "마포";
			else
				location = "송파";
			
			session.setAttribute("location", location);
			request.getRequestDispatcher("recommend.do").forward(request, response);
			return;
			

	}

}

package com.java.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.model.dao.GoodDAO;

/**
 * Servlet implementation class goodServlet
 */
@WebServlet("/good.do")
public class GoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int flag = 1;
		GoodDAO goodDAO = new GoodDAO();
		
		String code = request.getParameter("code");
		String id = (String)request.getSession().getAttribute("id");
		flag = goodDAO.getFlag(code, id);
		
		System.out.println("GoodServlet doGet");
		request.setAttribute("flag", flag);
		request.getRequestDispatcher("/result.jsp").forward(request, response);		
		return;
	}

}

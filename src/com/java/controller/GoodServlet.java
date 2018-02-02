package com.java.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.model.dao.GoodDAO;
import com.java.model.vo.User;

/**
 * Servlet implementation class goodServlet
 */
@WebServlet("/good.do")
public class GoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int flag;
		int goodCount = -1;
		GoodDAO goodDAO = new GoodDAO();
		
		String code = request.getParameter("code");
		User user = (User)request.getSession().getAttribute("user");
		String id = user.getUserID();
		flag = goodDAO.getFlag(code, id);
		
		// flag: (1)Success, (0)Denied, (-1)Failed
		if (flag == 1) {
			goodCount = goodDAO.getGoodCount(code);
		}
		request.setAttribute("flag", flag);
		request.setAttribute("count", goodCount);
		request.getRequestDispatcher("/result.jsp").forward(request, response);		
		return;
	}

}

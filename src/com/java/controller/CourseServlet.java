package com.java.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.model.dao.CourseDAO2;
import com.java.model.vo.Course;
import com.java.model.vo.Restaurant;

/**
 * Servlet implementation class CourseServlet
 */
@WebServlet("/course.do")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			CourseDAO2 courseDAO = new CourseDAO2();
			
			request.setCharacterEncoding("utf-8");		
			String theme = request.getParameter("theme");
			String goo = request.getParameter("goo");
			System.out.println(theme + goo);
			
			ArrayList<ArrayList<Restaurant>> list = courseDAO.courseView(theme, goo);
			
			request.setAttribute("courseList", list);
			request.getRequestDispatcher("Course.jsp").forward(request, response);
			System.out.println("forward");
			return;
		
	}

}

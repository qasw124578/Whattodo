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
			String goo = (String)request.getSession().getAttribute("location");
			
			ArrayList<Course> courseMetaData = courseDAO.getCourseView(theme, goo);
			ArrayList<ArrayList<Restaurant>> courseDetailList = courseDAO.courseView(courseMetaData);
			
			request.setAttribute("course_list", courseMetaData);
			request.setAttribute("detail_list", courseDetailList);
			request.getRequestDispatcher("course.jsp").forward(request, response);
			return;
		
	}

}

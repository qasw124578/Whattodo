package com.java.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.model.dao.CourseDAO;
import com.java.model.vo.Course;
import com.java.model.vo.Location;
import com.java.model.vo.Restaurant;

/**
 * Servlet implementation class RecommendServlet
 */
@WebServlet("/recommend.do")
public class RecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseDAO courseDao = new CourseDAO();
		String courseCode = request.getParameter("courseCode");
		Course course = courseDao.getCourseInfo(courseCode);
		Location locationInfo = courseDao.getLocation(courseCode);
		ArrayList<Restaurant> list = courseDao.getCourseDetail(courseCode);
		
		request.setAttribute("course", course);
		request.setAttribute("detailList", list);
		request.setAttribute("location", locationInfo);
		
		request.getRequestDispatcher("recommend.jsp").forward(request, response);
		
	}

}

package com.java.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.model.dao.RestaurantDAO;
import com.java.model.vo.Location;
import com.java.model.vo.Restaurant;

/**
 * Servlet implementation class RestaurantServlet
 */
@WebServlet("/restaurant.do")
public class RestaurantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RestaurantDAO restaurantDao = new RestaurantDAO();
		
		request.setCharacterEncoding("utf-8");
		String location = (String)request.getSession().getAttribute("location");
		String theme = request.getParameter("theme");
		String place = request.getParameter("group");
		ArrayList<Restaurant> list = restaurantDao.restaurantView(location, theme, place);
		
		request.setAttribute("restList", list);
		if (place.equals("R"))
			request.getRequestDispatcher("Restaurant.jsp").forward(request, response);
		else
			request.getRequestDispatcher("Place.jsp").forward(request, response);
		
		return;
		
	}

}

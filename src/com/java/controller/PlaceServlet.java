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
@WebServlet("/Place.do")
public class PlaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RestaurantDAO restaurantDao = new RestaurantDAO();
		
		request.setCharacterEncoding("utf-8");		
		String theme = request.getParameter("theme");
		String location = request.getParameter("location");
		String place = request.getParameter("group");
		System.out.println(theme + location + place);
		ArrayList<Restaurant> list = restaurantDao.restaurantView(location, theme, place);
		
		request.setAttribute("restList", list);
		request.getRequestDispatcher("Restaurant.jsp").forward(request, response);
		System.out.println("forward");
		return;
		
	}

}

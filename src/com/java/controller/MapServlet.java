package com.java.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.model.vo.Location;

/**
 * Servlet implementation class MapServlet
 */
@WebServlet("/map.do")
public class MapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		ArrayList<Location> list = new ArrayList<Location>();
		list.add(new Location(37.5662952,126.97794509999994));
		list.add(new Location(37.5725254,126.9756429));
		list.add(new Location(37.568369,126.97779000000003));
		
		request.setAttribute("locationList", list);
		request.getRequestDispatcher("/mapmain.jsp").forward(request, response);
		System.out.println("forward");
		return;
	}
}


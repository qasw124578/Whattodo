package com.java.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.java.model.dao.CourseDAO;
import com.java.model.vo.Course;
import com.java.model.vo.Location;
import com.java.model.vo.Restaurant;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

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
		
		String icon = "", weather = "", weatherCondition = "";
		Double temperature = 0.0;
		
		// 날씨 받아오기--------------------------------------------------------------
		final String END_POINT = "http://api.openweathermap.org/data/2.5/weather?lat=37.566535&lon=126.977969&APPID=c93ab0e6ebef559a78615a5dc266a5fd";
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet(END_POINT);
		CloseableHttpResponse httpResponse = httpClient.execute(httpGet);

		BufferedReader reader = new BufferedReader(new InputStreamReader(
				httpResponse.getEntity().getContent()));

		String inputLine;
		StringBuffer sb = new StringBuffer();

		while ((inputLine = reader.readLine()) != null) {
			sb.append(inputLine);
		}
		
		reader.close();
		httpClient.close();
		
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject)jsonParser.parse(sb.toString());
			JSONArray jsonArray = (JSONArray)jsonObj.get("weather");
			
			// 날씨 정보
			// Condition 및 Icon
			JSONObject weatherMin = (JSONObject)jsonArray.get(0);
			icon = (String)weatherMin.get("icon");
			weather = (String)weatherMin.get("main");
			weatherCondition = "";
			// Temperature
			JSONObject weatherFull = (JSONObject)jsonObj.get("main");
			temperature = (Double)weatherFull.get("temp") - 273.0;
			temperature = Math.round(temperature*10)/10.0;
			
			if (icon.equals("01d") || icon.equals("01n") || icon.equals("02d") || icon.equals("02n")) {
				icon = "wi-day-sunny";
				weatherCondition = "맑음";
			} else if (icon=="03d" || icon=="03n" || icon=="04d" || icon=="04n" || icon=="11d" || icon=="11n") {
				icon = "wi-cloudy";
				weatherCondition = "구름";
			} else if (icon=="09d" || icon=="09n" || icon=="10d" || icon=="10n") {
				icon = "wi-rain";
				weatherCondition = "비";
			} else if (icon=="13d" || icon=="13n") {
				icon = "wi-snowflake-cold";
				weatherCondition = "눈";
			} else {
				icon = "wi-fog";
				weatherCondition = "안개";
			}
		
		} catch (org.json.simple.parser.ParseException e) {
			e.printStackTrace();
		}
		// 날씨 받아오기--------------------------------------------------------------
		
		String location = (String)request.getSession().getAttribute("location");
		if (location.equals("songpa"))
			location = "송파";
		else if (location.equals("mapo"))
			location = "마포";
		else
			location = "서초";
		
		// 코스 받아오기--------------------------------------------------------------
		String courseCode = courseDao.getRandomCourse(location, weatherCondition);
		Course course = courseDao.getCourseInfo(courseCode);
		Location locationInfo = courseDao.getLocation(courseCode);
		ArrayList<Restaurant> list = courseDao.getCourseDetail(courseCode);
		
		request.setAttribute("course", course);
		request.setAttribute("detailList", list);
		request.setAttribute("mapLocation", locationInfo);
		request.setAttribute("icon", icon);
		request.setAttribute("weather", weather);
		request.setAttribute("temperature", temperature);
		
		request.getRequestDispatcher("recommend.jsp").forward(request, response);
		
	}

}

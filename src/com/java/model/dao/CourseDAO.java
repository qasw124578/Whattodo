package com.java.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.java.model.vo.Course;
import com.java.model.vo.Restaurant;
import com.java.util.DBUtil;

public class CourseDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Course getCourseInfo(String courseCode) {
		String sql = "SELECT * FROM COURSE WHERE CODE = ?";
		Course course = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, courseCode);
			
			if (rs.next()) {
				course = new Course();
				course.setCode(courseCode);
				course.setName(rs.getString("name"));
				course.setContents(rs.getString("contents"));
				course.setGoo(rs.getString("goo"));
				course.setGood(rs.getInt("good"));
				course.setId(rs.getString("id"));
				course.setTheme(rs.getString("theme"));
				course.setWeather(rs.getString("weather"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return course;
		
	}
	
	public ArrayList<Restaurant> getCourseDetail(String courseCode) {
		ArrayList<Restaurant> list = new ArrayList<Restaurant>();
		
		
		String sql = "SELECT A.CODE, A.NAME, A.CONTENTS, A.ID, A.THEME, A.WEATHER, B.DETAIL_PLAN, B.DETAIL_NUM,"
			       + " C.NAME, C.THEME, C.ADDRESS, C.EXPLAIN, C.LATITUDE, C.LONGITUDE, C.GOOD, C.FILE_PATH"
			       + " FROM COURSE A JOIN CRS_DETAIL B ON(A.CODE = B.CODE) JOIN PLACE C ON(B.DETAIL_PLAN = C.CODE)"
			       + " WHERE A.CODE = ?"
			       + " ORDER BY B.DETAIL_NUM";
		
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, courseCode);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Restaurant obj = new Restaurant();
				obj.setCode(courseCode);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}
}

package com.java.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.java.model.vo.Course;
import com.java.model.vo.Location;
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
			rs = pstmt.executeQuery();

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
	
	public Location getLocation(String courseCode) {
		Location location = null;

		String sql = "SELECT C.LATITUDE, C.LONGITUDE FROM CRS_DETAIL B JOIN PLACE C ON(B.DETAIL_PLAN = C.CODE) WHERE B.CODE = ? ORDER BY B.DETAIL_NUM";
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, courseCode);
			rs = pstmt.executeQuery();
			
			double latitude, longitude;
			double crs_num = 0.0;
			if (rs.next()) {
				location = new Location(0.0, 0.0);
				latitude = 0;
				longitude = 0;
				do {
					crs_num++;
					latitude += rs.getDouble("latitude");
					longitude += rs.getDouble("longitude");
				} while (rs.next());
				
				location.setLatitude(latitude / crs_num);
				location.setLongitude(longitude / crs_num);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return location;
	}

	public ArrayList<Restaurant> getCourseDetail(String courseCode) {
		ArrayList<Restaurant> list = new ArrayList<Restaurant>();
		Restaurant obj = null;

		String sql = "SELECT B.DETAIL_PLAN, B.DETAIL_NUM, C.NAME, C.THEME, C.ADDRESS, C.EXPLAIN, C.LATITUDE, C.LONGITUDE, C.GOOD, C.FILE_PATH FROM CRS_DETAIL B JOIN PLACE C ON(B.DETAIL_PLAN = C.CODE) WHERE B.CODE = ? ORDER BY B.DETAIL_NUM";
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, courseCode);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				obj = new Restaurant();
				obj.setCode(rs.getString("detail_plan"));
				obj.setName(rs.getString("name"));
				obj.setTheme(rs.getString("theme"));
				obj.setAddress(rs.getString("address"));
				obj.setExplain(rs.getString("explain"));
				obj.setLatitude(rs.getDouble("latitude"));
				obj.setLongitude(rs.getDouble("longitude"));
				obj.setGood(rs.getInt("good"));
				obj.setFile_path(rs.getString("file_path"));

				list.add(obj);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}
}

package com.java.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.java.model.vo.Course;
import com.java.model.vo.Restaurant;
import com.java.util.DBUtil;

public class CourseDAO2 {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 0단계 :
	}

	public ArrayList<ArrayList<Restaurant>> courseView(String theme, String goo) {
		ArrayList<ArrayList<Restaurant>> list1 = new ArrayList<ArrayList<Restaurant>>();

		Connection conn = null; // 연결 변수
		PreparedStatement stmt = null; // 연결 통로 변수
		ResultSet rs = null; // 0단계 : 매개변수를 만들었다고 생각하면되
		//String sql = "select * from COURSE " + "where theme = ? and goo = ?";

		String sql1 = "SELECT * FROM COURSE";
		String sql2 = "SELECT * FROM CRS_DETAIL B JOIN PLACE C ON(B.DETAIL_PLAN = C.CODE) WHERE B.CODE = ? ORDER BY B.DETAIL_NUM";

		// while(rs.next())
		try {
			ArrayList<String> courses = new ArrayList<String>();
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql1);
			rs = stmt.executeQuery();

			// 코스 목록 받아오기
			while (rs.next()) {
				courses.add(rs.getString("code"));
			}

			for (String courseCode : courses) {
				stmt = conn.prepareStatement(sql2);
				stmt.setString(1, courseCode);
				rs = stmt.executeQuery();

				ArrayList<Restaurant> course = new ArrayList<Restaurant>();

				while (rs.next()) {
					Restaurant obj = new Restaurant();
					obj.setCode(rs.getString("detail_plan"));
					obj.setName(rs.getString("name"));
					obj.setTheme(rs.getString("theme"));
					obj.setAddress(rs.getString("address"));
					obj.setExplain(rs.getString("explain"));
					obj.setLatitude(rs.getDouble("latitude"));
					obj.setLongitude(rs.getDouble("longitude"));
					obj.setGood(rs.getInt("good"));
					obj.setFile_path(rs.getString("file_path"));

					course.add(obj);
				}
				list1.add(course);
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		/*
		 * try {
		 * 
		 * conn = DBUtil.getConnection(); stmt = conn.prepareStatement(sql); //
		 * prepared는 실행 전에 퀴리문 전달 stmt.setString(1, theme); stmt.setString(2,
		 * goo); rs = stmt.executeQuery(); //rs로 출력물의 참조값을 가리키고 있다. sql변수를 쿼리문으로
		 * 선언 / rs는 결과집합을 포인팅 할 수 있는 역할을 한다. / executeQuery() select 문이라고 생각하면 됨
		 * // preparedStatement눈 Statement의 상속을 받은 것
		 * 
		 * 
		 * } catch (SQLException e) { e.printStackTrace(); }finally{
		 * DBUtil.close(conn); DBUtil.close(stmt); DBUtil.close(rs); }
		 */
		
		return list1;
	}
	
	public ArrayList<Course> getCourseView(String theme1, String goo1) {
		ArrayList<Course> list2 = new ArrayList<Course>();
		String sql = "select * from COURSE " + "where theme = ? and goo = ?";
		Course course1 = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, theme1);
			pstmt.setString(2, goo1);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				course1 = new Course();
				course1.setCode(rs.getString("code"));
				course1.setName(rs.getString("name"));
				course1.setContents(rs.getString("contents"));
				course1.setGoo(rs.getString("goo"));
				course1.setGood(rs.getInt("good"));
				course1.setId(rs.getString("id"));
				course1.setTheme(rs.getString("theme"));
				course1.setWeather(rs.getString("weather"));
				
				list2.add(course1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list2;

	}

}

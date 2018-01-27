package com.java.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.java.model.vo.Course;
import com.java.util.DBUtil;

public class CourseDAO2 {
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//0단계 :
	}
	
	public ArrayList<Course> courseView(String theme, String goo){
		ArrayList<Course> list = new ArrayList<Course>();
		Connection conn = null; //연결 변수
		PreparedStatement stmt = null; //연결 통로 변수
		ResultSet rs = null;  //0단계 : 매개변수를 만들었다고 생각하면되
		//String param;
		
		/*String sql = "select * from COURSE "
				+ "where theme = ? and "+ "code like '" +goo+ "%'";  
		 '%?%'*/
		String sql = "select * from COURSE "
				+ "where theme = ? and goo = ?";  
		// '%?%'
		try {
			
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql); // prepared는 실행 전에 퀴리문 전달
			stmt.setString(1, theme);
			stmt.setString(2, goo);
			rs = stmt.executeQuery(); //rs로 출력물의 참조값을 가리키고 있다. sql변수를 쿼리문으로 선언 / rs는 결과집합을 포인팅 할 수 있는 역할을 한다. / executeQuery() select 문이라고 생각하면 됨
										// preparedStatement눈 Statement의 상속을 받은 것
			
			while(rs.next()) {
				Course obj = new Course();
				obj.setCode(rs.getString(1));
				obj.setName(rs.getString(2));
				obj.setContents(rs.getString(3));
				obj.setId(rs.getString(4));
				obj.setTheme(rs.getString(5));
				obj.setWeather(rs.getString(6));
				obj.setGoo(rs.getString(7));
				obj.setGood(rs.getInt(8));
				list.add(obj);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(conn);
			DBUtil.close(stmt);
			DBUtil.close(rs);
		}
		
		return list; 
	
	
	
	}

	
}

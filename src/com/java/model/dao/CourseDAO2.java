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
		}//0�ܰ� :
	}
	
	public ArrayList<Course> courseView(String theme, String goo){
		ArrayList<Course> list = new ArrayList<Course>();
		Connection conn = null; //���� ����
		PreparedStatement stmt = null; //���� ��� ����
		ResultSet rs = null;  //0�ܰ� : �Ű������� ������ٰ� �����ϸ��
		//String param;
		
		/*String sql = "select * from COURSE "
				+ "where theme = ? and "+ "code like '" +goo+ "%'";  
		 '%?%'*/
		String sql = "select * from COURSE "
				+ "where theme = ? and goo = ?";  
		// '%?%'
		try {
			
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql); // prepared�� ���� ���� ������ ����
			stmt.setString(1, theme);
			stmt.setString(2, goo);
			rs = stmt.executeQuery(); //rs�� ��¹��� �������� ����Ű�� �ִ�. sql������ ���������� ���� / rs�� ��������� ������ �� �� �ִ� ������ �Ѵ�. / executeQuery() select ���̶�� �����ϸ� ��
										// preparedStatement�� Statement�� ����� ���� ��
			
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

package com.java.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.java.model.vo.Restaurant;
import com.java.util.DBUtil;

public class RestaurantDAO {
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//0단계 :
	}
	
	public ArrayList<Restaurant> restaurantView(String location, String theme, String place){
	/*	String name = null; 
		String file_path = null;
		String explain = null;
		double latitude = 0;
		double longitude = 0;*/
		ArrayList<Restaurant> list = new ArrayList<Restaurant>();
		Connection conn = null; //연결 변수
		PreparedStatement stmt = null; //연결 통로 변수
		ResultSet rs = null;  //0단계 : 매개변수를 만들었다고 생각하면되
		String param;
		if(place.equals("식당")){
			place = "R";
		}else if(place.equals("관광지")){
			place = "P";
		}
		String sql = "select * from PLACE "
				+ "where theme = ? and address like '%" + location  + "%' and "
						+ "code like '" +place+ "%'";  
		// '%?%'
		try {
			
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql); // prepared는 실행 전에 퀴리문 전달
			stmt.setString(1, theme);
			rs = stmt.executeQuery(); //rs로 출력물의 참조값을 가리키고 있다. sql변수를 쿼리문으로 선언 / rs는 결과집합을 포인팅 할 수 있는 역할을 한다. / executeQuery() select 문이라고 생각하면 됨
										// preparedStatement눈 Statement의 상속을 받은 것
			
			while(rs.next()) {
				Restaurant obj = new Restaurant();
				obj.setCode(rs.getString(1));
				obj.setName(rs.getString(2));
				obj.setThema(rs.getString(3));
				obj.setAddress(rs.getString(4));
				obj.setExplain(rs.getString(5));
				obj.setLatitude(rs.getDouble(6));
				obj.setLongitude(rs.getDouble(7));
				obj.setGood(rs.getInt(8));
				obj.setFile_path(rs.getString(9));
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

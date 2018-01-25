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
		}//0�ܰ� :
	}
	
	public ArrayList<Restaurant> restaurantView(String location, String theme, String place){
	/*	String name = null; 
		String file_path = null;
		String explain = null;
		double latitude = 0;
		double longitude = 0;*/
		ArrayList<Restaurant> list = new ArrayList<Restaurant>();
		Connection conn = null; //���� ����
		PreparedStatement stmt = null; //���� ��� ����
		ResultSet rs = null;  //0�ܰ� : �Ű������� ������ٰ� �����ϸ��
		String param;
		if(place.equals("�Ĵ�")){
			place = "R";
		}else if(place.equals("������")){
			place = "P";
		}
		String sql = "select * from PLACE "
				+ "where theme = ? and address like '%" + location  + "%' and "
						+ "code like '" +place+ "%'";  
		// '%?%'
		try {
			
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql); // prepared�� ���� ���� ������ ����
			stmt.setString(1, theme);
			rs = stmt.executeQuery(); //rs�� ��¹��� �������� ����Ű�� �ִ�. sql������ ���������� ���� / rs�� ��������� ������ �� �� �ִ� ������ �Ѵ�. / executeQuery() select ���̶�� �����ϸ� ��
										// preparedStatement�� Statement�� ����� ���� ��
			
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

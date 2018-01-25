package com.java.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.util.DBUtil;

//DAO�� �ڵ鸵�ϰ� ���� ������ �� �� entity���� �����
public class UserDAO {
	
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//0�ܰ� :
	}
 
	public String login(String userid, String password){
		String name = null;
		Connection conn = null; //���� ����
		PreparedStatement stmt = null; //���� ��� ����
		ResultSet rs = null;  //0�ܰ� : �Ű������� ������ٰ� �����ϸ��
		String sql = "select name from EMPLOYEE "
				+ "where id = ? and password = ?"; // '%?%'
		
		try {
			
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql); // prepared�� ���� ���� ������ ����
			stmt.setString(1, userid);
			stmt.setString(2, password);
			rs = stmt.executeQuery(); //rs�� ��¹��� �������� ����Ű�� �ִ�. sql������ ���������� ���� / rs�� ��������� ������ �� �� �ִ� ������ �Ѵ�. / executeQuery() select ���̶�� �����ϸ� ��
										// preparedStatement�� Statement�� ����� ���� ��
			if(rs.next()){ //next()�� ���� �ִ� Ŀ���� ��������
				name = rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(conn);
			DBUtil.close(stmt);
			DBUtil.close(rs);
		}
		
		return name; 
	
	
	
	}
	
}

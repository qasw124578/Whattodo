package com.java.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.util.DBUtil;

//DAO는 핸들링하고 싶은 데이터 별 즉 entity별로 만들어
public class UserDAO {
	
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//0단계 :
	}
 
	public String login(String userid, String password){
		String name = null;
		Connection conn = null; //연결 변수
		PreparedStatement stmt = null; //연결 통로 변수
		ResultSet rs = null;  //0단계 : 매개변수를 만들었다고 생각하면되
		String sql = "select name from EMPLOYEE "
				+ "where id = ? and password = ?"; // '%?%'
		
		try {
			
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql); // prepared는 실행 전에 퀴리문 전달
			stmt.setString(1, userid);
			stmt.setString(2, password);
			rs = stmt.executeQuery(); //rs로 출력물의 참조값을 가리키고 있다. sql변수를 쿼리문으로 선언 / rs는 결과집합을 포인팅 할 수 있는 역할을 한다. / executeQuery() select 문이라고 생각하면 됨
										// preparedStatement눈 Statement의 상속을 받은 것
			if(rs.next()){ //next()는 현재 있는 커서를 움직여라
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

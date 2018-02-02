package com.java.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.util.DBUtil;

public class GoodDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getFlag(String code, String id) {
		String sql = "SELECT * FROM GOOD WHERE CODE = ? AND ID LIKE '%'||?||'%'";
		String insertIdToGood = "UPDATE GOOD SET ID = ID||', '||? WHERE CODE = ?";
		String updateGood = "UPDATE COURSE SET GOOD = GOOD + 1 WHERE CODE = ?";
		
		PreparedStatement pstmtUpdateGood = null;
		PreparedStatement pstmtInsertId = null;
		int result;
		
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				// 추천수 올리면서 Good Table에 ID 추가
				conn.setAutoCommit(false);
				pstmtInsertId = conn.prepareStatement(insertIdToGood);
				pstmtUpdateGood = conn.prepareStatement(updateGood);
				pstmtInsertId.setString(1, id);
				pstmtInsertId.setString(2, code);
				pstmtUpdateGood.setString(1, code);
				
				result = pstmtInsertId.executeUpdate();
				result += pstmtUpdateGood.executeUpdate();
				if (result != 2) {
					conn.rollback();
					return -1;
				}
				
				conn.commit();
				return 1;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(pstmtUpdateGood);
			DBUtil.close(pstmtInsertId);
			DBUtil.close(conn);
		}
		
		return 0;
	}
	
	public int getGoodCount(String code) {
		String sql = "SELECT GOOD FROM COURSE WHERE CODE = ?";
		int goodCount = -1;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			
			if (rs.next())
				goodCount = rs.getInt("GOOD");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return goodCount;
		
	}
	
}

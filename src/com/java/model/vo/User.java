package com.java.model.vo;

public class User {
	
	private String userID;
	private String password;
	private String name;
	
	
	public User() {
		super();
		
		// TODO Auto-generated constructor stub
	}
	
	
	
	public User(String userID, String name) {
		super();
		this.userID = userID;
		this.name = name;
	}



	/*
	public User(String userID, String password) {
		super();
		this.userID = userID;
		this.password = password;
	}
	*/
	public User(String userID, String password, String name) {
		super();
		this.userID = userID;
		this.password = password;
		this.name = name;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "User [userID=" + userID + ", password=" + password + "]";
	}
	
	
}

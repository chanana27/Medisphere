package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {
	private Connection conn;
	
	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean register(User u) {
		boolean f = false;
		
		try {
			String sql = "insert into user(fName, lName, email, password, gender, age, mobNo, zipCode) values (?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,  u.getFirstName());
			ps.setString(2,  u.getLastName());
			ps.setString(3,  u.getEmail());
			ps.setString(4,  u.getPassword());
			ps.setString(5,  u.getGender());
			ps.setInt(6,     u.getAge());
			ps.setString(7,  u.getMobNo());
			ps.setInt(8,     u.getZipCode());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User login(String em, String psw) {
		User u=null;
		
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFirstName(rs.getString(2));
				u.setLastName(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setPassword(rs.getString(5));
				u.setGender(rs.getString(6));
				u.setAge(rs.getInt(7));
				u.setMobNo(rs.getString(8));
				u.setZipCode(rs.getInt(9));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}
}

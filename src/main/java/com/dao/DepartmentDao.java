package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Department;

public class DepartmentDao {
	private Connection conn; 

	public DepartmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addDepartment(String dept) {
		boolean f = false;
		
		try {
			String sql = "INSERT INTO department(dept_name)VALUES(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,dept);
			
			int i=ps.executeUpdate();
			if(i == 1)
				f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Department> getAllDepartment(){
		List<Department> list = new ArrayList<Department>();
		Department d = null;
		
		try {
			String sql = "SELECT * FROM department";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				d = new Department();
				d.setId(rs.getInt(1));
				d.setDepartmentName(rs.getString(2));
				list.add(d);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	
}

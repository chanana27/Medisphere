package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDao {
	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean registerDoctor(Doctor d) {
		boolean f = false;
		
		try {
			String sql = "INSERT INTO doctor(fName, lName, email, password, gender, joiningDate,qualification, department, dob, mobNo, bloodGroup, image) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, d.getFirstName());
			ps.setString(2, d.getLastName());
			ps.setString(3, d.getEmail());
			ps.setString(4, d.getPassword());
			ps.setString(5, d.getGender());
			ps.setString(6, d.getJoiningDate());
			ps.setString(7, d.getQualification());
			ps.setString(8, d.getDepartment());
			ps.setString(9, d.getDob());
			ps.setString(10, d.getMobNo());
			ps.setString(11, d.getBloodGroup());
			ps.setString(12, d.getImage());
			
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Doctor> getAllDoctors() {
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d = null;

		try {

			String sql = "SELECT * FROM doctor ORDER BY id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFirstName(rs.getString(2));
				d.setLastName(rs.getString(3));
				d.setEmail(rs.getString(4));
				d.setGender(rs.getString(6));
				d.setJoiningDate(rs.getString(7));
				d.setQualification(rs.getString(8));
				d.setDepartment(rs.getString(9));
				d.setDob(rs.getString(10));
				d.setMobNo(rs.getString(11));
				d.setImage(rs.getString(13));
				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public Doctor getDoctorById(int id) {
		Doctor d = null;

		try {

			String sql = "SELECT * FROM doctor WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFirstName(rs.getString(2));
				d.setLastName(rs.getString(3));
				d.setEmail(rs.getString(4));
				d.setPassword(rs.getString(5));
				d.setGender(rs.getString(6));
				d.setJoiningDate(rs.getString(7));
				d.setQualification(rs.getString(8));
				d.setDepartment(rs.getString(9));
				d.setDob(rs.getString(10));
				d.setMobNo(rs.getString(11));
				d.setBloodGroup(rs.getString(12));
				d.setImage(rs.getString(13));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}
	
	public boolean updateDoctor(Doctor d) {
		boolean f = false;

		try {
			String sql = "UPDATE doctor SET fName=?, lName=?, email=?, password=?, gender=?, joiningDate=?, qualification=?, department=?, dob=?, mobNo=?, bloodGroup=? WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, d.getFirstName());
			ps.setString(2, d.getLastName());
			ps.setString(3, d.getEmail());
			ps.setString(4, d.getPassword());
			ps.setString(5, d.getGender());
			ps.setString(6, d.getJoiningDate());
			ps.setString(7, d.getQualification());
			ps.setString(8, d.getDepartment());
			ps.setString(9, d.getDob());
			ps.setString(10, d.getMobNo());
			ps.setString(11, d.getBloodGroup());
			ps.setInt(12, d.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean deleteDoctor(int id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM doctor WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public Doctor login(String email, String psw) {
		Doctor d = null;
		
		try {
			String sql = "SELECT * FROM doctor WHERE email=? AND password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, psw);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFirstName(rs.getString(2));
				d.setLastName(rs.getString(3));
				d.setEmail(rs.getString(4));
				d.setPassword(rs.getString(5));
				d.setGender(rs.getString(6));
				d.setJoiningDate(rs.getString(7));
				d.setQualification(rs.getString(8));
				d.setDepartment(rs.getString(9));
				d.setDob(rs.getString(10));
				d.setMobNo(rs.getString(11));
				d.setBloodGroup(rs.getString(12));
				d.setImage(rs.getString(13));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return d;
	
	}
	
}

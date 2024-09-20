package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Appointment;

public class AppointmentDao {
	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addAppointment(Appointment ap) {
		boolean f = false;
		
		try {
			String sql = "insert into appointment(userId, doctorId, fullName, age, email, appointmentDate, timeSlot, detail, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, ap.getId());
            ps.setInt(2, ap.getDoctorId());
            ps.setString(3, ap.getFullName());
            ps.setInt(4, ap.getAge());
            ps.setString(5, ap.getEmail());
            ps.setString(6, ap.getAppointmentDate());
            ps.setString(7, ap.getTimeSlot());
            ps.setString(8, ap.getDetail());
            ps.setString(9, ap.getStatus());
            
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f=true;				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}

package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TimeSlotDao {
	private Connection conn;

	public TimeSlotDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public List<String> getAvailableTimeSlots(int doctorId, String appointmentDate) throws SQLException {
        List<String> availableSlots = new ArrayList<>(List.of(
            "10:00-11:00", "11:00-12:00", "12:00-01:00", "01:00-02:00",
            "04:00-05:00", "05:00-06:00", "06:00-07:00", "07:00-08:00"
        ));
        String sql = "SELECT timeslot FROM timeslot WHERE doctorId = ? AND appointmentDate = ? AND isAvailable = 'FALSE'";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, doctorId);
            stmt.setString(2, appointmentDate);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    availableSlots.remove(rs.getString("timeslot"));
                }
            }
        }
        return availableSlots;
	}   
}

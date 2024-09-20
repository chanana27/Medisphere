package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnect;

@WebServlet("/addAppointment")
public class AddAppointment extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Retrieve form data
	    int userId = Integer.parseInt(request.getParameter("userid"));
	    int doctorId = Integer.parseInt(request.getParameter("doctorId"));
	    String fullName = request.getParameter("fullname");
	    int age = Integer.parseInt(request.getParameter("age"));
	    String email = request.getParameter("email");
	    String appointmentDate = request.getParameter("appointmentDate");
	    String timeSlot = request.getParameter("timeSlot");
	    String detail = request.getParameter("detail");

	    // Database connection
	    Connection conn = DBConnect.getConn();
	    
	    try {
	        // Start transaction
	        conn.setAutoCommit(false);
	        
	        // Insert into appointment table
	        String insertAppointmentSQL = "INSERT INTO appointment (userId, doctorId, fullName, age, email, appointmentDate, timeSlot, detail, status) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
	        try (PreparedStatement ps = conn.prepareStatement(insertAppointmentSQL)) {
	            ps.setInt(1, userId);
	            ps.setInt(2, doctorId);
	            ps.setString(3, fullName);
	            ps.setInt(4, age);
	            ps.setString(5, email);
	            ps.setString(6, appointmentDate);
	            ps.setString(7, timeSlot);
	            ps.setString(8, detail);
	            ps.setString(9, "pending");
	            ps.executeUpdate();
	        }
	        
	        // Check if the time slot entry exists
	        String checkTimeslotSQL = "SELECT * FROM timeslot WHERE doctorId = ? AND appointmentDate = ? AND timeslot = ?";
	        boolean slotExists = false;
	        try (PreparedStatement ps = conn.prepareStatement(checkTimeslotSQL)) {
	            ps.setInt(1, doctorId);
	            ps.setString(2, appointmentDate);
	            ps.setString(3, timeSlot);
	            try (ResultSet rs = ps.executeQuery()) {
	                slotExists = rs.next();
	            }
	        }

	        // Insert or update timeslot table
	        if (slotExists) {
	            // Update existing entry to mark as unavailable
	            String updateTimeslotSQL = "UPDATE timeslot SET isAvailable = 'false' WHERE doctorId = ? AND appointmentDate = ? AND timeslot = ?";
	            try (PreparedStatement ps = conn.prepareStatement(updateTimeslotSQL)) {
	                ps.setInt(1, doctorId);
	                ps.setString(2, appointmentDate);
	                ps.setString(3, timeSlot);
	                ps.executeUpdate();
	            }
	        } else {
	            // Insert new timeslot entry
	            String insertTimeslotSQL = "INSERT INTO timeslot (doctorId, appointmentDate, timeslot, isAvailable) VALUES (?, ?, ?, 'false')";
	            try (PreparedStatement ps = conn.prepareStatement(insertTimeslotSQL)) {
	                ps.setInt(1, doctorId);
	                ps.setString(2, appointmentDate);
	                ps.setString(3, timeSlot);
	                ps.executeUpdate();
	            }
	        }
	        
	        // Commit transaction
	        conn.commit();
	        response.sendRedirect("viewAppointments.jsp");
	    } catch (SQLException e) {
	        // Rollback transaction in case of error
	        try {
	            conn.rollback();
	        } catch (SQLException rollbackEx) {
	            rollbackEx.printStackTrace();
	        }
	        e.printStackTrace();
	        response.sendRedirect("bookAppointment.jsp");
	    } finally {
	        try {
	            conn.setAutoCommit(true);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

}

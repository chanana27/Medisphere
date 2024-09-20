package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TimeSlotDao;
import com.db.DBConnect;

@WebServlet("/checkAvailability")
public class CheckAvailabilityServlet extends HttpServlet {
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        String appointmentDate = request.getParameter("appointmentDate");
        String fullname = request.getParameter("fullname");
        String doctorName = request.getParameter("doctorName");
        String email = request.getParameter("email");
        String age = request.getParameter("age");

        try (Connection conn = DBConnect.getConn()) {
            TimeSlotDao timeSlotDao = new TimeSlotDao(conn);
            List<String> availableSlots = timeSlotDao.getAvailableTimeSlots(doctorId, appointmentDate);

            // Set available time slots in the request
            request.setAttribute("doctorId", doctorId);
            request.setAttribute("appointmentDate", appointmentDate);
            request.setAttribute("fullname", fullname);
            request.setAttribute("email", email);
            request.setAttribute("age", age);
            request.setAttribute("doctorName", doctorName);
            request.setAttribute("availableSlots", availableSlots);

            // Forward to JSP for displaying the available time slots
            RequestDispatcher dispatcher = request.getRequestDispatcher("bookAppointment.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL Exception
        }
    }
}

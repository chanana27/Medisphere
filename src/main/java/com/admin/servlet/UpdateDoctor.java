package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id")); 
		
		String firstName = req.getParameter("fName");
		String lastName = req.getParameter("lName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String gender = req.getParameter("gender");
		String joiningDate = req.getParameter("joiningDate");
		String qualification = req.getParameter("qualification");
		String department = req.getParameter("dept");
		String dob = req.getParameter("dob");
		String mobNo = req.getParameter("mobNo");
		String bloodGroup = req.getParameter("bloodGroup");
		
		
		Doctor d = new Doctor(id, firstName, lastName, email, password, gender, joiningDate, qualification, department, dob, mobNo, bloodGroup);
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		
		HttpSession session = req.getSession();
		
		if (dao.updateDoctor(d)) {
			session.setAttribute("succMsg", "Doctor Updated Successfully");
			resp.sendRedirect("admin/view_doctor.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
		
	}

}

package com.admin.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@MultipartConfig
@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String firstName = req.getParameter("fName");
		firstName = "Dr."+firstName;
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
		
		Part file = req.getPart("docPhoto");
		
		String imageFileName = file.getSubmittedFileName();
		
		String uploadPath = "B:/Coding/JSP, Servlet, Jdbc Project/Hospital_Management_System_3/src/main/webapp/assests/Doctor/" + imageFileName;
		
		try {
			
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = file.getInputStream();
			
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		Doctor d = new Doctor(firstName, lastName, email, password, gender, joiningDate, qualification, department, dob, mobNo, bloodGroup, imageFileName);
		
		HttpSession session = req.getSession();
		if(dao.registerDoctor(d)) {
			session.setAttribute("succMsg", "Doctor Added Successfully");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
		else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/doctor.jsp");
		}
	}
	
}

package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;
import com.dao.DepartmentDao;

@WebServlet("/addDepartment")
public class AddDepartment extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String deptName = req.getParameter("deptName");
		
		DepartmentDao dao = new DepartmentDao(DBConnect.getConn());
		boolean f = dao.addDepartment(deptName);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Department Added");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/index.jsp");
		}
	}
}

package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/userRegister")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String firstName = req.getParameter("fName");
		String lastName = req.getParameter("lName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String gender = req.getParameter("gender");
		int age = Integer.parseInt(req.getParameter("age"));
		String mobNo = req.getParameter("mobNo");
		int zipCode = Integer.parseInt(req.getParameter("zipCode"));

		User u = new User(firstName, lastName, email, password, gender, age, mobNo, zipCode);
		UserDao dao = new UserDao(DBConnect.getConn());

		HttpSession session = req.getSession();

		try {
			boolean f = dao.register(u);

			if (f) {
				session.setAttribute("sucMsg", "Registered Successfully. Log In Now!");
				resp.sendRedirect("patientSignupLogin.jsp");
			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("patientSignupLogin.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

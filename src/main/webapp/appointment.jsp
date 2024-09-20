<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointment</title>
</head>
<body>

	<c:if test="${empty userObj}">
		<c:redirect url="patientSignupLogin.jsp"></c:redirect>
	</c:if>
	<%@ include file="./component/nav-bar.jsp"%>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
	Doctor d = dao2.getDoctorById(id);
	%>


	<div class="col-md-6">
		<div class="card paint-card">
			<div class="card-body">
				<p class="text-center fs-3">User Appointment</p>
				<c:if test="${not empty errorMsg}">
					<p class="fs-4 text-center text-danger">${errorMsg}</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>
				<c:if test="${not empty succMsg}">
					<p class="fs-4 text-center text-success">${succMsg}</p>
					<c:remove var="succMsg" scope="session" />
				</c:if>
				
				<form id="initialForm" class="row g-3" action="checkAvailability"
					method="post">
					<input type="hidden" name="userid" value="${userObj.id}">
					<input type="hidden" name="doctorId" value="<%=d.getId()%>">
					<div class="col-md-6">
						<label for="inputEmail4" class="form-label">Full Name</label> <input
							required type="text" class="form-control" name="fullname">
					</div>

					<div class="col-md-6">
						<label for="doctorName" class="form-label">Doctor</label> <input
							required type="text" class="form-control" name="doctorName"
							value="<%=d.getFirstName()%> <%=d.getLastName()%>" readonly>
					</div>

					<div class="col-md-6">
						<label for="inputAge" class="form-label">Age</label> <input
							required type="number" class="form-control" name="age">
					</div>

					<div class="col-md-6">
						<label for="inputEmail" class="form-label">Email</label> <input
							required type="email" class="form-control" name="email">
					</div>

					<div class="col-md-6">
						<label for="appointmentDate" class="form-label">Appointment
							Date</label> <input required type="date" class="form-control"
							id="appointmentDate" name="appointmentDate">
					</div>

					<div class="col-md-12 text-center">
						<button type="submit" class="btn btn-primary">Check
							Availability</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const today = new Date();
			const tomorrow = new Date(today);
			tomorrow.setDate(today.getDate() + 1);

			const sixMonthsFromToday = new Date(today);
			sixMonthsFromToday.setMonth(today.getMonth() + 6);

			const minDate = tomorrow.toISOString().split('T')[0];
			const maxDate = sixMonthsFromToday.toISOString().split('T')[0];

			document.getElementById('appointmentDate').setAttribute('min',
					minDate);
			document.getElementById('appointmentDate').setAttribute('max',
					maxDate);
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DepartmentDao"%>
<%@page import="com.entity.Department"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Doctor</title>
<%@ include file="../component/allBootCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-success fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="../addDoctor" method="post" enctype="multipart/form-data" >
							<div class="mb-3">
								<label class="form-label">First Name</label> <input type="text"
									required name="fName" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Last Name</label> <input type="text"
									required name="lName" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" required name="password" class="form-control">
							</div>

							<div class="mb-3">
								<label for="gender" class="form-label">Gender</label> <select
									class="form-select" id="gender" name="gender" required>
									<option value="" disabled selected>Select gender</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
									<option value="other">Other</option>
								</select>
							</div>

							<div class="mb-3">
								<label for="joiningDate" class="form-label">Joining Date</label>
								<input type="date" class="form-control" id="joiningDate"
									name="joiningDate" required>
							</div>
							
							<div class="mb-3">
								<label for="qualification" class="form-label">Qualification</label>
								<input type="text" class="form-control" id="qualification"
									name="qualification" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Department</label> <select name="dept"
									required class="form-control">
									<option>--select--</option>

									<%
									DepartmentDao dao = new DepartmentDao(DBConnect.getConn());
									List<Department> list = dao.getAllDepartment();
									for (Department d : list) {
									%>
									<option><%=d.getDepartmentName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label for="dob">Date of Birth:</label> <input type="date"
									id="dob" name="dob" required class="form-control">
							</div>

							<div class="mb-3">
								<label for="mobNo" class="form-label">Mobile Number</label> <input
									type="text" id="mobNo" name="mobNo" class="form-control"
									required pattern="\d{10}"
									title="Please enter exactly 10 digits">
								<div class="form-text">Enter exactly 10 digits.</div>
							</div>

							<div class="mb-3">
								<label for="bloodGroup" class="form-label">Blood Group</label> <select
									class="form-select" id="bloodGroup" name="bloodGroup" required>
									<option value="" disabled selected>Select blood group</option>
									<option value="A+">A+</option>
									<option value="A-">A-</option>
									<option value="B+">B+</option>
									<option value="B-">B-</option>
									<option value="AB+">AB+</option>
									<option value="AB-">AB-</option>
									<option value="O+">O+</option>
									<option value="O-">O-</option>
								</select>
							</div>

							<div class="mb-3">
								<label for="image" class="form-label">Upload Photo</label><input
									type="file" id="image" name="docPhoto"
									class="form-control required">
							</div>


							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script>
		var today = new Date();
		var minAge = 23;
		var minDate = new Date(today.getFullYear() - minAge, today.getMonth(),
				today.getDate());
		var minDateString = minDate.toISOString().split("T")[0];
		document.getElementById("dob").setAttribute("max", minDateString);

		var todayDateString = today.toISOString().split("T")[0];
		document.getElementById("joiningDate").setAttribute("max",
				todayDateString);
	</script>
</body>
</html>

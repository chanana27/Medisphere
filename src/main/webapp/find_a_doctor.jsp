<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Department"%>
<%@page import="com.dao.DepartmentDao"%>
<%@ page import="java.util.List"%>
<%@ page import="com.db.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find A Doctor</title>
<%@ include file="../component/allBootCss.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="./component/nav-bar.jsp"%>



	 <form id="filterForm" style="margin-top: 200px;">
		<select id="departmentSelect" class="form-select w-auto ms-5 " aria-label="Select Department" style="display: inline-block;">
		
			<option value="">Select Department</option>
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
	</form> 


	<div class="row row-cols-3 row-cols-md-2 g-4" style="margin: 100px" id="doctorContainer"> 

		<%
		DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
		List<Doctor> list2 = dao2.getAllDoctors();

		for (Doctor d : list2) {
		%>
		<div class="col-md-4 col-sm-6 doctor-card" data-department="<%=d.getDepartment()%>">
			<div class="card" style="border: none">
				<img src="./assests/Doctor/<%=d.getImage()%>"
					style="max-height: 270px; max-width: 270px"
					class="card-img-top mx-auto" alt="...">
				<%
				System.out.println(d.getImage());
				%>
				<div class="card-body text-center">
					<h3 class="card-title"><%=d.getFirstName() + " " + d.getLastName()%></h3>
					<h6 class="card-text">
						(<%=d.getQualification()%>)
					</h6>
					<p class="card-text"><%=d.getDepartment()%></p>
					<a href="appointment.jsp?id=<%=d.getId() %>" class="btn btn-primary">BOOK AN APPOINTMENT</a>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>

	<script>
        $(document).ready(function() {
            console.log("Document is ready");

            $('#departmentSelect').change(function() {
                console.log("Department selected");
                var selectedDepartment = $(this).val().toLowerCase();
                console.log("Selected department: " + selectedDepartment);

                $('.doctor-card').each(function() {
                    var doctorDepartment = $(this).data('department').toLowerCase();
                    console.log("Doctor department: " + doctorDepartment);

                    if (selectedDepartment === "" || doctorDepartment === selectedDepartment) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });

                if ($('.doctor-card:visible').length === 0) {
                    if ($('#noResults').length === 0) {
                        $('#doctorContainer').append('<p id="noResults">No results found</p>');
                    }
                } else {
                    $('#noResults').remove();
                }
            });
        });
        
    </script>

</body>
</html>
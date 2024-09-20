<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
        .cursor-pointer {
            cursor: pointer;
        }
        .paint-card {
			box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
		}
</style>

<%@ include file="../component/allBootCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	<div class="container p-5">
		<p class="text-center fs-3">Administrator Dashboard</p>

		<c:if test="${not empty succMsg }">
			<p class="text-center text-success fs-3">${succMsg}</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not empty errorMsg }">
			<p class="text-center text-danger fs-3">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<%-- <%
		CountDao c = new CountDao(DBConnect.getConn());
		%> --%>
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card cursor-pointer">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							<%-- Doctor <br><%=c.countDoctor() %> --%>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card cursor-pointer">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							<%-- User <br><%=c.countUser() %> --%>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card cursor-pointer">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							<%-- Total Appointment <br><%=c.countAppointment() %> --%>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-2">
				<div class="card paint-card cursor-pointer" data-bs-toggle="modal" 
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							<%-- Specialist <br><%= c.countSpecialist() %> --%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center" id="exampleModalLabel">Department</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addDepartment" method="post">
						<div class="form-group">
							<label>Enter Department Name</label>
							<input type="text" name="deptName" class="form-control" placeholder="Ex: Radiologists...">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
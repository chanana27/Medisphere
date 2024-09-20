<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
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
	
	<div class="col-md-6">
        <div class="card paint-card">
            <div class="card-body">
                <p class="text-center fs-3">Book Appointment</p>

                <form class="row g-3" action="addAppointment" method="post">
                    <input type="hidden" name="userid" value="${userObj.id}">
                    <input type="hidden" name="doctorId" value="${doctorId}">
                    
                    <!-- Display previously filled details -->
                    <div class="col-md-6">
                        <label for="doctorName" class="form-label">Doctor</label>
                        <input type="text" class="form-control" name="doctorName" value="${doctorName}" readonly>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="inputFullName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" name="fullname" value="${fullname}" readonly>
                    </div>

                    <div class="col-md-6">
                        <label for="inputAge" class="form-label">Age</label>
                        <input type="number" class="form-control" name="age" value="${age}" readonly>
                    </div>

                    <div class="col-md-6">
                        <label for="inputEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" value="${email}" readonly>
                    </div>

                    <div class="col-md-6">
                        <label for="appointmentDate" class="form-label">Appointment Date</label>
                        <input type="date" class="form-control" id="appointmentDate" name="appointmentDate" value="${appointmentDate}" readonly>
                    </div>

                    <div class="col-md-6">
                        <label for="timeSlot" class="form-label">Time Slot</label>
                        <select required id="timeSlot" name="timeSlot" class="form-control">
                            <option value="">Select Time Slot</option>
                            <c:forEach var="slot" items="${availableSlots}">
                                <option value="${slot}">${slot}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-12">
                        <label>Detail</label>
                        <textarea required name="detail" class="form-control" rows="3"></textarea>
                    </div>

                    <div class="col-md-12 text-center">
                        <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign/Login</title>
<%@ include file="./component/allCss.jsp"%>
</head>
<body>
	<%@ include file="./component/nav-bar.jsp"%>

	<div class="container p-4 ">
		<div class="row g-4">

			<div class="col-md-6 " style="margin-top: 150px">
				<div class="card paint-card">
					<p class="text-center fs-3">Sign Up</p>
					<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-3">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<div class="card-body">
						<form action="userRegister" method="post">
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
								<label class="form-label">Password</label> <input type="text"
									required name="password" class="form-control" >
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
								<label class="form-label">Age</label> <input type="text"
									required name="age" class="form-control">
							</div>

							<div class="mb-3">
								<label for="mobNo" class="form-label">Mobile Number</label> <input
									type="text" id="mobNo" name="mobNo" class="form-control"
									required pattern="\d{10}"
									title="Please enter exactly 10 digits">
								<div class="form-text">Enter exactly 10 digits.</div>
							</div>


							<div class="mb-3">
								<label class="form-label">ZipCode</label> <input type="text"
									required name="zipCode" class="form-control" >
							</div>


							
							<button type="submit" class="btn btn-primary">Sign Up</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-4 " style="margin-top: 150px">

				<div class="card paint-card">
					<p class="text-center fs-3">Log In</p>
					

					<c:if test="${not empty errorMsgLogin }">
						<p class="text-center text-danger fs-3">${errorMsgLogin}</p>
						<c:remove var="errorMsgLogin" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="userLogin" method="post">
							<div class="mb-3">
								<label></label> <input type="text"
									name="email" class="form-control" required placeholder="email">
							</div>
							<div class="mb-3">
								<label></label> <input type="text"
									name="password" class="form-control" required placeholder="password">
							</div>
							
							<button class="btn btn-success col-md-12">Log In
								</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
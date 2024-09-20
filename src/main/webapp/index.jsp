<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MediSphere</title>
<link rel="stylesheet" href="Css/index.css" type="text/css">
<%@ include file="./component/allBootCss.jsp"%>	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@200..700&display=swap"
	rel="stylesheet">
<style>
.carousel-button {
	position: absolute;
	bottom: 100px;
	left: 100px;
	z-index: 2;
}

.carousel-button a+a {
	margin-left: 20px; /* Spacing between buttons */
}
</style>

</head>
<body>
	
		<%@ include file="./component/nav-bar.jsp"%>
	

	<!-- SLIDER -->
	<div id="carouselExampleIndicators" class="carousel slide "
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active position-relative">
				<img src="./assests/Banner-1.png" class="d-block w-100 h-[600px]"
					alt="... ">
				<div class="carousel-button">
					<a href="find_a_doctor.jsp" class="custom-btn-1">CONNECT WITH
						DOCTOR</a> <a href="#" class="custom-btn-2">SCHEDULE APPOINTMENT</a>
				</div>
			</div>
			<div class="carousel-item position-relative">
				<img src="./assests/Banner-2.png" class="d-block w-100 h-[600px]"
					alt="... ">
				<div class="carousel-button">
					<a href="#" class="custom-btn-1">CONNECT WITH DOCTOR</a> <a
						href="#" class=" custom-btn-2">SCHEDULE APPOINTMENT</a>
				</div>
			</div>
			<div class="carousel-item position-relative">
				<img src="./assests/Banner-3.png" class="d-block w-100 h-[600px]"
					alt="... ">
				<div class="carousel-button">
					<a href="#" class="custom-btn-1">CONNECT WITH DOCTOR</a> <a
						href="#" class="custom-btn-2">SCHEDULE APPOINTMENT</a>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<!-- Welcome & Our Vision & Mission Section -->

	<div class="welcome-sec">
		<div class="inner-container">
			<div class="row">
				<div class="col-md-6">
					<div class="welcome-play ">
						<img alt="" class="img-fluid" height="385"
							src="./assests/Logo.png" width=670>
					</div>
				</div>
				<div class="col-md-6 welcome-text">
					<h2 class="sec-hd">Welcome To MediSphere</h2>
					<p class="pb-2">We learn, we grow, we innovate, and create to
						make this world a better place for all of us! With
						9&nbsp;multispeciality Hospitals spread across Punjab and Haryana,
						a dedicated Dental Implantology, Ophthalmology, and Cosmetic
						Dermatology Clinic, and a state-of-the-art Diagnostic and
						Laboratory center. We understand the importance of credible
						Healthcare and delivering it.</p>
					<h3 class="my-lg-3 my-2 oswald-text font-lg black-text">Our
						Vision</h3>
					<p>To be a leading and trusted source of healthcare.</p>
					<h3 class="my-lg-3 my-2 oswald-text font-lg black-text">Our
						Mission</h3>
					<p>To provide Comprehensive, Competent, Cost effective
						environmental friendly care to all through Clinical Practice,
						Research and Education.</p>

				</div>
			</div>
		</div>
	</div>

	<!-- Login For doctor and Admin -->
	﻿

	<div class="welcome-sec common-pd pb-0"></div>
	<div class="common-pd">
		<div class="inner-container">
			<div class="row">
				<div class="col-lg-4 custom-col-3 col-md-12">
					<div class="quick-access">
						<h2 class="sec-hd">Quick and Easy Access</h2>
						<p>Login to dedicated portals for our Doctors and
							Administrator.</p>
					</div>
				</div>
				<div class="col-lg-4 custom-col-4 col-md-6">
					<div class="access-box">
						<div class="access-img">
							<img alt="Patient Image" height="244"
								src="./assests/For-Doctor.png" width="164">
						</div>
						<div class="access-text">
							<h2 class="sec-hd">For Doctors</h2>
							<p>Check your appointments and details here.</p>
							<button type="button" class="theme-btn" data-bs-toggle="modal"
								data-bs-target="#doctorLoginModal">DOCTOR LOGIN</button>
						</div>
					</div>
				</div>

				<!-- Doctor Login Modal -->

				<div class="modal fade" id="doctorLoginModal" tabindex="-1"
					aria-labelledby="doctorLoginModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="doctorLoginModalLabel">Doctor
									Login</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<c:if test="${not empty errorMsg}">
									<p class="text-center text-danger fs-3">${errorMsg}</p>
									<c:remove var="errorMsg" scope="session" />
								</c:if>
								<form id="doctorLoginForm" action="doctorLogin" method="post">
									<div class="form-group">
										<label for="doctorEmail">Email address</label> <input
											type="email" class="form-control" id="doctorEmail"
											name="email" placeholder="Enter email" required>
									</div>
									<div class="form-group">
										<label for="doctorPassword">Password</label> <input
											type="password" class="form-control" id="doctorPassword"
											name="password" placeholder="Password" required>
									</div>
									<button type="submit" class="btn btn-primary mt-3">Login</button>
								</form>
							</div>

						</div>
					</div>
				</div>

				<div class="col-lg-4 custom-col-4 col-md-6">
					<div class="access-box">
						<div class="access-img">
							<img alt="Patient Image" height="244"
								src="./assests/For-Doctor.png" width="164">
						</div>
						<div class="access-text">
							<h2 class="sec-hd">For Administrator</h2>
							<p>Access for Administrator to control workflow &
								information.</p>
							<button type="button" class="theme-btn" data-bs-toggle="modal"
								data-bs-target="#adminLoginModal">ADMINISTRATOR LOGIN</button>
						</div>
					</div>
				</div>

				<!-- Admin Login Modal -->
				<div class="modal fade" id="adminLoginModal" tabindex="-1"
					aria-labelledby="adminLoginModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="adminLoginModalLabel">Admin
									Login</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<c:if test="${not empty errorMsg}">
									<p class="text-center text-danger fs-3">${errorMsg}</p>
									<c:remove var="errorMsg" scope="session" />
								</c:if>
								<form id="adminLoginForm" action="adminLogin" method="post">
									<div class="form-group">
										<label for="adminEmail">Email address</label> <input
											type="email" class="form-control" id="adminEmail"
											placeholder="Enter email" name="email" required>
									</div>
									<div class="form-group">
										<label for="adminPassword">Password</label> <input
											type="password" class="form-control" id="adminPassword"
											placeholder="Password" name="password" required>
									</div>
									<button type="submit" class="btn btn-primary mt-3">Login</button>
								</form>
							</div>

						</div>
					</div>
				</div>


			</div>
		</div>
	</div>




	<!-- Second Opinion Section -->
	<br>
	<div class="grey-bg st-current">
		<div class="row no-gutters align-items-center">
			<div class="col-md-6">
				<div class="opinion-sec">
					<h2 class="sec-hd">Second Opinion</h2>

					<p>Taking a second opinion has never been this easy. Now you
						can take a second opinion from a medical expert from the
						convenience of your home. We have a wide range of specialists
						available for taking medical second opinions. So, to avoid
						misdiagnosis and furthering treatment all you need to do is upload
						your old records and make an appointment for a second opinion with
						one of our experts.</p>
					<a class="theme-btn theme-orange-btn mt-xl-5 mt-md-3 mt-2" href="#"
						title="Get Started">Get Started</a>
				</div>
			</div>

			<div class="col-md-6">
				<img alt="second opinion background image" class="img-fluid"
					height="393" src="./assests/Second-Opinion.png" width="830">
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			var urlParams = new URLSearchParams(window.location.search);
			if (urlParams.has('doctorLoginError')) {
				$('#doctorLoginModal').modal('show');
			}
		});
		$(document).ready(function() {
			var urlParams = new URLSearchParams(window.location.search);
			if (urlParams.has('adminLoginError')) {
				$('#adminLoginModal').modal('show');
			}
		});
	</script>
</body>
</html>
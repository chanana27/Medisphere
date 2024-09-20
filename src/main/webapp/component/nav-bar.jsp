<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediSphere</title>
    <%@ include file="./allBootCss.jsp"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/kMVqWfYb6xbl+6S2S+bY7c4e45L+6dE0zyS3iw4NUpOFNs69zjF0XNWPW/b6Dh1cW3T5G4w9KrXMg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .custom-navbar {
            background-color: #0e4095;
        }
        .custom-navbar .nav-link {
            color: white;
        }
        .custom-navbar .nav-link:hover {
            color: #ffcc00; /* Change to your desired hover color */
        }
        .custom-navbar .dropdown-menu {
            background-color: #0e4095;
        }
        .custom-navbar .dropdown-item {
            color: white;
        }
        .custom-navbar .dropdown-item:hover {
            color: #ffcc00; /* Change to your desired hover color */
            background-color: transparent;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="index.jsp">
                <i class="fa-solid fa-hospital"></i> MediSphere
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <c:if test="${empty userObj}">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="find_a_doctor.jsp"> BOOK AN APPOINTMENT</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="patientSignupLogin.jsp">PATIENT SIGNIN/LOGIN</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="find_a_doctor.jsp">FIND A DOCTOR</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">CONTACT US</a></li>
                    </c:if>
                    <c:if test="${not empty userObj}">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="find_a_doctor.jsp">FIND A DOCTOR</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="view_appointment.jsp">YOUR APPOINTMENTS</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="view_appointment.jsp">SECOND OPINION</a></li>
                        <div class="dropdown">
                            <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-solid fa-circle-user"></i> ${userObj.firstName} ${userObj.lastName }
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
                                <li><a class="dropdown-item" href="userLogout">Logout</a></li>
                            </ul>
                        </div>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

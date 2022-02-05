<%@page import="in.co.rays.project_3.controller.LoginCtl"%>
<%@page import="in.co.rays.project_3.dto.UserDTO"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>




<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrp library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- fontawesome Library -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">


<!-- tooltip example  -->
<script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});
</script>






<title>Bootstrap 4 DatePicker</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

	<%
		UserDTO userBean = (UserDTO) session.getAttribute("user");

		boolean userLoggedIn = userBean != null;

		String welcomeMsg = "Hi,";

		if (userLoggedIn) {
			String role = (String) session.getAttribute("role");
			welcomeMsg += userBean.getFirstName() + " (" + role + ")";
		} else {
			welcomeMsg += "Guest";
		}
	%>




	<nav class="navbar navbar-expand-md bg-dark navbar-dark"> <a
		href="<%=ORSView.WELCOME_CTL%>" title="Welcome" data-toggle="tooltip" data-placement="right"><img
		class="btn btn-secondary my-2 my-sm-0 my-2 my-lg-0"
		src="<%=ORSView.APP_CONTEXT%>/img/custom.png" align="right"
		width="120px" height="50px"></a> <!-- <i class="fa fa-home fa-3x" style=" color: green" ></i> -->



	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav ml-auto">

    <%
        if (userLoggedIn) {
    %>


			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn bg-dark dropdown-toggle"
						data-toggle="dropdown">User</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.USER_CTL%>"><i
							class="fas fa-user-plus"></i>Add User</a> <a class="dropdown-item"
							href="<%=ORSView.USER_LIST_CTL%>"><i class="fas fa-users"></i>User
							List</a>
					</div>
				</div>
			</li>




			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn bg-dark dropdown-toggle"
						data-toggle="dropdown">Role</button>
					
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>"><i
							class="fas fa-user-tag"></i>Add Role</a> <a class="dropdown-item"
							href="<%=ORSView.ROLE_LIST_CTL%>"><i
							class="fas fa-user-friends"></i>Role List</a>
					</div>
				</div>
			</li>




			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn bg-dark dropdown-toggle"
						data-toggle="dropdown">Student</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>"><i
							class="fas fa-user-graduate"></i>Add Student</a> <a
							class="dropdown-item" href="<%=ORSView.STUDENT_LIST_CTL%>"><i
							class="fas fa-users"></i>Student List</a>
					</div>
				</div>
			</li>



			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn bg-dark dropdown-toggle"
						data-toggle="dropdown">Faculty</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.FACULTY_CTL%>"><i
							class="fas fa-user-tie"></i>Add Faculty</a> <a class="dropdown-item"
							href="<%=ORSView.FACULTY_LIST_CTL%>"><i
							class="fas fa-id-card"></i>Faculty List</a>
					</div>
				</div>
			</li>


			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn bg-dark dropdown-toggle"
						data-toggle="dropdown">College</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>"><i
							class="fa fa-university"></i>Add College</a> <a class="dropdown-item"
							href="<%=ORSView.COLLEGE_LIST_CTL%>"><i
							class="fas fa-user-tag"></i>College List</a>
					</div>
				</div>
			</li>


			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn bg-dark dropdown-toggle"
						data-toggle="dropdown">Course</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>"><i
							class="fas fa-user-tag"></i>Add Course</a> <a class="dropdown-item"
							href="<%=ORSView.COURSE_LIST_CTL%>"><i
							class="fas fa-user-tag"></i>Course List</a>
					</div>
				</div>
			</li>

			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn bg-dark dropdown-toggle"
						data-toggle="dropdown">Marksheet</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>"><i
							class="fas fa-user-tag"></i>Add Marksheet</a> <a
							class="dropdown-item" href="<%=ORSView.MARKSHEET_LIST_CTL%>"><i
							class="fas fa-user-tag"></i>Marksheet List</a>
							<a class="dropdown-item" href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><i
							class="fas fa-user-tag"></i>Marksheet Merit List</a>
					</div>
				</div>
			</li>

			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn bg-dark dropdown-toggle"
						data-toggle="dropdown">Subject</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.SUBJECT_CTL%>"><i
							class="fas fa-user-tag"></i>Add Subject</a> <a class="dropdown-item"
							href="<%=ORSView.SUBJECT_LIST_CTL%>"><i
							class="fas fa-user-tag"></i>Subject List</a>
					</div>
				</div>
			</li>

			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn bg-dark dropdown-toggle"
						data-toggle="dropdown">TimeTable</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.TIMETABLE_CTL%>"><i
							class="fas fa-user-tag"></i>Add TimeTable </a> <a
							class="dropdown-item" href="<%=ORSView.TIMETABLE_LIST_CTL%>"><i
							class="fas fa-user-tag"></i>TimeTable List</a>
					</div>
				</div>
			</li>
<%} %>

			<li class="nav-item">
				<div class="dropdown">
					<button type="button" class="btn bg-dark dropdown-toggle"
						data-toggle="dropdown">
						<%=welcomeMsg%>
					</button>
					<%
						if (userLoggedIn) {
					%>

					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.MY_PROFILE_CTL%>"><i
							class="fas fa-user-tag"></i>My Profile </a> <a class="dropdown-item"
							href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><i
							class="fas fa-user-tag"></i>Change Password</a> <a
							class="dropdown-item" href="<%=ORSView.JAVA_DOC_VIEW%>" target="blank"><i
							class="fas fa-user-tag"></i>Java Doc</a> <a class="dropdown-item"
							href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>"><i class="fas fa-sign-out-alt"></i>Logout</a>


					</div>
					<%
						} else {
					%>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=ORSView.LOGIN_CTL%>"><i class="fas fa-sign-in-alt"></i>login</a> <a class="dropdown-item"
							href="<%=ORSView.USER_REGISTRATION_CTL%>"><i
							class="fa fa-registered"></i>User Registration </a> <a
							class="dropdown-item" href="<%=ORSView.FORGET_PASSWORD_CTL%>"><i
							class="fas fa-user-tag"></i>Forget Password</a>
					</div>
					<%} %>

				</div>
			</li>





		</ul>

	</div>
	</nav>
</body>
</html>
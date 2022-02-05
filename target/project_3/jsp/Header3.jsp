<%@page import="in.co.rays.project_3.controller.UserCtl"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<title>Online Result System</title>


<!-- responsive bootstrap link -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">

<!-- Date Picker Library -->
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 4 DatePicker</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<!-- font Awesome library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- bootstrap library -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
	<style type="text/css">
	.navbar-fixed-top {
    min-height: 80px;
}

.navbar-nav > li > a {
    padding-top: 0px;
    padding-bottom: 0px;
    line-height: 80px;
}
@media (max-width: 767px) {
    .navbar-nav > li > a {
    line-height: 20px;
    padding-top: 10px;
    padding-bottom: 10px;}
}
	</style>





</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="height:55px">
<img class="btn btn-secondary my-2 my-sm-0 my-2 my-lg-0" src="<%=ORSView.APP_CONTEXT%>/img/custom.png" align="right" width="120px" height="50px">
<a href="<%=ORSView.WELCOME_CTL%>"> <i class="fa fa-home fa-3x" style=" color: green" ></i></a>
 
  
  <!-- ors module list -->
  <li class="dropdown ml-4"><a class="dropdown-toggle" data-toggle="dropdown" href=""><font color="white">Marksheet </font><span  class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</a></li>
          <li><a href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet List</a></li>
          
        </ul>
      </li>
 <li class="dropdown ml-4"><a class="dropdown-toggle" data-toggle="dropdown" href=""><font color="white">User </font><span  class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=ORSView.USER_CTL%>">Add User</a></li>
          <li><a href="<%=ORSView.USER_LIST_CTL%>">User List</a></li>
          
        </ul>
      </li>
       <li class="dropdown ml-4"><a class="dropdown-toggle" data-toggle="dropdown" href=""><font color="white">Role </font><span  class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=ORSView.ROLE_CTL%>">Add Role</a></li>
          <li><a href="<%=ORSView.ROLE_LIST_CTL%>">Role List</a></li>
          
        </ul>
      </li>
       <li class="dropdown ml-4"><a class="dropdown-toggle" data-toggle="dropdown" href=""><font color="white">College </font><span  class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=ORSView.COLLEGE_CTL%>">Add College</a></li>
          <li><a href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a></li>
          
        </ul>
      </li>
       <li class="dropdown ml-4"><a class="dropdown-toggle" data-toggle="dropdown" href=""><font color="white">Course </font><span  class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=ORSView.COURSE_CTL%>">Add Course</a></li>
          <li><a href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a></li>
          
        </ul>
      </li>
       <li class="dropdown ml-4"><a class="dropdown-toggle" data-toggle="dropdown" href=""><font color="white">Student </font><span  class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=ORSView.STUDENT_CTL%>">Add Student</a></li>
          <li><a href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a></li>
          
        </ul>
      </li>
       <li class="dropdown ml-4"><a class="dropdown-toggle" data-toggle="dropdown" href=""><font color="white">Subject</font><span  class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=ORSView.SUBJECT_CTL%>">Add Subject</a></li>
          <li><a href="<%=ORSView.SUBJECT_LIST_CTL%>">Subject List</a></li>
          
        </ul>
      </li>
       <li class="dropdown ml-4"><a class="dropdown-toggle" data-toggle="dropdown" href=""><font color="white">Faculty </font><span  class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=ORSView.FACULTY_CTL%>">Add Faculty</a></li>
          <li><a href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a></li>
          
        </ul>
      </li>
       <li class="dropdown ml-4"><a class="dropdown-toggle" data-toggle="dropdown" href=""><font color="white">TimeTable </font><span  class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=ORSView.TIMETABLE_CTL%>">Add TimeTable</a></li>
          <li><a href="<%=ORSView.TIMETABLE_LIST_CTL%>">TimeTable List</a></li>
          
        </ul>
      </li>
  
  
  
  
  
  
  
  
  
  
  
  <div class="collapse navbar-collapse" id="navbarColor02">
    <ul class="navbar-nav ml-auto mr-5">
      <li class="nav-item active">
        <a class="nav-link" href="#">Welcome <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%=ORSView.LOGIN_CTL%>">Login In</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%=ORSView.WELCOME_CTL%>">Welcome</a>
      </li>
      
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href=""><font color="white">Hi Guest </font><span  class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=ORSView.FORGET_PASSWORD_CTL%>">Forget Password</a></li>
          <li><a href="<%=ORSView.USER_LIST_CTL%>">User List</a></li>
          
        </ul>
      </li>
      
    
    </ul>
    
   
  </div>

 

</body>
</html>
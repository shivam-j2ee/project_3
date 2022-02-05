<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.dto.FacultyDTO"%>
<%@page import="in.co.rays.project_3.controller.FacultyListCtl"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty List</title>
<!-- Select All Library -->
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>	

<!-- font-awesome library -->
<style type="text/css">
@import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);
@import url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css);

.hm-gradient {
background-image: url("<%=ORSView.APP_CONTEXT%>/img/white.png");}
.darken-grey-text {
    color: #2E2E2E;
}
.danger-text {
    color: #ff3547; }
.default-text {
    color: #2BBBAD; 
}
.info-text {
    color: #33b5e5; 
}
.paddingclass{
padding-top: 10px;
}

</style>


<style type="text/css">
.setForm{
padding-top: 5%;
padding-left: 25%;
width: 130%
}
.button{
border-radius:5px;width:100px; padding:5px;color:white;font-size:20px;background-color:#00cc88
}
.fonta{
font-size: 20px;
}
</style>
</head>
<body class="hm-gradient">
<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.FacultyDTO" />
<div>
<%@include file="Header.jsp" %>
</div>
<form action="<%=ORSView.FACULTY_LIST_CTL%>" method="post">
<div class="container-fluid">
	<% List list = ServletUtility.getList(request);
       List collegeList=(List)request.getAttribute("collegeList");
       List courseList=(List)request.getAttribute("courseList");
	
	System.out.println(list);
        if (list.size()==0){ %>
			<div class="text-center">
			<td><input class="button" type="submit"  name="operation" value="<%=FacultyListCtl.OP_BACK%>"></td>
			</div>
			<%}else{ %>
	 <h3 class="text-center default-text py-3"> Faculty List:</h3>
	  <br>
	  <div class="row">
	  <div class="col-sm-1"></div>
	  <div class="col-sm-2 fonta default-text"><input placeholder="First Name" type="text" id="defaultForm-email"  name="firstName" class="border"  value="<%=ServletUtility.getParameter("firstName", request)%>"></div>
	  <div class="col-sm-2 fonta default-text"><input placeholder="Email" type="text" id="defaultForm-email" name="email" class="border"  value="<%=ServletUtility.getParameter("email", request)%>"></div>
	  <div class="col-sm-2"><%=HTMLUtility.getList("college",String.valueOf(dto.getCollegeId()),collegeList) %></div>
	   <div class="col-sm-2"><%=HTMLUtility.getList("course",String.valueOf(dto.getCollegeId()),courseList) %></div>
	  
	  <div class="col-sm-2">
	  <input class="button" type="submit"  name="operation" value="<%=FacultyListCtl.OP_SEARCH%>">
	  <input class="button" type="submit"  name="operation" value="<%=FacultyListCtl.OP_RESET%>">
	  </div> 
	  <div class="col-sm-1"></div>
	  </div>
	  
	  <br>
	  <br>
      
      <div class="table-responsive" >
      <table class="table table-striped" width="100%">
      <thead>
      <tr class="table-active">
      <th class="text-center"><input type="checkbox" id="select_all" name="select">Select All</th>
                    <th>S.NO</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>Email Id</th>
					<th>Qualification</th>
					<th>Mobile No.</th>
					<th>Joining Date</th>
					<th>College Name</th>
					<th>Course Name</th>
					<th>Edit</th>
      </tr>
      </thead>
      <%
	                int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;
                    int nextPageSize = DataUtility.getInt
                   		 (request.getAttribute("nextListSize").toString());
                   
                    Iterator<FacultyDTO> it = list.iterator();
                    while (it.hasNext()) {
                    	
                        dto = it.next();
               %>
               <tbody>
				<tr class="<%=((index)%2==0)?"table-info":"table-danger"%>">
					<td class="text-center"><input type="checkbox" class="checkbox" name="ids" value="<%=dto.getId()%>"></td>
					<td class=""><%=index++%></td>
					<td><%=dto.getFirstName()%></td>
					<td><%=dto.getLastName()%></td>
					<td><%=dto.getEmailId()%></td>
					<td><%=dto.getQualification()%></td>
					<td><%=dto.getMobileNo()%></td>
					<td><%=dto.getJoiningDob()%></td>
					<td><%=dto.getCollegeName()%></td>
					<td><%=dto.getCourseName()%></td>
					
					<td><a href="FacultyCtl?id=<%=dto.getId()%>">Edit</a></td>
				</tr>
				</tbody>
				<%
                    }
                %>
			</table>
			</div>
			
			
			<table width="100%">
			<tr>
			<td><input class="button" type="submit"  name="operation" value="<%=FacultyListCtl.OP_PREVIOUS%>"  <%=pageNo > 1 ? "" : "disabled"%>></td>
			<td><input class="button" type="submit"  name="operation" value="<%=FacultyListCtl.OP_NEW%>"></td>
			<td><input class="button" type="submit"  name="operation" value="<%=FacultyListCtl.OP_DELETE%>"></td>
			
			<td align="right"><input class="button" type="submit"  name="operation" value="<%=FacultyListCtl.OP_NEXT%>" <%=(nextPageSize != 0) ? "" : "disabled"%>  >
			</td></tr>
			
			
			</table>
			
			
			<%} %>
			
			</div>
</form>
</body>
<%@include file="Footer.jsp" %>
</html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="in.co.rays.project_3.dto.TimeTableDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="in.co.rays.project_3.controller.TimeTableListCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TimeTable List</title>
<!-- Select All Library -->
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>	

<!-- font-awesome library -->
<style type="text/css">
@import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);
@import url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css);

.hm-gradient {
    background-image: url("<%=ORSView.APP_CONTEXT%>/img/white.png");
}
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
<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.TimeTableDTO" />
<div>
<%@include file="Header.jsp" %>
</div>

<div class="container-fluid">


<form action="<%=ORSView.TIMETABLE_LIST_CTL%>" method="post">

   <%if(!ServletUtility.getSuccessMessage(request).equals("")){ %>
    <div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Success!</strong><font color="green"> <%=ServletUtility.getSuccessMessage(request) %></font>
    </div>
    <%} %>                            
	
	<%if(!ServletUtility.getErrorMessage(request).equals("")){ %>
  <center><div class="alert alert-danger alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Error!</strong><font color="red"><%=ServletUtility.getErrorMessage(request) %></font>
  </div></center>

<%} %>                            
            <input type="hidden" name="id" value="<%=dto.getId()%>">
            <input type="hidden" name="createdBy" value="<%=dto.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=dto.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">


<% 


   List courseList=(List)request.getAttribute("courseList");
	List subjectList=(List)request.getAttribute("subjectList");
	
	

    HashMap<String,String> map=new HashMap<String,String>();
        map.put("1", "1");
		map.put("2", "2");
		map.put("3", "3");
		map.put("4", "4");
		map.put("5", "5");
		map.put("6", "6");
		map.put("7", "7");
		map.put("8", "8");
		map.put("9", "9");
		map.put("10", "10");

	
	List list = ServletUtility.getList(request);
	System.out.println(list);
	
	%>
	<% if (list.size()==0){ %>
        <div class="text-center">
			<td><input class="button" type="submit"  name="operation" value="<%=TimeTableListCtl.OP_BACK%>"></td>
			</div>
			<%}else{ %>
	 <h3 class="text-center default-text py-3"> TimeTable List:</h3>
	 
	 <br>
	  <div class="row">
	  <div class="col-sm-2"></div>
	  <div class="col-sm-2"><%=HTMLUtility.getList("course",String.valueOf(dto.getCourseId()),courseList) %></div>
	  <div class="col-sm-2"><%=HTMLUtility.getList("subject",String.valueOf(dto.getSubId()),subjectList) %></div>
	  <div class="col-sm-2"><%=HTMLUtility.getList("semester",dto.getSemester(),map)%></div>
	  
	  
	  <div class="col-sm-2">
	  <input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=TimeTableListCtl.OP_SEARCH%>">
	  <input  class="btn btn-warning btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=TimeTableListCtl.OP_RESET%>">
	  </div> 
	  <div class="col-sm-2"></div>
	  </div>
	  
	  <br>
	  <br>
	  
	  
      <div class="table-responsive" >
      <table class="table table-striped" width="100%">
      <thead>
      <tr >
      <th class="text-center"><input type="checkbox" id="select_all" name="select">Select All</th>
                    					<th>S.NO</th>
					<th>Course Name</th>
					<th>Subject Name</th>
				     <th>Semester</th>
				     <th>Exam Date</th>
					<th>Exam Time</th>
					<th>Description</th>
					<th>Edit</th>
      </tr>
      </thead>
      <%
	                int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;
                    int nextPageSize = DataUtility.getInt
                   		 (request.getAttribute("nextlistsize").toString());
                   
                    Iterator<TimeTableDTO> it = list.iterator();
                    	
              /*  SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
                String date=sdf.format(dto.getExamDate()); */

                while (it.hasNext()) {
                	dto=(TimeTableDTO)it.next();

                %>
               <tbody>
				<tr >
					<td class="text-center"><input type="checkbox" class="checkbox" name="ids" value="<%=dto.getId()%>"></td>
					<td class=""><%=index++%></td>
									
					<td align=""><%=dto.getCourseName()%></td>
					<td align=""><%=dto.getSubName()%></td>
					<td align=""><%=dto.getSemester()%></td>
					<td align=""><%=dto.getExamDate()%></td>
					<td align=""><%=dto.getExamTime()%></td>
					<td align=""><%=dto.getDescription() %></td>
					<td align=""><a href="TimeTableCtl?id=<%=dto.getId()%>">Edit</a></td>
				</tr>
				</tbody>
				<%
                    }
                %>
			</table>
			
			</div>
			
			<table width="100%">
			<tr>
			<td><input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=TimeTableListCtl.OP_PREVIOUS%>"  <%=pageNo > 1 ? "" : "disabled"%>></td>
			<td><input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=TimeTableListCtl.OP_NEW%>"></td>
			<td><input  class="btn btn-warning btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=TimeTableListCtl.OP_DELETE%>"></td>
			
			<td align="right"><input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=TimeTableListCtl.OP_NEXT%>" <%=(nextPageSize != 0) ? "" : "disabled"%>  >
			</td></tr>
			
			
			</table>
			
						
			<%} %>


</form>
</div>
</body>
<%@include file="Footer.jsp" %>
</html>
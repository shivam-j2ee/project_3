<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="in.co.rays.project_3.dto.*"%>

<%@page import="in.co.rays.project_3.controller.MarksheetMeritListCtl"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Marksheet Merit List</title>
<!-- Select All Library -->
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>	

<!-- font-awesome library -->
<style type="text/css">
@import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);
@import url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css);

.hm-gradient {
    background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);
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
.form-white .md-form label {
  color: #fff; 
}
.form-white input[type=text]:focus:not([readonly]) {
    border-bottom: 1px solid #fff;
    -webkit-box-shadow: 0 1px 0 0 #fff;
    box-shadow: 0 1px 0 0 #fff; 
}
.form-white input[type=text]:focus:not([readonly]) + label {
    color: #fff; 
}
.form-white input[type=password]:focus:not([readonly]) {
    border-bottom: 1px solid #fff;
    -webkit-box-shadow: 0 1px 0 0 #fff;
    box-shadow: 0 1px 0 0 #fff; 
}
.form-white input[type=password]:focus:not([readonly]) + label {
    color: #fff; 
}
.form-white input[type=password], .form-white input[type=text] {
    border-bottom: 1px solid #fff; 
}

.form-white .form-control:focus {
    color: #fff;
}
.form-white .form-control {
    color: #fff;
}
.form-white textarea.md-textarea:focus:not([readonly]) {
    border-bottom: 1px solid #fff;
    box-shadow: 0 1px 0 0 #fff;
    color: #fff; 
}
.form-white textarea.md-textarea  {
    border-bottom: 1px solid #fff;
    color: #fff;
}
.form-white textarea.md-textarea:focus:not([readonly])+label {
    color: #fff;
}
.ripe-malinka-gradient {
    background-image: linear-gradient(120deg, #f093fb 0%, #f5576c 100%);
}
.near-moon-gradient {
    background-image: linear-gradient(to bottom, #5ee7df 0%, #b490ca 100%);
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
<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.MarksheetDTO" />
<div>
<%@include file="Header.jsp" %>
</div>

<div class="container-fluid">
<form action="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>" method="post">
<h3 class="text-center default-text py-3"> Marksheet Merit List:</h3>
	<%
	
	
	List list = ServletUtility.getList(request);
	System.out.println(list);
        if (list.size()==0){ %>
			<input type="submit" name="operation"
				value="<%=MarksheetMeritListCtl.OP_BACK%>">
			<%}else{ %>
	 
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  <div class="table-responsive" >
      <table class="table table-striped" width="100%">
      <thead>
      <tr >
      <th class="text-center"><input type="checkbox" id="select_all" name="select">Select All</th>
                    <th>S.NO</th>
					<th>Roll No</th>
					<th>Name</th>
					<th>Maths</th>
					<th>Physics</th>
					<th>Chemistry</th>
					<th>Total</th>
					<th>Percentage%</th>
				    <th>Edit</th>
      </tr>
      </thead>
      <%
	                int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;
                   
                    Iterator<MarksheetDTO> it = list.iterator();
                    while (it.hasNext()) {
                    	
                       dto = it.next();
               %>
               <tbody>
				<tr >
					<td class="text-center"><input type="checkbox" class="checkbox" name="ids" value="<%=dto.getId()%>"></td>
					<td class=""><%=index++%></td>
					<td><%=dto.getRollNo()%></td>
					<td><%=dto.getName()%></td>
					<td><%=dto.getMaths()%></td>
					<td><%=dto.getPhysics()%></td>
					<td><%=dto.getChemistry()%></td>
	                <td><%=(dto.getChemistry()+dto.getMaths()+dto.getPhysics())%></td>
                    <td><%=(dto.getChemistry()+dto.getMaths()+dto.getPhysics())/3%></td>
					<td><a href="MarksheetCtl?id=<%=dto.getId()%>">Edit</a></td>
				</tr>
				</tbody>
				<%
                    }
                %>
			</table>
			
			</div>
			
			<table width="100%">
			<tr>
			<td><center><input class="button" type="submit"  name="operation" value="<%=MarksheetMeritListCtl.OP_BACK%>"></center></td>
			
			</td></tr>
			
			
			</table>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			<%} %>
</form>
</div>

<%@include file="Footer.jsp" %>
</body>
</html>
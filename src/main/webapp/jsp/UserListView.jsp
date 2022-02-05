<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="in.co.rays.project_3.dto.UserDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.dto.RoleDTO"%>
<%@page import="in.co.rays.project_3.model.ModelFactory"%>
<%@page import="in.co.rays.project_3.model.RoleModelInt"%>
<%@page import="in.co.rays.project_3.controller.UserListCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List</title>

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
.form-white .md-form label {
  color: #fff; 
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
<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.UserDTO" />
<div>
<%@include file="Header.jsp" %>
</div>

<div class="container-fluid">


<form action="<%=ORSView.USER_LIST_CTL%>" method="post">

   <%if(!ServletUtility.getSuccessMessage(request).equals("")){ %>
    <div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Success!</strong><font color="green"> <%=ServletUtility.getSuccessMessage(request) %></font>
    </div>
    <%} %>                            
	
	<%if(!ServletUtility.getErrorMessage(request).equals("")){ %>
<div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Error!</strong><font color="red"><%=ServletUtility.getErrorMessage(request) %></font>
  </div>

<%} %>                            
            <input type="hidden" name="id" value="<%=dto.getId()%>">
            <input type="hidden" name="createdBy" value="<%=dto.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=dto.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">


	<%
	 List roleList=(List)request.getAttribute("roleList");
	
	
	List list = ServletUtility.getList(request);
	System.out.println(list);
        if (list.size()==0){ %>
        <div class="text-center">
			<td><input class="button" type="submit"  name="operation" value="<%=UserListCtl.OP_BACK%>"></td>
			</div>
			<%}else{ %>
	 <h3 class="text-center default-text py-3"> User List:</h3>
	 
	 <br>
	  <div class="row">
	  <div class="col-sm-2"></div>
	  <div class="col-sm-2 fonta default-text">
	  							 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text">@</span>
                                 </div>
                        <input type="text" placeholder="Enter First Name" class="form-control border" name="firstName" value="<%=ServletUtility.getParameter("firstName", request)%>">
                                </div>
	  
	  
	  </div>
	 
	 
	 
	  <div class="col-sm-2 fonta default-text">
	  
	  	 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text">@</span>
                                 </div>
                        <input type="text" placeholder="Enter email" class="form-control border" name="email" value="<%=ServletUtility.getParameter("email", request)%>">
                                </div>
	  
	  
	  </div>
	  <div class="col-sm-2">
	  
	  <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text">@</span>
                                 </div>
                        <%=HTMLUtility.getList("role",String.valueOf(dto.getRoleId()),roleList) %>
                                </div>
	  
	  </div>
	  
	  
	  <div class="col-sm-2">
	  <input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=UserListCtl.OP_SEARCH%>">
	  <input  class="btn btn-warning btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=UserListCtl.OP_RESET%>">
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
					<th>FirstName</th>
					<th>LastName</th>
					<th>Role</th>
					<th>LoginId</th>
					<th>Gender</th>
					<th>DOB</th>
					<th>Edit</th>
      </tr>
      </thead>
      <%
	                int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;
                    int nextPageSize = DataUtility.getInt
                   		 (request.getAttribute("nextlistsize").toString());
                   
                    Iterator<UserDTO> it = list.iterator();
                    while (it.hasNext()) {
                    	
                       UserDTO dto2 = it.next();
                        RoleModelInt model=ModelFactory.getInstance().getRoleModel();
                        RoleDTO dto1= new RoleDTO();
                        dto1=model.findByPK(dto2.getRoleId());
                        System.out.println(dto1.getName());
                        System.out.println(dto1.getId());
               SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
                String date=sdf.format(dto2.getDob());
               %>
               <tbody>
				<tr >
					<td class="text-center"><input type="checkbox" class="checkbox" name="ids" value="<%=dto2.getId()%>"></td>
					<td class=""><%=index++%></td>
					<td><%=dto2.getFirstName()%></td>
					<td><%=dto2.getLastName()%></td>
					<td><%=dto1.getName()%></td>
					<td><%=dto2.getLogin()%></td>
					<td><%=dto2.getGender()%></td>
					<td><%=date%></td>
					<td><a href="UserCtl?id=<%=dto2.getId()%>"<% if( dto2.getRoleId()==dto1.ADMIN){%>
      onclick="return false;"<%}%>>Edit</a></td>
				</tr>
				</tbody>
				<%
                    }
                %>
			</table>
			
			</div>
			
			<table width="100%">
			<tr>
			<td><input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=UserListCtl.OP_PREVIOUS%>"  <%=pageNo > 1 ? "" : "disabled"%>></td>
			<td><input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=UserListCtl.OP_NEW%>"></td>
			<td><input  class="btn btn-warning btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=UserListCtl.OP_DELETE%>"></td>
			
			<td align="right"><input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=UserListCtl.OP_NEXT%>" <%=(nextPageSize != 0) ? "" : "disabled"%>  >
			</td></tr>
			
			
			</table>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			<%} %>
</form>
</div>
</body>
<%@include file="Footer.jsp" %>
</html>
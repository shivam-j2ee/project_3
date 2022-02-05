<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.controller.RoleListCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="in.co.rays.project_3.dto.RoleDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Role List</title>
<!-- Select All Library -->
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>

<!-- font-awesome library -->
<style type="text/css">
@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

@import
	url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css)
	;

.hm-gradient {
	background-image: url("<%=ORSView.APP_CONTEXT%>/img/white.png");
}

.darken-grey-text {
	color: #2E2E2E;
}

.danger-text {
	color: #ff3547;
}

.default-text {
	color: #2BBBAD;
}

.info-text {
	color: #33b5e5;
}

.form-white .md-form label {
	color: #fff;
}


.form-white input[type=text]:focus:not ([readonly] ) {
	border-bottom: 1px solid #fff;
	-webkit-box-shadow: 0 1px 0 0 #fff;
	box-shadow: 0 1px 0 0 #fff;
}

.form-white input[type=text]:focus:not ([readonly] ) +label {
	color: #fff;
}

.form-white input[type=password]:focus:not ([readonly] ) {
	border-bottom: 1px solid #fff;
	-webkit-box-shadow: 0 1px 0 0 #fff;
	box-shadow: 0 1px 0 0 #fff;
}

.form-white input[type=password]:focus:not ([readonly] ) +label {
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

.form-white textarea.md-textarea:focus:not ([readonly] ) {
	border-bottom: 1px solid #fff;
	box-shadow: 0 1px 0 0 #fff;
	color: #fff;
}

.form-white textarea.md-textarea {
	border-bottom: 1px solid #fff;
	color: #fff;
}

.form-white textarea.md-textarea:focus:not ([readonly] )+label {
	color: #fff;
}

.ripe-malinka-gradient {
	background-image: linear-gradient(120deg, #f093fb 0%, #f5576c 100%);
}

.near-moon-gradient {
	background-image: linear-gradient(to bottom, #5ee7df 0%, #b490ca 100%);
}

.paddingclass {
	padding-top: 10px;
}
</style>

<!-- Bootstrap library -->

<style type="text/css">
.setForm {
	padding-top: 5%;
	padding-left: 25%;
	width: 130%
}

.button {
	border-radius: 5px;
	width: 100px;
	padding: 5px;
	color: white;
	font-size: 20px;
	background-color: #00cc88
}

.fonta {
	font-size: 20px;
}
</style>
</head>
<body class="hm-gradient">
<div>
		<%@include file="Header.jsp"%>
	</div>
	
<div class="container-fluid">
	<jsp:useBean id="dto" scope="request"
		class="in.co.rays.project_3.dto.RoleDTO" />
	<form action="<%=ORSView.ROLE_LIST_CTL%>" method="post">

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
	
	
	
	
	
	
		<% List list = ServletUtility.getList(request);
	List roleList=(List)request.getAttribute("roleList");
	System.out.println(list);
        if (list.size()==0){ %>
		<input type="submit" name="operation" value="<%=RoleListCtl.OP_BACK%>">
		<%}else{ %>
		<h3 class="text-center default-text py-3">Role List:</h3>


		<br>

		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-2">
				<%=HTMLUtility.getList("role",String.valueOf(dto.getId()), roleList) %></div>
			<div class="col-md-2">
				<input  class="btn btn-success btn-md" style="font-size: 17px" type="submit" name="operation"
					value="<%=RoleListCtl.OP_SEARCH%>"> <input  class="btn btn-warning btn-md" style="font-size: 17px"
					type="submit" name="operation" value="<%=RoleListCtl.OP_RESET%>">

			</div>
			<div class="col-md-4"></div>
		</div>
		<br> <br>


		<div class="table-responsive">
			<table class="table table-striped" width="100%">
				<thead>
					<tr class="table-active">
						<th class="text-center"><input type="checkbox"
							id="select_all" name="select">Select All</th>
						<th>S.NO</th>
						<th>Name</th>
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
                   
                    Iterator<RoleDTO> it = list.iterator();
                    while (it.hasNext()) {
                    	
                        dto = it.next();
               %>
				<tbody>
					<tr class="<%=((index)%2==0)?"table-info":"table-danger"%>">
						<td class="text-center"><input type="checkbox"
							class="checkbox" name="ids" value="<%=dto.getId()%>"></td>
						<td class=""><%=index++%></td>
						<td><%=dto.getName()%></td>
						<td><%=dto.getDescription()%></td>
						<td><a href="RoleCtl?id=<%=dto.getId()%>">Edit</a></td>
					</tr>
				</tbody>
				<%
                    }
                %>
			</table>
		</div>

		<table width="100%">
			<tr>
				<td><input  class="btn btn-success btn-md" style="font-size: 17px" type="submit" name="operation"
					value="<%=RoleListCtl.OP_PREVIOUS%>"></td>
				<td><input  class="btn btn-success btn-md" style="font-size: 17px" type="submit" name="operation"
					value="<%=RoleListCtl.OP_NEW%>"></td>
				<td><input  class="btn btn-warning btn-md" style="font-size: 17px" type="submit" name="operation"
					value="<%=RoleListCtl.OP_DELETE%>"></td>

				<td align="right"><input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"
					name="operation" value="<%=RoleListCtl.OP_NEXT%>"></td>
			</tr>


		</table>






		<%} %>
	</form>
	</div>
</body>
<%@include file="Footer.jsp" %>
</html>
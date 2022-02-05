<%@page import="in.co.rays.project_3.controller.RoleCtl"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
.textfield{
border: 1px solid #8080803b;height: 38px; padding-left: 6px;
}


.button{
border-radius:10px;padding:10px;color:white;font-size:20px;background-color:#00cc88
}
</style>
</head>

<body  class="hm-gradient">
<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.RoleDTO" />
<div>
<%@include file="Header.jsp" %>
</div>
<form action="<%=ORSView.ROLE_CTL%>" method="post">



    
    
    <main>
        
        <!--MDB Forms-->
        <div class="container mt-4">

            
            <!-- Grid row -->
            <div class="row">
            <div class="col-md-3"></div>
                <!-- Grid column -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                        <%long id=DataUtility.getLong(request.getParameter("id")); %>
                            <h3 class="text-center default-text py-3"><%=(id==0)? "Add Role": "Update Role" %></h3>
                            <!--Body-->

                            		<%if(!ServletUtility.getSuccessMessage(request).equals("")){ %>
    <div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Success!</strong><%=ServletUtility.getSuccessMessage(request) %>
    </div>
    <%} %>                            
	
	<%if(!ServletUtility.getErrorMessage(request).equals("")){ %>
<div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Success!</strong><%=ServletUtility.getErrorMessage(request) %>
  </div>
<%} %>                            
		
            <input type="hidden" name="id" value="<%=dto.getId()%>">
            <input type="hidden" name="createdBy" value="<%=dto.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=dto.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">





                          
                            
                          <h6  style="color: #20B2AA ">Role:<font color="red">*</font></h6>  
                            <div class="md-form">
                          <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                          <input type="text" placeholder="Enter role" class="form-control border" name="role" value="<%=DataUtility.getStringData(dto.getName())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("role",request) %> </font>
                            
                            </div>
                            
                            
                            
                            <h6 class="ml-5 paddingclass" style="color: #20B2AA ">Description<font color="red">*</font></h6>
                            <div class="md-form">
                               
                               <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                          <textarea placeholder="Enter description" class="form-control border" name="description" value="<%=DataUtility.getStringData(dto.getName())%>"></textarea>
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("description",request) %> </font>
                               
                               
                               </div>
                          
                          
                          
                          
                          
                          
                                               <%if (id>0){ %>
                           <div class="text-center"  id="defaultForm-email">
                           <input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=RoleCtl.OP_UPDATE%>">
                           <input  class="btn btn-danger btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=RoleCtl.OP_CANCEL%>">
                          
                            </div>
                          
                          <%}else{ %> 
                           <div class="text-center"  id="defaultForm-email">
                           <input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=RoleCtl.OP_SAVE%>">
                           <input  class="btn btn-info btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=RoleCtl.OP_RESET%>">
                          
                            </div>
                             <%} %>
       
                        </div>
                    
                    </div>
                     </div>

<div class="col-md-3"></div>
</div>               
</div>
</form>

</body>
<%@include file="Footer.jsp" %>
</html>
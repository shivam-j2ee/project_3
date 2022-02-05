<%@page import="java.util.List"%>
<%@page import="in.co.rays.project_3.controller.UserCtl"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User</title>
<!-- date picker library -->








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
/* .setForm{
padding-top: 5%;
padding-left: 25%;
width: 130%
}
 */
 .button{
border-radius:10px;padding:10px;color:white;font-size:20px;background-color:#00cc88
}

.textfield{
border: 1px solid #8080803b;height: 38px; padding-left: 6px;
}
</style>









</head>
<body class="hm-gradient" data-spy="scroll" data-target=".navbar" data-offset="50">
<div>
<%@include file="Header.jsp"%>
</div>
<script>
  $( function() {
    $( "#datepicker" ).datepicker({ 
    	changeMonth :true,
		  changeYear :true,
		  yearRange :'1980:2030',
		  dateFormat:'dd/mm/yy',
		  endDate: '-18y'	 
		
    	
		 }) ;
  } );
  </script>

<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.UserDTO" />
<form action="<%=ORSView.USER_CTL%>" method="post">
<!-- getting role list for preload -->
<%List list= (List)request.getAttribute("roleList"); %>

    
    
    <main>
        
        <!--MDB Forms-->
        <div class="container mt-4">

            
            <!-- Grid row -->
            <div class="row">
                <!-- Grid column -->
               <div class="col-md-3"></div>
               
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                        
                        <%long id=DataUtility.getLong(request.getParameter("id")); %>
                       
                           <h3 class="text-center default-text py-3"><%=(id==0)? "Add User": "Update User" %></h3>
                            
                          
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
    <strong>Error!</strong><font><%=ServletUtility.getErrorMessage(request) %></font>
  </div>
<%} %>                            
		
            <input type="hidden" name="id" value="<%=dto.getId()%>">
            <input type="hidden" name="createdBy" value="<%=dto.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=dto.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">
                            
                           <h6 style="color: #20B2AA ">First Name<font color="red">*</font></h6>
                           
                           <div class="md-form">
              		 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter First Name" class="form-control border" name="firstName" value="<%=DataUtility.getStringData(dto.getFirstName())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("firstName",request) %> </font>
                       </div>



                           <h6 class="paddingclass" style="color: #20B2AA " >Last Name<font color="red">*</font></h6>
                           <div class="md-form">
                           <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter Last Name" class="form-control border" name="lastName" value="<%=DataUtility.getStringData(dto.getLastName())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("lastName",request) %> </font>                     </div>






                           <h6 class="paddingclass" style="color: #20B2AA " >Email<font color="red">*</font></h6>

                           <div class="md-form">
                  		 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter Email" class="form-control border" name="email" value="<%=DataUtility.getStringData(dto.getLogin())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("email",request) %> </font>

  </div>
                           
                           
                   
                   
                           <h6 class="paddingclass" style="color: #20B2AA " >Mobile Number<font color="red">*</font></h6>                           
                           <div class="md-form" >
                  		 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter Mobile Number" class="form-control border" name="mobileNumber" value="<%=DataUtility.getStringData(dto.getMobileNo())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("mobileNumber",request) %> </font>

  </div>
                           
                           
                           <h6 class="paddingclass" style="color: #20B2AA ">Password<font color="red">*</font></h6>
                           <div class="md-form">
                  		 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="password" placeholder="Enter Password" class="form-control border" name="password" value="<%=DataUtility.getStringData(dto.getPassword())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("password",request) %> </font>

                           </div>
                           
                           
                           <h6 class="paddingclass" style="color: #20B2AA " >Confirm Password <font color="red">*</font></h6>
                           
                           <div class="md-form">

                  		 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="password" placeholder="Enter Conform Password" class="form-control border" name="confirmPassword" value="<%=((id==0)? DataUtility.getStringData(dto.getConfirmPassword()):DataUtility.getStringData(dto.getPassword()))%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("confirmPassword",request) %> </font>
                          </div>
                           
                           
                           <h6 class="paddingclass" style="color: #20B2AA " >Gender<font color="red">*</font></h6>
                           
                           
                           <%HashMap<String,String> map=new HashMap<String,String>();
                           map.put("male", "male");
                           map.put("female","female");
                           String gender=HTMLUtility.getList("gender",dto.getGender(), map);
                           %>
                          <div class="md-form">
								<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=gender%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("gender", request) %></font>

 </div>



                           <%String role=HTMLUtility.getList("role",String.valueOf(dto.getRoleId()),list); %>
                           
                          
                           <h6 class="paddingclass" style="color: #20B2AA " >Role<font color="red">*</font></h6>
                          
                          <div class="md-form">

								<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=role%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("role", request) %></font>

                           </div>
  
                           <div class="paddingclass">
                           <h6 class="default-text" >Date Of Birth<font color="red">*</font></h6>
                           </div>
                           
                           
                           <div class="md-form">

                  		 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="password" placeholder="Enter dob" class="form-control border" name="dob" value="<%=DataUtility.getStringData(dto.getDob())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("dob",request) %> </font>




                                                                            </div>
                          <%if (id>0){ %>
                           <div class="text-center"  id="defaultForm-email">
                           <input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=UserCtl.OP_UPDATE%>">
                           <input  class="btn btn-danger btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=UserCtl.OP_CANCEL%>">
                          
                            </div>
                          
                          <%}else{ %> 
                           <div class="text-center"  id="defaultForm-email">
                           <input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=UserCtl.OP_SAVE%>">
                           <input  class="btn btn-info btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=UserCtl.OP_RESET%>">
                          
                            </div>
                             <%} %>
                        </div>
                    </div>
                </div>
                <div class="col-md-3"></div>
               </div>
               </div>

</form>


<div>

</div>

</body>
<%@include file="Footer.jsp" %>
</html>
<%@page import="in.co.rays.project_3.controller.MyProfileCtl"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Profile</title>
<!-- date picker library -->








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
<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.UserDTO" />
<form action="<%=ORSView.MY_PROFILE_CTL%>" method="post">
<!-- getting role list for preload -->

<div>
<%@include file="Header.jsp"%>
</div>
    
    
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
                        
                        
                       
                           <h3 class="text-center default-text py-3">My Profile</h3>
                            
                          
                            <!--Body-->
                            
                            		<%
                            		
                            		List roleList=(List)request.getAttribute("roleList");
                            		
                            		
                            		
                            		if(!ServletUtility.getSuccessMessage(request).equals("")){ %>
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
                            
                           <h6 class="ml-5" style="color: #20B2AA ">First Name<font color="red">*</font></h6>
                           
                           <div class="md-form">
                           <i  class="fa fa-headset prefix grey-text textfield fa-2x" ></i>
                           <input type="text" class="border" id="defaultForm-email"   placeholder="Enter First Name" name="firstName" value="<%=DataUtility.getStringData(dto.getFirstName())%>">
                           <font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("firstName", request) %></font>    
                           </div>



                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Last Name<font color="red">*</font></h6>
                           <div class="md-form">
                           <i class="fa fa-lock prefix grey-text textfield "></i>
                           <input type="text" class="border" id="defaultForm-pass"  placeholder="Enter Last Name" name="lastName" value="<%=DataUtility.getStringData(dto.getLastName())%>">
                           <font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("lastName", request) %></font>
                           </div>




                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Email<font color="red">*</font></h6>

                           <div class="md-form">
                           <i class="fa fa-envelope prefix grey-text textfield"></i>
                           <input type="text" class="border" id="defaultForm-email" class="border"  placeholder="Enter Email" name="email" value="<%=DataUtility.getStringData(dto.getLogin())%>">
                           <font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("email", request) %></font>    
                           </div>
                           
                           
                   
                   
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Mobile Number<font color="red">*</font></h6>                           
                           <div class="md-form" >
                           <i class="fa fa-envelope prefix grey-text textfield"></i>
                           <input type="text" class="border" id="defaultForm-email"   placeholder="Enter Mobile Number" name="mobileNumber" value="<%=DataUtility.getStringData(dto.getMobileNo())%>">
                           <font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("mobileNumber", request) %></font>    
                           </div>
                           
                           
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA ">Password<font color="red">*</font></h6>
                           <div class="md-form">
                           <i class="fa fa-envelope prefix grey-text textfield"></i>
                           <input type="text" class="border" id="defaultForm-email"   placeholder="Enter Password" name="password" value="<%=DataUtility.getStringData(dto.getPassword())%>">
                           <font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("password", request) %></font>    
                           </div>
                           
                           
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Confirm Password <font color="red">*</font></h6>
                           
                           <div class="md-form">
                           <i class="fa fa-envelope prefix grey-text textfield"></i>
                           <input type="text" class="border"   placeholder="Enter Confirm Password" name="confirmPassword" value="<%=DataUtility.getStringData(dto.getConfirmPassword())%>">
                           <font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("confirmPassword", request) %></font>    
                           </div>
                           
                           
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Gender<font color="red">*</font></h6>
                           
                           
                           <%HashMap<String,String> map=new HashMap<String,String>();
                           map.put("male", "male");
                           map.put("female","female");
                           String gender=HTMLUtility.getList("gender",dto.getGender(), map);
                           %>
                          <div class="md-form">
                          <i class="fa fa-envelope prefix grey-text textfield"></i>
                           <div style="padding-left: 50px">  
                           <%=gender%>
                           <font color="red"> <%=ServletUtility.getErrorMessage("gender", request) %></font>
                           </div>
                           </div>
                           <%String role=HTMLUtility.getList("role",String.valueOf(dto.getRoleId()),roleList); %>
                           
                          
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Role<font color="red">*</font></h6>
                          
                          <div class="md-form">
                          <i class="fa fa-envelope prefix grey-text textfield"></i>
                           <div style="padding-left: 50px">
                          <%=role%>
                          <font color="red"> <%=ServletUtility.getErrorMessage("role", request) %></font>
                          </div>
                           </div>
  
                           <div class="ml-5">
                           <h6 class="default-text" >Date Of Birth<font color="red">*</font></h6>
                           </div>
                           
                           
                           <div class="md-form">
                           <i class="fa fa-envelope prefix grey-text textfield"></i>
                           <input  type="date" id="datepicker" class="border"  placeholder="Enter Date of Birth" name="dob" value="<%=DataUtility.getStringData(dto.getDob())%>">
                           <font color="red" class="ml-5">
                           <%=ServletUtility.getErrorMessage("dob", request) %></font>    
                                                   </div>
                          
                           
                           <div class="text-center"  id="defaultForm-email">
                           <input class="button" type="submit"  name="operation" value="<%=MyProfileCtl.OP_SAVE%>">
                           <input class="button" type="submit"  name="operation" value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>">
                          
                            </div>
                           
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
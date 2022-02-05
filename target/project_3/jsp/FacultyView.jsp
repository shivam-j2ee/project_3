<%@page import="in.co.rays.project_3.controller.FacultyCtl"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty View</title>
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
border-radius:10px;padding:10px;color:white;font-size:20px;background-color:#00cc88
}
.textfield{
border: 1px solid #8080803b;height: 38px; padding-left: 6px;
}

</style>

</head>
<body class="hm-gradient" data-spy="scroll" data-target=".navbar" data-offset="50">
<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.FacultyDTO" />

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



<form action="<%=ORSView.FACULTY_CTL%>" method="post">
<!-- getting role list for preload -->
<%List collegeList= (List)request.getAttribute("collegeList");
List courseList= (List)request.getAttribute("courseList");
List subjectList= (List)request.getAttribute("subjectList");
		%>
    
    
    <main>
        
        <!--MDB Forms-->
        <div class="container mt-4">

            
            <!-- Grid row -->
            <div class="row">
<div class="col-md-3"></div>

                <!-- Grid column -->
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                                <%long id=DataUtility.getLong(request.getParameter("id")); %>                       
                           <h3 class="text-center default-text py-3"><%=(id==0)? "Add Faculty": "Update Faculty" %></h3>
                            
                           
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
                           
                           
                            <h6 class="ml-5" style="color: #20B2AA ">First Name<font color="red">*</font></h6>
                           
                           <div class="md-form">

              		 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter First Name" class="form-control border" name="firstName" value="<%=DataUtility.getStringData(dto.getFirstName())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("firstName",request) %> </font>


                               
                           </div>




                             <h6 class="ml-5 paddingclass" style="color: #20B2AA ">Last Name<font color="red">*</font></h6>
                           <div class="md-form ">

              		 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter Last Name" class="form-control border" name="lastName" value="<%=DataUtility.getStringData(dto.getLastName())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("lastName",request) %> </font>


                          
                           </div>
                           
                            <%HashMap<String,String> map=new HashMap<String,String>();
                           map.put("male", "male");
                           map.put("female","female");
                           String gender=HTMLUtility.getList("gender",dto.getGender(), map);
                           %>
                          
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA ">Gender<font color="red">*</font></h6>
                          <div class="md-form">
                   
                   								<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=gender%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("gender", request) %></font>
                   
                   
                   
                           
                          
                           </div>
                           
                            <h6 class="ml-5 paddingclass" style="color: #20B2AA ">Joining Date<font color="red">*</font></h6>
                           <div class="md-form">
                   
                                 		 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input readonly="readonly" type="text" id="datepicker" placeholder="Enter Joining Date" class="form-control border" name="joiningDob" value="<%=DataUtility.getStringData(dto.getJoiningDob())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("joiningDob",request) %> </font>
                   
                      </div>



                           <h6 class="ml-5 paddingclass" style="color: #20B2AA ">Qualification<font color="red">*</font></h6>
                           <div class="md-form ">
                   
                        <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter qualification" class="form-control border" name="qualification" value="<%=DataUtility.getStringData(dto.getQualification())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("qualification",request) %> </font>
                   
                   
                   
                          </div>
        
        
                           
                            <h6 class="ml-5 paddingclass" style="color: #20B2AA ">Mobile Number<font color="red">*</font></h6>
                           <div class="md-form ">
                   
                                 		 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter Mobile Number" class="form-control border" name="mobileNo" value="<%=DataUtility.getStringData(dto.getMobileNo())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("mobileNo",request) %> </font>
                   
                      </div>
        
                           
                           
                           

                            <h6 class="ml-5 paddingclass" style="color: #20B2AA ">Email Id<font color="red">*</font></h6>

                           <div class="md-form ">
                   
                         <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter Email" class="form-control border" name="login" value="<%=DataUtility.getStringData(dto.getEmailId())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("login",request) %> </font>
                   
                   </div>
                                                      
                           
                           <%String college=HTMLUtility.getList("college",String.valueOf(dto.getCollegeId()),collegeList); %>
                          <h6 class="ml-5 paddingclass" style="color: #20B2AA ">College<font color="red">*</font></h6>                           
                          <div class="md-form ">
                   
                   								<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=college%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("college", request) %></font>
                   
                   
                           </div>
                          
                          
                          
                   
                   
                   
                           <%String course=HTMLUtility.getList("course",String.valueOf(dto.getCourseId()),courseList); %>
                          <h6 class="ml-5 paddingclass" style="color: #20B2AA ">Course<font color="red">*</font></h6>  
                          <div class="md-form">
                   
                   								<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=course%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("course", request) %></font>
                   
                   
                         
                           </div>
                           
                           
                           
                   
                   
                           <%String subject=HTMLUtility.getList("subject",String.valueOf(dto.getSubjectId()),subjectList); %>
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA ">Subject<font color="red">*</font></h6> 
                          <div class="md-form ">
                   								<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=subject%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("subject", request) %></font>
                   
                   
                   
                           </div>
                           
                           
                           
                           
                          
                             
                                              
                           <%if (id>0){ %>
                           <div class="text-center"  id="defaultForm-email">
                           <input class="button" type="submit"  name="operation" value="<%=FacultyCtl.OP_UPDATE%>">
                           <input class="button" type="submit"  name="operation" value="<%=FacultyCtl.OP_CANCEL%>">
                          
                            </div>
                          
                          <%}else{ %> 
                           <div class="text-center"  id="defaultForm-email">
                           <input class="button" type="submit"  name="operation" value="<%=FacultyCtl.OP_SAVE%>">
                           <input class="button" type="submit"  name="operation" value="<%=FacultyCtl.OP_RESET%>">
                          
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
<%@include file="Footer.jsp" %>
</div>

</body>
</html>
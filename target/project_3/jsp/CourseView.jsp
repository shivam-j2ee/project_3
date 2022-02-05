<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.project_3.controller.CourseCtl"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Course View</title>
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
<!-- Bootstrap library -->

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

<body  class="hm-gradient">
<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.CourseDTO" />
<div>
<%@include file="Header.jsp" %>
</div>
<form action="<%=ORSView.COURSE_CTL%>" method="post">



    
    
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
                                                       <h3 class="text-center default-text py-3"><%= (id==0)? "Add Course": "Update Course" %></h3>

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
    <strong>Error!</strong><%=ServletUtility.getErrorMessage(request) %>
  </div>
<%} %>                            
		
            <input type="hidden" name="id" value="<%=dto.getId()%>">
            <input type="hidden" name="createdBy" value="<%=dto.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=dto.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">
                         
                         
                           <h6 class="ml-5" style="color: #20B2AA " >Course Name<font color="red">*</font></h6> 
                            <div class="md-form">
                                         <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter Course Name" class="form-control border" name="courseName" value="<%=DataUtility.getStringData(dto.getCourseName())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("courseName",request) %> </font>
                    
                          </div>
    
    
    
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Description<font color="red">*</font></h6>
                            <div class="md-form">
                                 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter description" class="form-control border" name="description" value="<%=DataUtility.getStringData(dto.getDescription())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("description",request) %> </font>
                    
                               </div>
                            
                            
                            
                            <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Duration<font color="red">*</font></h6>
                            <div class="md-form">
                                
                 <%HashMap<String,String> map = new HashMap<String,String>();
							map.put("1y", "1year");
							map.put("2y", "2year");
							map.put("3y", "3year");
							map.put("4y", "4year");
							map.put("5y", "5year");
							String HtmlList = HTMLUtility.getList("duration", dto.getDuration(), map);
					%>           
				<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=HtmlList%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("duration", request) %></font>
                   	</div>
    
    
    
                            <%if (id>0){ %>
                           <div class="text-center"  id="defaultForm-email">
                           <input class="button" type="submit"  name="operation" value="<%=CourseCtl.OP_UPDATE%>">
                           <input class="button" type="submit"  name="operation" value="<%=CourseCtl.OP_CANCEL%>">
                          
                            </div>
                          
                          <%}else{ %> 
                           <div class="text-center"  id="defaultForm-email">
                           <input class="button" type="submit"  name="operation" value="<%=CourseCtl.OP_SAVE%>">
                           <input class="button" type="submit"  name="operation" value="<%=CourseCtl.OP_RESET%>">
                          
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
</html>
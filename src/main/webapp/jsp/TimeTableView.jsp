<%@page import="java.util.TimerTask"%>
<%@page import="in.co.rays.project_3.controller.TimeTableCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Time Table</title>
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
		  endDate: '-18y',
		  minDate:0
		
    	
		 }) ;
  } );
  </script>

<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.TimeTableDTO" />
<form action="<%=ORSView.TIMETABLE_CTL%>" method="post">
<!-- getting role list for preload -->
<%List courseList= (List)request.getAttribute("courseList"); 
List sujectList= (List)request.getAttribute("sujectList");
%> 

    
    
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
                       
                           <h3 class="text-center default-text py-3"><%=(id==0)? "Add TimeTable": "Update TimeTable" %></h3>
                            
                          
                            <!--Body-->
                            
                            		<%if(!ServletUtility.getSuccessMessage(request).equals("")){ %>
    <div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Success!</strong><%=ServletUtility.getSuccessMessage(request) %>
    </div>
    <%} %>                            
	
	<%if(!ServletUtility.getErrorMessage(request).equals("")){ %>
<div class="alert alert-danger alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Error!</strong><%=ServletUtility.getErrorMessage(request) %>
  </div>
<%} %>                            
		
            <input type="hidden" name="id" value="<%=dto.getId()%>">
            <input type="hidden" name="createdBy" value="<%=dto.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=dto.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">
                            
                           <h6 class="ml-5" style="color: #20B2AA ">Course<font color="red">*</font></h6>
                           
                           <div class="md-form">

		                     <div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=HTMLUtility.getList("course", String.valueOf(dto.getCourseId()), courseList)%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("course", request) %></font>

</div>



                        
                        
                           <h6 class="ml-5" style="color: #20B2AA ">Subject<font color="red">*</font></h6>
                           
                           <div class="md-form">

		<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=HTMLUtility.getList("subject", String.valueOf(dto.getSubId()), sujectList)%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("subject", request) %></font>


                          </div>




                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Semester<font color="red">*</font></h6>
                           
                           
                           <%HashMap<String,String> map=new HashMap<String,String>();
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
                           String semester=HTMLUtility.getList("semester",dto.getSemester(), map);
                           %>
                          <div class="md-form">
                    		<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=semester%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("semester", request) %></font>



                          </div>
                         
                         
                         
                         
                         <div class="ml-5">
                           <h6 class="default-text" >Exam Date<font color="red">*</font></h6>
                           </div>
                           
                           
                           <div class="md-form">
                           
          					 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text">@</span>
                                 </div>
                        <input readonly="readonly" type="text" id="datepicker" placeholder="Enter examdate" class="form-control border" name="examdate" value="<%=DataUtility.getDateString(dto.getExamDate())%>">
                               
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("examdate",request) %> </font>
                           
                           
                                                   </div>
                          
                          
                          
                          
                          
                          
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Exam Time<font color="red">*</font></h6>

          <%HashMap<String,String> map1=new HashMap<String,String>();
            map1.put("08:00 AM to 11:00 AM", "08:00 AM to 11:00 AM");
			map1.put("12:00PM to 3:00PM", "12:00PM to 3:00PM");
			map1.put("3:00PM to 6:00PM", "3:00PM to 6:00PM");
                           %>
                          <div class="md-form">
                    
                    
                    		<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=HTMLUtility.getList("examTime", dto.getExamTime(), map1)%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("examTime", request) %></font>
                    
                    
                          </div>
                           
                           
                   
                   
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Description<font color="red">*</font></h6>                           
                           <div class="md-form" >
                           							 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text">@</span>
                                 </div>
                        <input type="text" placeholder="Enter description" class="form-control border" name="description" value="<%=DataUtility.getStringData(dto.getDescription())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("description",request) %> </font>
                           
                           
                           </div>
                           
                           
                          
                          <%if (id>0){ %>
                           <div class="text-center"  id="defaultForm-email">
                           <input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=TimeTableCtl.OP_UPDATE%>">
                           <input  class="btn btn-warning btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=TimeTableCtl.OP_CANCEL%>">
                          
                            </div>
                          
                          <%}else{ %> 
                           <div class="text-center"  id="defaultForm-email">
                           <input  class="btn btn-success btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=TimeTableCtl.OP_SAVE%>">
                           <input  class="btn btn-warning btn-md" style="font-size: 17px" type="submit"  name="operation" value="<%=TimeTableCtl.OP_RESET%>">
                          
                            </div>
                             <%} %>
                        </div>
                    </div>
                </div>
                <div class="col-md-3"></div>
               </div>
               </div>




<div>

</div>
</form>
</body>
<%@include file="Footer.jsp" %>
</html>
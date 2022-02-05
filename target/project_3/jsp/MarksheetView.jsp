<%@page import="in.co.rays.project_3.controller.MarksheetCtl"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Marksheet View</title>
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
border-radius:10px;padding:10px;color:white;font-size:20px;background-color:#00cc88
}
.textfield{
border: 1px solid #8080803b;height: 38px; padding-left: 6px;
}
</style>
<script type="text/javascript">
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57))
      return false;

   return true;
}



</script>


</head>

<body  class="hm-gradient">
<jsp:useBean id="dto" scope="request" class="in.co.rays.project_3.dto.MarksheetDTO" />
<div>
<%@include file="Header.jsp" %>
</div>
<form action="<%=ORSView.MARKSHEET_CTL%>" method="post">

<%List studentList=(List)request.getAttribute("studentList"); %>

    
    
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
                         <h3 class="text-center default-text py-3"><%=(id==0)? "Add Marksheet": "Update Marksheet" %></h3>
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
                            
                            
                            
                            
                            
                          <h6 class="ml-5" style="color: #20B2AA " >Roll No<font color="red">*</font></h6>
                            
                            <div class="md-form">

         <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input type="text" placeholder="Enter rollNo" class="form-control border" name="rollNo" value="<%=DataUtility.getStringData(dto.getRollNo())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("rollNo",request) %> </font>

                               </div>
                           
                           
                           <%String student=HTMLUtility.getList("studentId",String.valueOf(dto.getStudentId()),studentList); %>
                           <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Student Name<font color="red">*</font></h6>
                           
                          <div class="md-form">
                 
                 		<div class="input-group mb-3">
                             <div class="input-group-prepend">
                             <span class="input-group-text"><i style="width: 17px" class="fa fa-venus-mars"></i></span>
                                      </div>
                           	<%=student%>
                                      </div>
								<font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("student", request) %></font>
    
                 
                          </div>
                           
                            
                            
                            <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Physics<font color="red">*</font></h6>
                            <div class="md-form">
                                    <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input onkeypress="return isNumberKey(event)" type="text" placeholder="Enter physics" class="form-control border" name="physics" value="<%=DataUtility.getStringData(dto.getPhysics()).equals("0")?"":DataUtility.getStringData(dto.getPhysics())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("physics",request) %> </font>
                           
                           
                                </div>
                            
                            
                            
                             <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Chemistry<font color="red">*</font></h6>
                            <div class="md-form">
                        
                                 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input onkeypress="return isNumberKey(event)" type="text" placeholder="Enter chemistry" class="form-control border" name="chemistry" value="<%=DataUtility.getStringData(dto.getChemistry()).equals("0")?"":DataUtility.getStringData(dto.getChemistry())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("chemistry",request) %> </font>
                        
                                </div>
                            
                            
                             <h6 class="ml-5 paddingclass" style="color: #20B2AA " >Maths<font color="red">*</font></h6>
                            <div class="md-form">
         
                  <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text"><i style="width: 17px"  class="fa fa-user"></i></span>
                                 </div>
                        <input onkeypress="return isNumberKey(event)" type="text" placeholder="Enter maths" class="form-control border" name="maths" value="<%=DataUtility.getStringData(dto.getMaths()).equals("0")?"":DataUtility.getStringData(dto.getMaths())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("maths",request) %> </font>
         
                                </div>
                            
                            
                            
                                                        <%if (id>0){ %>
                           <div class="text-center"  id="defaultForm-email">
                           <input class="button" type="submit"  name="operation" value="<%=MarksheetCtl.OP_UPDATE%>">
                           <input class="button" type="submit"  name="operation" value="<%=MarksheetCtl.OP_CANCEL%>">
                          
                            </div>
                          
                          <%}else{ %> 
                           <div class="text-center"  id="defaultForm-email">
                           <input class="button" type="submit"  name="operation" value="<%=MarksheetCtl.OP_SAVE%>">
                           <input class="button" type="submit"  name="operation" value="<%=MarksheetCtl.OP_RESET%>">
                          
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
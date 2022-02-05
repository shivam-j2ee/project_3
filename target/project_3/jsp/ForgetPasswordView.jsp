<%@page import="in.co.rays.project_3.controller.ForgetPasswordCtl"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forget Password</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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


.paddingclass {
	padding-top: 10px;
}

.textfield {
	border: 1px solid #8080803b;
	height: 38px;
	padding-left: 6px;
}
</style>
<style type="text/css">
.setForm {
	padding-top: 5%;
	padding-left: 25%;
	width: 130%
}

.button {
	border-radius: 10px;
	padding: 10px;
	color: white;
	font-size: 20px;
	background-color: #00cc88
}
</style>
</head>

<body class="hm-gradient">
	<jsp:useBean id="dto" scope="request"
		class="in.co.rays.project_3.dto.UserDTO" />
	<div>
		<%@include file="Header.jsp"%>
	</div>
	<form action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="post">





<br>
<br>
<br>

		<main> <!--MDB Forms-->
		<div class="container mt-4">


			<!-- Grid row -->
			<div class="row">
				<div class="col-md-3"></div>
				<!-- Grid column -->
				<div class="col-md-6">
					<div class="card">
						<div class="card-body">

							<h3 class="text-center default-text py-3">Forget Password:</h3>
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
							<h5>	<strong>Error!</strong><font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
							  </h5>  </div>
							<%} %>



							<h6 style="color: #20B2AA">
								<b>Please Enter Your Email:</b>
							</h6>
							<div class="md-form">
							
							
							 <div class="input-group">
                            <div class="input-group-prepend">
                               <span class="input-group-text">@</span>
                                 </div>
                        <input type="text" placeholder="Enter Email" class="form-control border" name="login" value="<%=DataUtility.getStringData(dto.getLogin())%>">
                                </div>
							<font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("login",request) %> </font>
							
                                 </div>							
							
									
					
								
							<div class="text-center">
								<input class="btn btn-success btn-md" style="font-size: 17px" type="submit" class="button" name="operation"
									value="<%=ForgetPasswordCtl.OP_GO%>">
							</div>
						</div>
					</div>
				</div>


				<div class="col-md-3"></div>
			</div>
		</div>
	</form>
</body>
<%@ include file="Footer.jsp" %>
</html>
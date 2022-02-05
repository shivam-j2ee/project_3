<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- date picker library -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".datepicker" ).datepicker({ 
    	changeMonth :true,
		  changeYear :true,
		  yearRange :'1980:2030',
		  dateFormat:'dd/mm/yy',
		  endDate: '-18y'	 
		 }) ;
  } );
  </script>
  
  <style type="text/css">
  .form-controller{
  background: #fff;
  padding: 30px;
  border-radius:10px;
  box-shadow:0px 0px 10px 0px #000;
  
  }
  </style>

</head>
<body>
<div>
<%@include file="Header.jsp" %>
</div>
<div class="container-fluid">
<div class="row">
<div class="col-12 col-sm-6 col-md-3">
<form class="form-controller">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
 
 
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control datepicker" >
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>
</div>




</body>
</html>
package in.co.rays.project_3.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.RoleDTO;
import in.co.rays.project_3.dto.UserDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.UserModelInt;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.DataValidator;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;
import javassist.bytecode.stackmap.BasicBlock.Catch;

@WebServlet(name="UserRegistrationCtl",urlPatterns={"/UserRegistrationCtl"})
public class UserRegistrationCtl extends BaseCtl{
private static Logger log=Logger.getLogger(UserRegistrationCtl.class);
public static final String OP_SIGN_UP="SignUp";
protected boolean validate(HttpServletRequest request) {
	log.debug("UserRegistrationCtl Method validate Started");
	boolean pass=true;
	String fname= request.getParameter("firstName");
	String lname=request.getParameter("lastName");
	String mobile=request.getParameter("mobileNumber");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String confirmPassword=request.getParameter("confirmPassword");
	String gender=request.getParameter("gender");
	String dob=request.getParameter("dob");
	if(DataValidator.isNull(fname)){
		request.setAttribute("firstName",PropertyReader.getValue("error.require", "First Name"));
	pass=false;
	}else if (DataValidator.isNotNull(fname)&&!DataValidator.isName(fname)){
		request.setAttribute("firstName","please enter correct name");
		pass=false;
	}
	
	
	
	
	if(DataValidator.isNull(lname)){
		request.setAttribute("lastName",PropertyReader.getValue("error.require", "Last Name"));
		pass=false;
	}else if(DataValidator.isNotNull(lname)&&!DataValidator.isName(lname)){
		request.setAttribute("lastName","please enter correct name");
		pass=false;
	}
	
	
	
	
	
	
	if(DataValidator.isNull(mobile)){
		request.setAttribute("mobileNumber",PropertyReader.getValue("error.require", "Mobile Number"));
		pass=false;
	}else if (DataValidator.isNotNull(mobile)&&!DataValidator.isPhoneNo(mobile)) {
		request.setAttribute("mobileNumber", "please enter valid MobileNumber");
		pass=false;
	}
	
	
	
	
	
	if(DataValidator.isNull(email)){
		request.setAttribute("email",PropertyReader.getValue("error.require", "Email"));
		pass=false;
	}else  if(!DataValidator.isEmail(email)){
		request.setAttribute("email", PropertyReader.getValue("error.email", "Email"));
	}

	
	
	if(DataValidator.isNull(password)){
		request.setAttribute("password",PropertyReader.getValue("error.require", "Password"));
		pass=false;
	}else if (!DataValidator.isPasswordLength(password)) {
		request.setAttribute("password","Password Length should be in between 8 to 12");
		pass=false;
	}else if (!DataValidator.isPassword(password)) {
		request.setAttribute("password","Password contain Upper case,lower case and special character");
		pass=false;
	}
	
	
	
	
	if(DataValidator.isNull(confirmPassword)){
		request.setAttribute("confirmPassword",PropertyReader.getValue("error.require", "ConfirmPassword"));
		pass=false;
	}
	
	if(DataValidator.isNull(gender)){
		request.setAttribute("gender",PropertyReader.getValue("error.require", "Gender"));
		pass=false;
	}
	
	
	if(DataValidator.isNull(dob)){
		request.setAttribute("dob",PropertyReader.getValue("error.require", "Date of Birth"));
		pass=false;
	}else if(DataValidator.isNotNull(dob)&&!DataValidator.isValidAge(dob)){
		request.setAttribute("dob","age must be above 18");
		pass=false;
		
	}
    
	
	if (!password.equals(confirmPassword)
            && !"".equals(confirmPassword)) {
        ServletUtility.setErrorMessage("Confirm  Password  should not be matched.", request);

        pass = false;
    }
    log.debug("UserRegistrationCtl Method validate Ended");

    return pass;
}
@Override
protected BaseDTO populateDTO(HttpServletRequest request){
	UserDTO dto=new UserDTO();
	String fname= request.getParameter("firstName");
	String lname=request.getParameter("lastName");
	String mobile=request.getParameter("mobileNumber");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String confirmPassword=request.getParameter("confirmPassword");
	String gender=request.getParameter("gender");
	String dob=request.getParameter("dob");
    
	dto.setId(DataUtility.getLong(request.getParameter("id")));
	dto.setRoleId(RoleDTO.STUDENT);
	dto.setFirstName(DataUtility.getString(fname));
	dto.setLastName(DataUtility.getString(lname));
	dto.setMobileNo(DataUtility.getString(mobile));
	dto.setLogin(DataUtility.getString(email));
	dto.setPassword(DataUtility.getString(password));
	dto.setConfirmPassword(DataUtility.getString(confirmPassword));
	dto.setGender(DataUtility.getString(gender));
	dto.setDob(DataUtility.getDate(dob));
	return dto;
}

@Override
protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
	  log.debug("UserRegistrationCtl Method doGet Started");
      ServletUtility.forward(getView(), request, response);
	
}


@Override
protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
	   log.debug("UserRegistrationCtl Method doPost Started");
	   String op=DataUtility.getString(request.getParameter("operation"));
	   UserModelInt model=ModelFactory.getInstance().getUserModel();
	   long id=DataUtility.getLong(request.getParameter("id"));
	   if(OP_SIGN_UP.equalsIgnoreCase(op)){
		   UserDTO dto=(UserDTO)populateDTO(request);
		   try {
          long pk=model.registerUser(dto);
          dto.setId(pk);
          request.getSession().setAttribute("UserDTO",dto);
          ServletUtility.redirect(ORSView.LOGIN_CTL, request, response);
          return;
		} catch (ApplicationException e) {
          log.error(e);
          ServletUtility.handleException(e, request, response);
          return;
		} catch (DuplicateRecordException e) {
          log.error(e);
          ServletUtility.setDto(dto, request);
          ServletUtility.setErrorMessage("Login Id already Exist", request);
          ServletUtility.forward(ORSView.USER_REGISTRATION_VIEW, request, response);
          return;
}
	   }else if(OP_RESET.equalsIgnoreCase(op)){
       	ServletUtility.redirect(ORSView.USER_REGISTRATION_CTL, request, response);
        return;
    }
    log.debug("UserRegistrationCtl Method doPost Ended");

}
@Override
protected String getView() {
	// TODO Auto-generated method stub
	return ORSView.USER_REGISTRATION_VIEW;
}
}

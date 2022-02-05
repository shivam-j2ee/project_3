package in.co.rays.project_3.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.RoleDTO;
import in.co.rays.project_3.dto.UserDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.RoleModelInt;
import in.co.rays.project_3.model.UserModelInt;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.DataValidator;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

/**
 * Login functionality Controller. Performs operation for Login
 *  
 *  
 * @author Shivam Tiwari
 */

@WebServlet(urlPatterns={"/LoginCtl"},name="LoginCtl")
public class LoginCtl extends BaseCtl {
	 private static final long serialVersionUID = 1L;
	 public static final String OP_REGISTER = "Register";
	 public static final String OP_SIGN_IN = "SignIn";
	 public static final String OP_SIGN_UP = "SignUp";
	 public static final String OP_LOG_OUT = "logout";
	 private static Logger log = Logger.getLogger(LoginCtl.class);
	 @Override
	 protected boolean validate(HttpServletRequest request){
		 log.debug("LoginCtl Method validate Started");
		 boolean pass=true;
		 String op=DataUtility.getString(request.getParameter("operation"));
		 if(OP_SIGN_UP.equals(op)||OP_LOG_OUT.equals(op)){
			 return pass;
			 }
		 if(DataValidator.isNull(DataUtility.getString(request.getParameter("login")))){
			 request.setAttribute("login", PropertyReader.getValue("error.require","Login ID"));
			 pass=false;
		 }else if (!DataValidator.isEmail(DataUtility.getString(request.getParameter("login")))) {
	            request.setAttribute("login",
	                    PropertyReader.getValue("error.email", "Login "));
	            pass = false;
	        }

		 
		 
		 
		 
		 if(DataValidator.isNull(DataUtility.getString(request.getParameter("password")))){
			 request.setAttribute("password", PropertyReader.getValue("error.require","Password"));
			 pass=false;
		 }
		 log.debug("LoginCtl Method validate Ended");
		 return pass;
	 }
	 @Override
	    protected BaseDTO populateDTO(HttpServletRequest request) {
	 
	        log.debug("LoginCtl Method populateDTO Started");
	 
	        UserDTO dto = new UserDTO();
	 
	        dto.setId(DataUtility.getLong(request.getParameter("id")));
	        dto.setLogin(DataUtility.getString(request.getParameter("login")));
	        dto.setPassword(DataUtility.getString(request.getParameter("password")));
	 
	        log.debug("LoginCtl Method populateDTO Ended");
	 
	        return dto;
	    }
	   protected void doGet(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
	        HttpSession session = request.getSession(true);
	        log.debug(" Method doGet Started");

	        String op = DataUtility.getString(request.getParameter("operation"));

	        // get model
	        UserModelInt model =ModelFactory.getInstance().getUserModel();
	        RoleModelInt role =ModelFactory.getInstance().getRoleModel() ;
	        
	         if (OP_LOG_OUT.equals(op)) {

	            session = request.getSession();
	            request.setAttribute("1",1);
	            ServletUtility.setSuccessMessage("Logout Successfully", request);
	            session.invalidate();
	                
	            ServletUtility.forward(ORSView.LOGIN_VIEW, request, response);

	            return;

	        }else{
	        	 request.setAttribute("1",0);
	        }
	         

	        ServletUtility.forward(getView(), request, response);

	        log.debug("UserCtl Method doPost Ended");

	    }

	 /**
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	     *      response)
	     */
	    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
	    HttpSession session=request.getSession(true);
	    log.debug(" Method doGet Started");
	    String op=DataUtility.getString(request.getParameter("operation"));
	   
	    UserModelInt model=ModelFactory.getInstance().getUserModel();
	    
	    RoleModelInt role=ModelFactory.getInstance().getRoleModel();
	    
	    long id = DataUtility.getLong(request.getParameter("id"));
	    
	    if (OP_SIGN_IN.equalsIgnoreCase(op)) {
	    	 
            UserDTO dto = (UserDTO) populateDTO(request);
 
            try {
                dto = model.authenticate(dto.getLogin(), dto.getPassword());
 
                if (dto != null) {
                    session.setAttribute("user", dto);
                    long rollId = dto.getRoleId();
 
                    RoleDTO roleDTO = role.findByPK(rollId);
 
                    if (roleDTO != null) {
                        session.setAttribute("role", roleDTO.getName());
                    }
 
                    String uri =request.getParameter("uri");
					if (uri == null || "null".equalsIgnoreCase(uri)) {
						ServletUtility.redirect(ORSView.WELCOME_CTL, request, response);
						return;
					} else {
						
							ServletUtility.redirect(uri, request, response);
						
						
						return;
					}

				}else {
                    dto = (UserDTO) populateDTO(request);
                    ServletUtility.setDto(dto, request);
                    ServletUtility.setErrorMessage(
                            "Invalid LoginId And Password", request);
                }

            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }

	    }else if(OP_SIGN_UP.equalsIgnoreCase(op)){
	    	ServletUtility.redirect(ORSView.USER_REGISTRATION_CTL, request, response);
	    	return;
	    }
	    else {
	    	 if (id > 0 || op != null) {
	                UserDTO userDTO;
	                try {
	                    userDTO = model.findByPK(id);
	                    ServletUtility.setDto(userDTO, request);
	                } catch (ApplicationException e) {
	                    log.error(e);
	                    ServletUtility.handleException(e, request, response);
	                    return;
	                }
	            }
		}
	    ServletUtility.forward(ORSView.LOGIN_VIEW, request, response);
	    log.debug("UserCtl Method doGet Ended");
	    }
	@Override
	protected String getView() {
		return ORSView.LOGIN_VIEW;
	}

}

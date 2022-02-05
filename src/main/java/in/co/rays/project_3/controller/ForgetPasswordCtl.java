package in.co.rays.project_3.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.UserDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.RecordNotFoundException;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.UserModelInt;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.DataValidator;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

@WebServlet(name="ForgetPasswordCtl" ,urlPatterns={"/ForgetPasswordCtl"})
public class ForgetPasswordCtl extends BaseCtl {
	private static Logger log = Logger.getLogger(ForgetPasswordCtl.class);
	
	@Override
	protected boolean validate(HttpServletRequest request) {

		 log.debug("ForgetPasswordCtl Method validate Started");

	        boolean pass = true;

	        String login = request.getParameter("login");

	        if (DataValidator.isNull(login)) {
	            request.setAttribute("login",
	                    PropertyReader.getValue("error.require", "Email Id"));
	            pass = false;
	        } else if (!DataValidator.isEmail(login)) {
	            request.setAttribute("login",
	                    PropertyReader.getValue("error.email", "Login "));
	            pass = false;
	        }
	        log.debug("ForgetPasswordCtl Method validate Ended");

	        return pass;

	}
	
	@Override
	protected BaseDTO populateDTO(HttpServletRequest request) {
        log.debug("ForgetPasswordCtl Method populatebean Started");

        UserDTO dto = new UserDTO();

        dto.setLogin(DataUtility.getString(request.getParameter("login")));

        log.debug("ForgetPasswordCtl Method populatebean Ended");

        return dto;

	
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		log.debug("ForgetPasswordCtl Method doGet Started");

        ServletUtility.forward(getView(), request, response);

	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        log.debug("ForgetPasswordCtl Method doPost Started");

        String op = DataUtility.getString(request.getParameter("operation"));

        UserDTO dto = (UserDTO) populateDTO(request);

        // get model
        UserModelInt model=ModelFactory.getInstance().getUserModel();

        if (OP_GO.equalsIgnoreCase(op)) {

            try {
                model.forgetPassword(dto.getLogin());
                ServletUtility.setSuccessMessage(
                        "Password has been sent to your email id.", request);
            } catch (RecordNotFoundException e) {
                ServletUtility.setErrorMessage(e.getMessage(), request);
                log.error(e);
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }
ServletUtility.setDto(dto, request);
            ServletUtility.forward(getView(), request, response);
        }

        log.debug("ForgetPasswordCtl Method doPost Ended");

	
	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.FORGET_PASSWORD_VIEW;
	}
	
	
}

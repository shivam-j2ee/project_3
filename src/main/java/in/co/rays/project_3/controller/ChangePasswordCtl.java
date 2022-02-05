package in.co.rays.project_3.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

@WebServlet(name="ChangePasswordCtl",urlPatterns="/ctl/ChangePasswordCtl")
public class ChangePasswordCtl extends BaseCtl {
	public static final String OP_CHANGE_MY_PROFILE = "Change My Profile";

    private static Logger log = Logger.getLogger(ChangePasswordCtl.class);

    @Override
    protected boolean validate(HttpServletRequest request) {
        log.debug("ChangePasswordCtl Method validate Started");

        boolean pass = true;

        String op = request.getParameter("operation");

        if (OP_CHANGE_MY_PROFILE.equalsIgnoreCase(op)) {

            return pass;
        }
        if (DataValidator.isNull(request.getParameter("oldPassword"))) {
            request.setAttribute("oldPassword",
                    PropertyReader.getValue("error.require", "Old Password"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("newPassword"))) {
            request.setAttribute("newPassword",
                    PropertyReader.getValue("error.require", "New Password"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("confirmPassword"))) {
            request.setAttribute("confirmPassword", PropertyReader.getValue(
                    "error.require", "Confirm Password"));
            pass = false;
        }
        if (!request.getParameter("newPassword").equals(
                request.getParameter("confirmPassword"))
                && !"".equals(request.getParameter("confirmPassword"))) {
            ServletUtility.setErrorMessage(
                    "New and confirm passwords not matched", request);

            pass = false;
        }

        log.debug("ChangePasswordCtl Method validate Ended");

        return pass;

    
    }
    
    @Override
    protected BaseDTO populateDTO(HttpServletRequest request) {

        log.debug("ChangePasswordCtl Method populatebean Started");

        UserDTO dto = new UserDTO();

        dto.setPassword(DataUtility.getString(request
                .getParameter("oldPassword")));

        dto.setConfirmPassword(DataUtility.getString(request.getParameter("confirmPassword")));


        log.debug("ChangePasswordCtl Method populatebean Ended");

        return dto;

    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    ServletUtility.forward(getView(), request, response);

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    	
        HttpSession session = request.getSession(true);

        log.debug("ChangePasswordCtl Method doGet Started");

        String op = DataUtility.getString(request.getParameter("operation"));

        // get model
        UserModelInt model =ModelFactory.getInstance().getUserModel();

        UserDTO dto = (UserDTO) populateDTO(request);

        UserDTO UserBean = (UserDTO) session.getAttribute("user");

        String newPassword = (String) request.getParameter("newPassword");

        long id = UserBean.getId();

        if (OP_SAVE.equalsIgnoreCase(op)) {
            try {
                boolean flag = model.changePassword(id,dto.getPassword(),newPassword);
                if (flag == true) {
                    dto = model.findByLogin(UserBean.getLogin());
                    session.setAttribute("user",dto);
                    ServletUtility.setDto(dto, request);
                    ServletUtility.setSuccessMessage(
                            "Password has been changed Successfully.", request);
                }
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;

            } catch (RecordNotFoundException e) {
                ServletUtility.setErrorMessage("Old PassWord is Invalid",
                        request);
            }
        } else if (OP_CHANGE_MY_PROFILE.equalsIgnoreCase(op)) {
            ServletUtility.redirect(ORSView.MY_PROFILE_CTL, request, response);
            return;
        }

        ServletUtility.forward(ORSView.CHANGE_PASSWORD_VIEW, request, response);
        log.debug("ChangePasswordCtl Method doGet Ended");

    
    }

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.CHANGE_PASSWORD_VIEW;
	}
    
}

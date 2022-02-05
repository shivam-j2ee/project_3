package in.co.rays.project_3.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.CollegeDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.model.CollegeModelInt;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.DataValidator;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

@WebServlet(name="CollegeCtl",urlPatterns={"/ctl/CollegeCtl"})
public class CollegeCtl extends BaseCtl {
	private static Logger log = Logger.getLogger(CollegeCtl.class);

@Override
protected boolean validate(HttpServletRequest request) {
	log.debug("CollegeCtl Method validate Started");
	boolean pass=true;
    
	String collegeName= request.getParameter("collegeName");
	String address= request.getParameter("address");
	String state= request.getParameter("state");
	String city= request.getParameter("city");
	String mobileNo= request.getParameter("mobileNo");
	
    if (DataValidator.isNull(collegeName)) {
        request.setAttribute("collegeName",PropertyReader.getValue("error.require", "College Name"));
        pass = false;
    }

    if (DataValidator.isNull(address)) {
        request.setAttribute("address",PropertyReader.getValue("error.require", "Address"));
        pass = false;
    }

    if (DataValidator.isNull(state)) {
        request.setAttribute("state",PropertyReader.getValue("error.require", "State"));
        pass = false;
    }
    if (DataValidator.isNull(city)) {
        request.setAttribute("city",PropertyReader.getValue("error.require", "City"));
        pass = false;
    }
    if (DataValidator.isNull(mobileNo)) {
        request.setAttribute("mobileNo",PropertyReader.getValue("error.require", "Phone No"));
        pass = false;
    }

    log.debug("CollegeCtl Method validate Ended");

    return pass;
}
@Override
protected BaseDTO populateDTO(HttpServletRequest request) {
	CollegeDTO dto=new CollegeDTO();
	
	dto.setId(DataUtility.getLong(request.getParameter("id")));
	dto.setName(DataUtility.getString(request.getParameter("collegeName")));
	dto.setAddress(DataUtility.getString(request.getParameter("address")));
	dto.setCity(DataUtility.getString(request.getParameter("city")));
	dto.setState(DataUtility.getString(request.getParameter("state")));
    dto.setPhoneNo(DataUtility.getString(request.getParameter("mobileNo")));
    
	return dto;
}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String op = DataUtility.getString(request.getParameter("operation"));
		 CollegeModelInt model=ModelFactory.getInstance().getCollegeModel();
	        long id = DataUtility.getLong(request.getParameter("id"));
	        if (id > 0) {
	            CollegeDTO dto;
	            try {
	                dto = model.findByPK(id);
	                ServletUtility.setDto(dto, request);
	            } catch (ApplicationException e) {
	                log.error(e);
	                ServletUtility.handleException(e, request, response);
	                return;
	            }
	        }

	        ServletUtility.forward(getView(), request, response);
	        }
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        log.debug("CollegeCtl Method doPost Started");

        String op = DataUtility.getString(request.getParameter("operation"));

        // get model
        CollegeModelInt model = ModelFactory.getInstance().getCollegeModel();

        long id = DataUtility.getLong(request.getParameter("id"));

        if (OP_SAVE.equalsIgnoreCase(op)||OP_UPDATE.equalsIgnoreCase(op)) {

            CollegeDTO dto = (CollegeDTO) populateDTO(request);

            try {
                if (id > 0) {
                    model.update(dto);
                    ServletUtility.setDto(dto, request);
                    ServletUtility.setSuccessMessage("Data is successfully Updated",
                            request);
                } else {
                    model.add(dto);
                    
                    ServletUtility.setDto(dto, request);
                    ServletUtility.setSuccessMessage("Data is successfully saved",
                            request);
                }
                

            } catch (ApplicationException e) {
                e.printStackTrace();
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            } catch (DuplicateRecordException e) {
                ServletUtility.setDto(dto, request);
                ServletUtility.setErrorMessage("College Name already exists",
                        request);
            }

        } else if (OP_DELETE.equalsIgnoreCase(op)) {

            CollegeDTO dto = (CollegeDTO) populateDTO(request);
            try {
                model.delete(dto);
                ServletUtility.redirect(ORSView.COLLEGE_LIST_CTL, request,
                        response);
                return;

            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }

        } else if (OP_CANCEL.equalsIgnoreCase(op)) {

            ServletUtility.redirect(ORSView.COLLEGE_LIST_CTL, request, response);
            return;

        }else if(OP_RESET.equalsIgnoreCase(op)){
        	ServletUtility.redirect(ORSView.COLLEGE_CTL, request, response);
        	return;
        }

        ServletUtility.forward(getView(), request, response);

        log.debug("CollegeCtl Method doGet Ended");
    }


	
	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.COLLEGE_VIEW;
	}
}

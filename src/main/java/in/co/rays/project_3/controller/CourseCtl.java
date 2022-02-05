package in.co.rays.project_3.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.CourseDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.model.CourseModelInt;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.DataValidator;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

@WebServlet(name = "CourseCtl", urlPatterns = { "/ctl/CourseCtl" })
public class CourseCtl extends BaseCtl {
	private static Logger log = Logger.getLogger(CourseCtl.class);

	
	
	
	@Override
	protected boolean validate(HttpServletRequest request) {
		boolean pass = true;
		String courseName = request.getParameter("courseName");
		String duration = request.getParameter("duration");
		String description = request.getParameter("description");

		if (DataValidator.isNull(courseName)) {
			request.setAttribute("courseName", PropertyReader.getValue("error.require", "Course Name"));
			pass = false;
		}
		if (DataValidator.isNull(description)) {
			request.setAttribute("description", PropertyReader.getValue("error.require", "Description"));
			pass = false;
		}
		if (DataValidator.isNull(duration)) {
			request.setAttribute("duration", PropertyReader.getValue("error.require", "Duration"));
		}
		log.debug("CourseCtl Method validate Ended");
		return pass;
	}

	@Override
	protected BaseDTO populateDTO(HttpServletRequest request) {
		CourseDTO dto = new CourseDTO();

		dto.setId(DataUtility.getLong(request.getParameter("id")));
		dto.setCourseName(DataUtility.getString(request.getParameter("courseName")));
		dto.setDescription(DataUtility.getString(request.getParameter("description")));
		dto.setDuration(DataUtility.getString(request.getParameter("duration")));

		return dto;
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("CourseCtl Method doGet Started");
		String op = DataUtility.getString(request.getParameter("operation"));
		CourseModelInt model =ModelFactory.getInstance().getCourseModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		if (id > 0 || op != null) {
			CourseDTO dto;
			try {
				dto= model.findByPK(id);
				ServletUtility.setDto(dto, request);
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}
		}
		ServletUtility.forward(getView(), request, response);
		log.debug("UserCtl Method doGet Ended");
	}

   @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("CourseCtl Method doPost Started");
		String op=DataUtility.getString(request.getParameter("operation"));
	CourseModelInt model=ModelFactory.getInstance().getCourseModel();
	long id=DataUtility.getLong(request.getParameter("id"));
	if(OP_SAVE.equalsIgnoreCase(op) ||OP_UPDATE.equalsIgnoreCase(op)){
		CourseDTO dto=(CourseDTO)populateDTO(request);
		try{
			if(id>0){
				model.update(dto);
				ServletUtility.setDto(dto, request);
	            ServletUtility.setSuccessMessage("Data is successfully Updated",
	                    request);
			}else{
				long pk=model.add(dto);
				ServletUtility.setDto(dto, request);
	            ServletUtility.setSuccessMessage("Data is successfully saved",
	                    request);
			}
			
		}catch(ApplicationException e){
			log.error(e);
            ServletUtility.handleException(e, request, response);
            return;
		}catch(DuplicateRecordException e){
			 ServletUtility.setDto(dto, request);
             ServletUtility.setErrorMessage("Login id already exists",
                     request);	
		}
	}else if(OP_DELETE.equalsIgnoreCase(op)){
		CourseDTO dto = (CourseDTO) populateDTO(request);
        try {
            model.delete(dto);
            ServletUtility.redirect(ORSView.COURSE_LIST_CTL, request,
                    response);
            return;
        } catch (ApplicationException e) {
            log.error(e);
            ServletUtility.handleException(e, request, response);
            return;
        }

    } else if (OP_CANCEL.equalsIgnoreCase(op)) {

        ServletUtility.redirect(ORSView.COURSE_LIST_CTL, request, response);
        return;
    }
    ServletUtility.forward(getView(), request, response);

    log.debug("CourseCtl Method doPostEnded");
}

	@Override
	protected String getView() {
		return ORSView.COURSE_VIEW;
	}

}

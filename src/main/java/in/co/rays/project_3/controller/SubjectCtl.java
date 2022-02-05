package in.co.rays.project_3.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.SubjectDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.model.CourseModelInt;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.SubjectModelInt;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.DataValidator;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

@WebServlet(name="SubjectCtl",urlPatterns={"/ctl/SubjectCtl"})
public class SubjectCtl extends BaseCtl{
	private static final long serialVersionUID = 1L;
	private static Logger log=Logger.getLogger(SubjectCtl.class);
	protected void  preload(HttpServletRequest request) {
		CourseModelInt courseModel=ModelFactory.getInstance().getCourseModel();
		try {
			List l=courseModel.list();
			request.setAttribute("courseList",l);
		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			log.error(e);
		}
	}

	
	
	@Override
	protected boolean validate(HttpServletRequest request) {
		   log.debug("SubjectCtl Method Validate Started ");
    	   boolean pass=true;
    	   if (DataValidator.isNull(request.getParameter("subject"))){
    		  request.setAttribute("subject",PropertyReader.getValue("error.require","Subject Name"));
    	  pass=false;
    	  }
    	  if (DataValidator.isNull(request.getParameter("course"))){
    		  request.setAttribute("course",PropertyReader.getValue("error.require","Course Name"));
    	  pass=false;
    	  }
    	  if (DataValidator.isNull(request.getParameter("description"))){
    		  request.setAttribute("description",PropertyReader.getValue("error.require","Description"));
    	  pass=false;
    	  }
    	  log.debug("SubjectCtl Method validate Ended");
    	  
    	   return pass;
}
	
	@Override
	protected BaseDTO populateDTO(HttpServletRequest request) {
 	   log.debug("SubjectCtl Method populatebean Started");
		   SubjectDTO bean=new SubjectDTO();
		   bean.setId(DataUtility.getLong(request.getParameter("id")));
	       bean.setSubjectName(DataUtility.getString(request.getParameter("subject")));
	      
            bean.setCourseId(DataUtility.getLong(request.getParameter("course")));
        bean.setDescription(DataUtility.getString(request.getParameter("description")));
        log.debug("SubjectCtl Method populatebean Ended");
    return bean;
}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("SubjectCtl Method doGet Started");
	String op=DataUtility.getString(request.getParameter("operation"));
	SubjectModelInt model=ModelFactory.getInstance().getSubjectModel();
	long id=DataUtility.getLong(request.getParameter("id"));
	if(id>0||op!=null){
		SubjectDTO dto=new SubjectDTO();
		try{
			dto=model.findByPK(id);
			ServletUtility.setDto(dto, request);
			
		}catch(ApplicationException e){
			log.error(e);
			ServletUtility.handleException(e, request, response);
			return;
		}
	}
	ServletUtility.forward(getView(), request, response);
	log.debug("SubjectCtl Method doGet Ended");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	    String op=DataUtility.getString(request.getParameter("operation"));
	    SubjectModelInt model=ModelFactory.getInstance().getSubjectModel();
	    long id =DataUtility.getLong(request.getParameter("id"));
	    if(OP_SAVE.equalsIgnoreCase(op)||OP_UPDATE.equalsIgnoreCase(op)){
	    	SubjectDTO dto=(SubjectDTO)populateDTO(request) ;
	    	try {
	    		if(id>0){
	    		
					model.update(dto);
					ServletUtility.setSuccessMessage("data is successfully Updated", request);
				}else{
					long pk=model.add(dto);
					ServletUtility.setSuccessMessage("data is successfully saved", request);
				} 
	    		ServletUtility.setDto(dto, request);
	    		
	    	}catch (ApplicationException e) {
					// TODO Auto-generated catch block
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
				}catch(DuplicateRecordException e){
					ServletUtility.setDto(dto, request);
					ServletUtility.setErrorMessage("Subject already Exist", request);
				}
	    	}else if(OP_DELETE.equalsIgnoreCase(op)){
	    		SubjectDTO dto=(SubjectDTO)populateDTO(request);
	    		try{
	    			model.delete(dto);
	    			ServletUtility.redirect(ORSView.SUBJECT_LIST_CTL, request, response);
	    		return;
	    		}catch(ApplicationException e){
	    			log.error(e);
	    			ServletUtility.handleException(e, request, response);
	    			return;
	    		}
	    	}else if(OP_CANCEL.equalsIgnoreCase(op)){
	    		ServletUtility.redirect(ORSView.SUBJECT_LIST_CTL, request, response);
	    	return;
	    	}else if(OP_RESET.equalsIgnoreCase(op)){
	    		ServletUtility.redirect(ORSView.SUBJECT_CTL, request, response);
	    	return;
	    	}
	    	ServletUtility.forward(getView(), request, response);
	    log.debug("SubjectCtl method doPost Ended");	
	    
		}

	
	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.SUBJECT_VIEW;
	}

}

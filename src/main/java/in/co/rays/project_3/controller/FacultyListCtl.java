package in.co.rays.project_3.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.FacultyDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.model.CollegeModelInt;
import in.co.rays.project_3.model.CourseModelInt;
import in.co.rays.project_3.model.FacultyModelInt;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

@WebServlet(name="FacultyListCtl",urlPatterns={"/ctl/FacultyListCtl"})
public class FacultyListCtl extends BaseCtl {
	private static Logger log=Logger.getLogger(FacultyListCtl.class);
	
	
	@Override
	protected void preload(HttpServletRequest request) {

	CollegeModelInt collegeModel=ModelFactory.getInstance().getCollegeModel();
	CourseModelInt courseModel=ModelFactory.getInstance().getCourseModel();
	
	try {
		List collegeList=collegeModel.list();
		request.setAttribute("collegeList", collegeList);
		List courseList=courseModel.list();
		request.setAttribute("courseList",courseList);
	} catch (ApplicationException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	
	}
    
	
	@Override
	protected BaseDTO populateDTO(HttpServletRequest request){
    	FacultyDTO dto=new FacultyDTO();
    	 dto.setId(DataUtility.getLong(request.getParameter("id")));
    	 dto.setFirstName(DataUtility.getString(request.getParameter("firstName")));

    	 dto.setEmailId(DataUtility.getString(request.getParameter("email")));
    	 dto.setCollegeId(DataUtility.getLong(request.getParameter("college")));
    	 dto.setCourseId(DataUtility.getLong(request.getParameter("course")));
    	 return dto;
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("FacultyListCtl doGet Start");
		
	List list=null;
	List next=null;
	
	int pageNo=1;
	int pageSize=DataUtility.getInt(PropertyReader.getValue("page.size"));

	
	FacultyDTO dto=(FacultyDTO)populateDTO(request);
	String op = DataUtility.getString(request.getParameter("operation"));
	String[] ids = request.getParameterValues("ids");
	FacultyModelInt model=ModelFactory.getInstance().getFacultyModel();
	
	System.out.println(dto.getId());
	try {
		list=model.search(dto, pageNo, pageSize);
		
		next=model.search(dto, pageNo+1, pageSize);
		if(list.size()==0||list==null){
			ServletUtility.setErrorMessage("no record found", request);
		}
		if(next.size()==0||next==null){
			request.setAttribute("nextListSize", "0");
		}else{
			request.setAttribute("nextListSize", next.size());
		}

		
		ServletUtility.setList(list, request);
		ServletUtility.setPageNo(pageNo, request);
		ServletUtility.setPageSize(pageSize, request);
		ServletUtility.forward(getView(), request, response);

		
	} catch (ApplicationException e) {
		e.printStackTrace();
		ServletUtility.handleException(e, request, response);
		return;
	}
	log.debug("Course ctl do get end");
}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List list=null;
		List next=null;
		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;

		
		FacultyDTO dto = (FacultyDTO) populateDTO(request);
		String op = DataUtility.getString(request.getParameter("operation"));
		String[] ids = request.getParameterValues("ids");
        FacultyModelInt model=ModelFactory.getInstance().getFacultyModel();
        
        
        
        try{		
        	
        	if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op)) {

			if (OP_SEARCH.equalsIgnoreCase(op)) {
				pageNo = 1;
			} else if (OP_NEXT.equalsIgnoreCase(op)) {
				pageNo++;
			} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
				pageNo--;
			}
		} else if (OP_NEW.equalsIgnoreCase(op)) {
			ServletUtility.redirect(ORSView.FACULTY_CTL, request, response);
			return;
		} else if (OP_RESET.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.FACULTY_LIST_CTL, request, response);
			return;
		} else if (OP_BACK.equalsIgnoreCase(op)) {
			ServletUtility.redirect(ORSView.FACULTY_LIST_CTL, request, response);
			return;
		} else if (OP_DELETE.equalsIgnoreCase(op)) {
			pageNo = 1;
			if (ids != null && ids.length > 0) {
				FacultyDTO deletedto = new FacultyDTO();
				for (String id : ids) {
					deletedto.setId(DataUtility.getLong(id));
					model.delete(deletedto);
					ServletUtility.setErrorMessage("Data Delete Successfully", request);
				}

			} else {
				ServletUtility.setErrorMessage("Select atleast one record", request);
			}
		}
		list = model.search(dto, pageNo, pageSize);
		 next = model.search(dto, pageNo + 1, pageSize);
		if (list == null || list.size() == 0&&!OP_DELETE.equalsIgnoreCase(op)) {
			ServletUtility.setErrorMessage("No record found", request);
		}
		if (next == null || next.size() == 0) {
			request.setAttribute("nextListSize", "0");
		} else {
			request.setAttribute("nextListSize", next.size());
		}
		ServletUtility.setList(list, request);
		ServletUtility.setPageNo(pageNo, request);
		ServletUtility.setPageSize(pageSize, request);
		ServletUtility.forward(getView(), request, response);
	} catch (ApplicationException e) {
		log.error(e);
		ServletUtility.handleException(e, request, response);
		return;
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	log.debug("Course List do post end");
}

	
	
	@Override
	protected String getView() {
	return ORSView.FACULTY_LIST_VIEW;
	}

}

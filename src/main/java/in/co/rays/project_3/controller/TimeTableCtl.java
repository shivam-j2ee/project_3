package in.co.rays.project_3.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.TimeTableDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.model.CourseModelInt;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.SubjectModelInt;
import in.co.rays.project_3.model.TimeTableModelInt;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.DataValidator;
import in.co.rays.project_3.util.ServletUtility;

@WebServlet(name="TimeTableCtl",urlPatterns={"/ctl/TimeTableCtl"})
public class TimeTableCtl  extends BaseCtl{

	
	@Override
	protected void preload(HttpServletRequest request) {

		CourseModelInt courseModel=ModelFactory.getInstance().getCourseModel();
		SubjectModelInt subjectModel=ModelFactory.getInstance().getSubjectModel();
		
		
		try {
			List courseList=courseModel.list();
			List sujectList=subjectModel.list();
			
			
			request.setAttribute("courseList", courseList);
			request.setAttribute("sujectList", sujectList);
			
			
			
		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
	}
	
	
	
	@Override
	protected boolean validate(HttpServletRequest request) {
		System.out.println("in timetable validate");

		boolean pass =true;
		
		String  courseId =  request.getParameter("course");
		String  subjectId =  request.getParameter("subject");
		String  semester =  request.getParameter("semester");
		String  Exdate =  request.getParameter("examdate");
		String  examTime =  request.getParameter("examTime");
		String  description =  request.getParameter("description");
		
		if(DataValidator.isNull(courseId))
		{
		  request.setAttribute("course", "Please Select Course");
		  pass=false;
		}
		if(DataValidator.isNull(subjectId))
		{
		  request.setAttribute("subject", "Please Select Subject");
		  pass=false;
		}
		if(DataValidator.isNull(semester))
		{
		  request.setAttribute("semester", "Please Select Semester");
		  pass=false;
		}
		if(DataValidator.isNull(Exdate))
		{
		  request.setAttribute("examdate", "Please Select Exam Date");
		  pass=false;
		}
		if(DataValidator.isNull(examTime))
		{
		  request.setAttribute("examTime", "Please Select Exam Time");
		  pass=false;
		}
		if(DataValidator.isNull(description))
		{
		  request.setAttribute("description", "Please Select desciption");
		  pass=false;
		}
		
		return pass;
	
	}
	

	@Override
	protected BaseDTO populateDTO(HttpServletRequest request) {
	System.out.println("in timetable populate");
		   TimeTableDTO dto = new TimeTableDTO();
		   
		    String  courseId =  request.getParameter("course");
			String  subjectId =  request.getParameter("subject");
			String  semester =  request.getParameter("semester");
			String  Exdate =  request.getParameter("examdate");
			String  examTime =  request.getParameter("examTime");
			String  description =  request.getParameter("description");
			
			dto.setId(DataUtility.getLong(request.getParameter("id")));
			dto.setCourseId(DataUtility.getLong(courseId));
			dto.setSubId(DataUtility.getInt(subjectId));
			dto.setSemester(DataUtility.getString(semester));
			dto.setDescription(DataUtility.getString(description));
			
			System.out.println(Exdate);
			if(!Exdate.equals(""))
			{
				dto.setExamDate(DataUtility.getDate(Exdate));	
			}
		    	
			dto.setExamTime(DataUtility.getString(examTime));
		    
			return dto;
	
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		long id = DataUtility.getLong(request.getParameter("id"));
		TimeTableDTO dto=null;
		TimeTableModelInt model=ModelFactory.getInstance().getTimeTableModel();
		if(id>0)
		{
		  try {
			dto = model.findByPK(id);
			ServletUtility.setDto(dto, request);
		  } catch (Exception e) {
			e.printStackTrace();
		  }	
		}
		
	 ServletUtility.forward(getView(), request, response);	

	
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("in timetable dopost");
		String op = request.getParameter("operation");
		long id = DataUtility.getLong(request.getParameter("id"));
		
		TimeTableDTO bean = (TimeTableDTO)populateDTO(request);
		TimeTableModelInt model = ModelFactory.getInstance().getTimeTableModel();
		
		if(OP_SAVE.equalsIgnoreCase(op)||OP_UPDATE.equalsIgnoreCase(op)){
			
			System.out.println("shivam1");
		
			if(bean.getId()>0){
				ServletUtility.setErrorMessage("TmeTable Already Exist", request);
				ServletUtility.setDto(bean, request);
				System.out.println("shivam2");	
			}
			
			
			
			
			
			TimeTableDTO bean1;
			TimeTableDTO bean2;
			TimeTableDTO bean3;
			
			try {
				System.out.println("shivam3");
				bean1 = model.checkByCourseName(bean.getCourseId(), bean.getExamDate());

				bean2 = model.checkBySubjectName(bean.getCourseId(), bean.getSubId(), bean.getExamDate());
				
				bean3 = model.checkBysemester(bean.getCourseId(), bean.getSubId(), bean.getSemester(),
						bean.getExamDate());
				
				if (bean1 == null && bean2 == null && bean3 == null) {
					System.out.println("shivam4");
					model.add(bean);
					ServletUtility.setSuccessMessage("Data is successfully saved", request);
				} else {
					ServletUtility.setDto(bean, request);
					ServletUtility.setErrorMessage("Exam already exist!", request);
				}
				
				} catch (Exception e) {
				e.printStackTrace();;
			}
		  ServletUtility.forward(getView(), request, response);	
		}
		else if(OP_CANCEL.equalsIgnoreCase(op))
		{
			ServletUtility.redirect(ORSView.TIMETABLE_LIST_CTL, request, response);
			return;
		}
				
		else if(OP_DELETE.equalsIgnoreCase(op))
		{
			try {
				model.delete(bean);
				ServletUtility.setSuccessMessage("Data Deleted Successfully", request);
			} catch (Exception e) {
				e.printStackTrace();
			}
			ServletUtility.redirect(ORSView.TIMETABLE_LIST_CTL, request, response);
			return;
		}else if(OP_RESET.equalsIgnoreCase(op))
		{
			  ServletUtility.redirect(ORSView.TIMETABLE_CTL, request, response);	
			  return;
		}

	
	}
	
	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.TIMETABLE_VIEW;
	}

	
	
	
	
}

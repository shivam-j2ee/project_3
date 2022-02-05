package in.co.rays.project_3.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.CollegeDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.model.CollegeModelInt;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

@WebServlet(name="CollegeListCtl",urlPatterns={"/ctl/CollegeListCtl"})
public class CollegeListCtl extends BaseCtl {
	
	 private static Logger log = Logger.getLogger(CollegeListCtl.class);
	 
	 
	 @Override
	protected void preload(HttpServletRequest request) {

		 CollegeModelInt model=ModelFactory.getInstance().getCollegeModel();
		 try {
			List collegeList=  model.list();
			request.setAttribute("collegeList",collegeList );
		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 
		 
	 }

	    @Override
	    protected BaseDTO populateDTO(HttpServletRequest request) {
	        CollegeDTO dto = new CollegeDTO();

	        dto.setId(DataUtility.getLong(request.getParameter("college")));
	        dto.setCity(DataUtility.getString(request.getParameter("city")));

	        return dto;
	    }


	    
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int pageNo = 1;
	        int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));

	        CollegeDTO dto = (CollegeDTO) populateDTO(request);
	        CollegeModelInt model =ModelFactory.getInstance().getCollegeModel();

	        List list = null;
	        List next=null;

	        try {
	            list = model.search(dto, pageNo, pageSize);
	            next = model.search(dto, pageNo+1, pageSize);
	        } catch (ApplicationException e) {
	            log.error(e);
	            ServletUtility.handleException(e, request, response);
	            return;
	        }

	        if (list == null || list.size() == 0) {
	            ServletUtility.setErrorMessage("No record found ", request);
	        } if(next==null||next.size()==0){
	        	request.setAttribute("nextlistsize", "0");
	        }else{
	        	request.setAttribute("nextlistsize", next.size());
	        }

	        ServletUtility.setDto(dto, request);
	        ServletUtility.setList(list, request);
	        ServletUtility.setPageNo(pageNo, request);
	        ServletUtility.setPageSize(pageSize, request);
	        ServletUtility.forward(getView(), request, response);
   
	    }
	
	    
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    	
	        log.debug("CollegeListCtl doPost Start");
	        List list = null;
	        List next =null;
	        int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
	        int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

	        pageNo = (pageNo == 0) ? 1 : pageNo;
	        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader
	                .getValue("page.size")) : pageSize;
	        CollegeDTO dto = (CollegeDTO) populateDTO(request);
	        String op = DataUtility.getString(request.getParameter("operation"));
	        // get the selected checkbox ids array for delete list
	        String ids[] = request.getParameterValues("ids");
	        CollegeModelInt model = ModelFactory.getInstance().getCollegeModel();
	        try {

	            if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op)
	                    || "Previous".equalsIgnoreCase(op)) {

	                if (OP_SEARCH.equalsIgnoreCase(op)) {
	                    pageNo = 1;
	                } else if (OP_NEXT.equalsIgnoreCase(op)) {
	                    pageNo++;
	                } else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
	                    pageNo--;
	                }

	            } else if (OP_NEW.equalsIgnoreCase(op)) {
	                ServletUtility.redirect(ORSView.COLLEGE_CTL, request, response);
	                return;
	            
	            }else if(OP_RESET.equalsIgnoreCase(op))
	    		{
	  			  ServletUtility.redirect(ORSView.COLLEGE_LIST_CTL, request, response);	
	  			  return;
	  		}

	            
	            else if (OP_DELETE.equalsIgnoreCase(op)) {
	                pageNo = 1;
	                if (ids != null && ids.length > 0) {
	                    CollegeDTO deletedto = new CollegeDTO();
	                    for (String id : ids) {
	                    	
	                    	long idnew=DataUtility.getLong(id);
	                    	
	                        deletedto.setId(idnew);
	                        
	                        model.delete(deletedto);
	                        
	                        ServletUtility.setErrorMessage(
	                                "Delete data Successfully", request);
	                    }
	                } else if(OP_BACK.equalsIgnoreCase(op)){
	                	ServletUtility.redirect(ORSView.COLLEGE_LIST_CTL, request, response);
	                }else{
	                    ServletUtility.setErrorMessage(
	                            "Select at least one record", request);
	                }
	            }
	            list = model.search(dto, pageNo, pageSize);
	            next=model.search(dto, pageNo+1, pageSize);
	            ServletUtility.setList(list, request);
	            if (list == null || list.size() == 0&&!OP_DELETE.equalsIgnoreCase(op)) {
	                ServletUtility.setErrorMessage("No record found ", request);
	            }
	            if(next==null||next.size()==0){
	            	request.setAttribute("nextlistsize", "0");
	            }else{
	            	request.setAttribute("nextlistsize", next.size());
	            }
	            ServletUtility.setDto(dto, request);
	            ServletUtility.setList(list, request);
	            ServletUtility.setPageNo(pageNo, request);
	            ServletUtility.setPageSize(pageSize, request);
	            ServletUtility.forward(getView(), request, response);

	        } catch (ApplicationException e) {
	            log.error(e);
	            ServletUtility.handleException(e, request, response);
	            return;
	        }
	        log.debug("CollegeListCtl doGet End");

	    }
	    
	    
	    @Override
	 protected String getView() {
		return ORSView.COLLEGE_LIST_VIEW;
	}
	
	
	
}

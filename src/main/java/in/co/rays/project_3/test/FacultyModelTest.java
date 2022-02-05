package in.co.rays.project_3.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import in.co.rays.project_3.dto.FacultyDTO;
import in.co.rays.project_3.dto.UserDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.model.FacultyModelHibImpl;
import in.co.rays.project_3.model.FacultyModelInt;

public class FacultyModelTest {
	 /**
     * Model object to test
     */
 
	 public static FacultyModelInt model = new FacultyModelHibImpl();
	 /**
	    * Main method to call test methods.
	     *  
	     * @param args
	     * @throws ParseException
	     */
	    public static void main(String[] args) throws Exception {
	         //testAdd();
	        // testDelete();
	        //testUpdate();
	        // testFindByPK();
	        // testFindByEmailId();
	         testSearch();
	        // testList();
	 
	    }
	    public static void testAdd(){
	    	FacultyDTO dto=new FacultyDTO();
	    	SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
	    	dto.setCollegeId(1L);
	    	dto.setCollegeName("davv");
	    	try {
				model.add(dto);
			} catch (ApplicationException e) {
				e.printStackTrace();
			} catch (DuplicateRecordException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    public static void testUpdate(){
	    	FacultyDTO dto=new FacultyDTO();
	    	SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
	    	dto.setId(1L);
	    	dto.setCollegeId(1L);
	    	dto.setCollegeName("cdgi");
	    	try {
				model.update(dto);
			} catch (ApplicationException e) {
				e.printStackTrace();
			} catch (DuplicateRecordException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    public static void testDelete(){
	    	FacultyDTO dto=new FacultyDTO();
	    	dto.setId(1L);
	    	try {
				model.delete(dto);
			} catch (ApplicationException e) {
				e.printStackTrace();
			}
	    }
	        public static void testSearch() {
	        	 
	            try {
	                FacultyDTO dto = new FacultyDTO();
	                List list = new ArrayList();
	                // dto.setFirstName("ranjit");
	                // dto.setLastName("ch");
	                //dto.setId(2l);
	     //dto.setFirstName("shivam");
	                list = model.search(dto, 0, 0);
	                if (list.size() < 0) {
	                    System.out.println("Test Serach fail");
	                }
	                Iterator it = list.iterator();
	                while (it.hasNext()) {
	                    dto = (FacultyDTO) it.next();
	                    System.out.println(dto.getId());
	                    System.out.println(dto.getFirstName());
	                    System.out.println(dto.getLastName());
	                               }
	     
	            } catch (ApplicationException e) {
	                e.printStackTrace();
	            }
	     
	        }

	    	
	    }
	    


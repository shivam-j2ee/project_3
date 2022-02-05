package in.co.rays.project_3.test;

import in.co.rays.project_3.dto.CourseDTO;
import in.co.rays.project_3.dto.SubjectDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.model.SubjectModelHibImpl;
import in.co.rays.project_3.model.SubjectModelInt;

/**
 * College Model Test classes
 *  
 * @author Shivam Tiwari
 *  
 */
public class SubjectModelTest {
	 /**
     * Model object to test
     */
 public static SubjectModelInt model = new SubjectModelHibImpl();
 /**
  * Main method to call test methods.
  *  
  * @param args
  */
 public static void main(String[] args) {
     //testAdd();
    // testDelete();
    testUpdate();
  //      testFindByName();
    // testFindByPK();
     //testSearch();
//     testList();

}
 /**
  * Tests add a Course
  */
 public static void testAdd(){
	 SubjectDTO dto=new SubjectDTO();
	 dto.setSubjectName("physics");;
	 dto.setCourseName("bee");
	 dto.setDescription("best");
	 try {
		model.add(dto);
	} catch (ApplicationException e) {
		e.printStackTrace();
	} catch (DuplicateRecordException e) {
		e.printStackTrace();
	}
	 }
	 public static void testUpdate(){
		 SubjectDTO dto=new SubjectDTO();
	     dto.setId(1L);
		 dto.setSubjectName("ath");;
		 dto.setCourseName("bee");
		 dto.setDescription("best");
		 try {
			model.update(dto);
		} catch (ApplicationException e) {
			e.printStackTrace();
		} catch (DuplicateRecordException e) {
			e.printStackTrace();
		}

 }


}

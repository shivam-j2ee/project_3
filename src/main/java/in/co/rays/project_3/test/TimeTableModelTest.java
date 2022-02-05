package in.co.rays.project_3.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.project_3.dto.TimeTableDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.TimeTableModelInt;

public class TimeTableModelTest {
	
	
	public static TimeTableModelInt model=ModelFactory.getInstance().getTimeTableModel();
	
	public static void main(String[] args) throws ParseException, ApplicationException, DuplicateRecordException {
		//TestAdd();
	//TestCheckByCourseName();
		testSearch();
	
	}
	
	
	
	public static void testSearch() throws ApplicationException{
		
		TimeTableDTO dto=new TimeTableDTO();
		
		
	    List list=	model.search(dto);
	    
	    Iterator it =list.iterator();
	    while (it.hasNext()) {
			TimeTableDTO dto1 = (TimeTableDTO) it.next();
			System.out.println(dto1.getCourseId());
			System.out.println(dto.getCourseName());
			
		}
	}
	

	public static void TestAdd() throws ParseException, ApplicationException, DuplicateRecordException{
		String date="17/12/2019";
		SimpleDateFormat sdt=new SimpleDateFormat("MM/dd/yyyy");
		Date d= sdt.parse(date);
		
		TimeTableDTO dto=new TimeTableDTO();
		dto.setCourseId(1);
		dto.setExamDate(d);
		
		model.add(dto);
		System.out.println("test Successfull");
		
		
	}
	
	
	
	public static void TestCheckByCourseName() throws ApplicationException, ParseException{
		
		String date="17/12/2019";
		SimpleDateFormat sdt=new SimpleDateFormat("MM/dd/yyyy");
		Date d= sdt.parse(date);
		
		TimeTableDTO dto=model.checkByCourseName(1,d);
	if(dto!=null){
		System.out.println("success");
	}else {
		System.out.println("failure");
	}
		
		
		dto.getCourseId();
		
		
	
	
	
	}
	}	
	


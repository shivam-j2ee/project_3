package in.co.rays.project_3.model;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import in.co.rays.project_3.dto.CourseDTO;
import in.co.rays.project_3.dto.SubjectDTO;
import in.co.rays.project_3.dto.TimeTableDTO;
import in.co.rays.project_3.dto.UserDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.HibDataSource;

public class TimeTableModelHibImpl implements TimeTableModelInt {

	
	
	private static Logger log = Logger.getLogger(MarksheetModelHibImpl.class);
	
	public TimeTableDTO checkByCourseName(long CourseId, Date ExamDate) throws ApplicationException {
	
		    Session session = null;
	        TimeTableDTO dto = null;
	        try {
	            session = HibDataSource.getSession();

	            Criteria criteria=session.createCriteria(TimeTableDTO.class);

	           criteria.add(Restrictions.eq("courseId", CourseId));
	           criteria.add(Restrictions.like("examDate", ExamDate));

	            
	            List list = criteria.list();
	            if(list.size()==1){
	            	
	             dto=(TimeTableDTO)	list.get(0);
	            }

	        } catch (Exception e) {
	            log.error(e);
	            throw new ApplicationException("Exception in  marksheet list"
	                    + e.getMessage());
	        } finally {
	            session.close();
	        }

	        log.debug("Model getMeritList End");
	        return dto;
	    }
	
	
	

	public TimeTableDTO checkBySubjectName(long CourseId, long SubjectId, Date ExamDate) throws ApplicationException {
		Session session = null;
        TimeTableDTO dto = null;
        try {
            session = HibDataSource.getSession();

            Criteria criteria=session.createCriteria(TimeTableDTO.class);

            // if page size is greater than zero then apply pagination
           criteria.add(Restrictions.eq("courseId", CourseId));
           criteria.add(Restrictions.eq("subId", SubjectId));

           criteria.add(Restrictions.like("examDate", ExamDate));

            
            List list = criteria.list();
            if(list.size()==1){
            	
             dto=(TimeTableDTO)	list.get(0);
            }

        } catch (Exception e) {
            log.error(e);
            throw new ApplicationException("Exception in  marksheet list"
                    + e.getMessage());
        } finally {
            session.close();
        }

        log.debug("Model getMeritList End");
        return dto;
	}

	public TimeTableDTO checkBysemester(long CourseId, long SubjectId, String semester, Date ExamDate)
			throws ApplicationException {
		Session session = null;
        TimeTableDTO dto = null;
        try {
            session = HibDataSource.getSession();

            Criteria criteria=session.createCriteria(TimeTableDTO.class);

            // if page size is greater than zero then apply pagination
           criteria.add(Restrictions.eq("courseId", CourseId));
           criteria.add(Restrictions.eq("subId", SubjectId));
           criteria.add(Restrictions.like("semester", semester));

           criteria.add(Restrictions.like("examDate", ExamDate));

            
            List list = criteria.list();
            if(list.size()==1){
            	
             dto=(TimeTableDTO)	list.get(0);
            }

        } catch (Exception e) {
            log.error(e);
            throw new ApplicationException("Exception in  marksheet list"
                    + e.getMessage());
        } finally {
            session.close();
        }

        log.debug("Model getMeritList End");
        return dto;
	}

	public long add(TimeTableDTO dto) throws ApplicationException, DuplicateRecordException {
		log.debug("Model add Started");
		long pk=0;
		
	SubjectModelInt subjectModel=ModelFactory.getInstance().getSubjectModel();
	
	SubjectDTO subjectdto= subjectModel.findByPK(dto.getSubId())	;
	
    dto.setSubName(subjectdto.getSubjectName());
	
	CourseModelInt courseModel=ModelFactory.getInstance().getCourseModel();
	
	CourseDTO coursedto=courseModel.findByPK(dto.getCourseId());
	
	dto.setCourseName(coursedto.getCourseName());
		
		
		
		
		
		
		Session session=HibDataSource.getSession();
		Transaction transaction=null;
		try {
            transaction = session.beginTransaction();
            session.save(dto);
            pk = dto.getId();
            transaction.commit();
        } catch (HibernateException e) {
            log.error("Database Exception..", e);
            if (transaction != null) {
                transaction.rollback();
            }
            System.out.println("5");
            throw new ApplicationException("Exception in TimeTable Add "
                    + e.getMessage());
        } finally {
            session.close();
        }
        log.debug("Model add End");
        return dto.getId();
	}
	

	public void update(TimeTableDTO dto) throws ApplicationException, DuplicateRecordException {

		
		SubjectModelInt subjectModel=ModelFactory.getInstance().getSubjectModel();
		
		SubjectDTO subjectdto= subjectModel.findByPK(dto.getSubId())	;
		
	    dto.setSubName(subjectdto.getSubjectName());
		
		CourseModelInt courseModel=ModelFactory.getInstance().getCourseModel();
		
		CourseDTO coursedto=courseModel.findByPK(dto.getCourseId());
		
		dto.setCourseName(coursedto.getCourseName());
			

		
		
		
		
		
		
		Session session=HibDataSource.getSession();
		Transaction transaction=null;
		try {
            transaction = session.beginTransaction();
            session.update(dto);
            transaction.commit();
        } catch (HibernateException e) {
            log.error("Database Exception..", e);
            if (transaction != null) {
                transaction.rollback();
            }
            System.out.println("5");
            throw new ApplicationException("Exception in TimeTable Add "
                    + e.getMessage());
        } finally {
            session.close();
        }
        log.debug("Model add End");	
	}

	public void delete(TimeTableDTO dto) throws ApplicationException {
		Session session=HibDataSource.getSession();
		Transaction transaction=null;
		try {
            transaction = session.beginTransaction();
            session.delete(dto);
            transaction.commit();
        } catch (HibernateException e) {
            log.error("Database Exception..", e);
            if (transaction != null) {
                transaction.rollback();
            }
            System.out.println("5");
            throw new ApplicationException("Exception in TimeTable Add "
                    + e.getMessage());
        } finally {
            session.close();
        }
        log.debug("Model add End");	
		
	}

	public TimeTableDTO name(String emailId) throws ApplicationException {
		// TODO Auto-generated method stub
		return null;
	}

	public TimeTableDTO findByPK(long pk) throws ApplicationException {
		log.debug("Model findByPK Started");
		Session session=null;
		TimeTableDTO dto=null;
		try{
			session=HibDataSource.getSession();
			dto=(TimeTableDTO)session.get(TimeTableDTO.class,pk);
		}catch(HibernateException e){
			log.error("Database Exception..", e);
            throw new ApplicationException("Exception : Exception in getting User by pk");
		}finally {
			session.close();
		}
		return dto;

	}

	public List search(TimeTableDTO dto, int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model search Started");
		  Session session=null;
		  List list=null;
		  try{
			  session=HibDataSource.getSession();
			  Criteria criteria=session.createCriteria(TimeTableDTO.class);
			  if (dto.getId() > 0) {
	                criteria.add(Restrictions.eq("id", dto.getId()));
	            }
	            if (dto.getCourseId() > 0) {
	                criteria.add(Restrictions.eq("courseId", dto.getCourseId()));
	            }

	            if (dto.getSubId() > 0) {
	                criteria.add(Restrictions.eq("subId", dto.getSubId()));
	            }
	            if(dto.getExamDate()!=null){
	            	Date date = new Date(dto.getExamDate().getTime());
	            	criteria.add(Restrictions.like("examDate", date));
	            }

	            
	            if(pageSize>0){
	            	criteria.setFirstResult((pageNo-1)*pageSize);
	            	criteria.setMaxResults(pageSize);
	            }
	            list=criteria.list();
	            }
	            catch (HibernateException e) {
	                log.error("Database Exception..", e);
	                throw new ApplicationException("Exception in user search");
	            } finally {
	                session.close();
	            }

	            log.debug("Model search End");

		  
		return list;
	}

	public List search(TimeTableDTO dto) throws ApplicationException {
		// TODO Auto-generated method stub
		return search(dto, 0, 0);
	}

	public List list() throws ApplicationException {
		
		return list(0, 0);
	}

	public List list(int pageNo, int pageSize) throws ApplicationException {
		Session session=null;
		List list=null;
		try{
			session=HibDataSource.getSession();
			Criteria criteria=session.createCriteria(TimeTableDTO.class);
			
			// if page size is greater than zero then apply pagination
            if (pageSize > 0) {
                pageNo = ((pageNo - 1) * pageSize) + 1;
                criteria.setFirstResult(pageNo);
                criteria.setMaxResults(pageSize);
            }

            list = criteria.list();
        } catch (HibernateException e) {
            log.error("Database Exception..", e);
            throw new ApplicationException(
                    "Exception : Exception in  Users list");
        } finally {
            session.close();
        }

        log.debug("Model list End");
		
		return list;

	}

}

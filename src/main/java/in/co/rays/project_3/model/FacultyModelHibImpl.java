package in.co.rays.project_3.model;

import java.util.List;

import javax.net.ssl.SSLPeerUnverifiedException;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import in.co.rays.project_3.dto.CollegeDTO;
import in.co.rays.project_3.dto.CourseDTO;
import in.co.rays.project_3.dto.FacultyDTO;
import in.co.rays.project_3.dto.SubjectDTO;
import in.co.rays.project_3.dto.UserDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.util.HibDataSource;
/**
 * Hibernate Implementation of FacultyModel
 *
 * @author Shivam Tiwari
 */
public class FacultyModelHibImpl implements FacultyModelInt {
	 private static Logger log = Logger.getLogger(StudentModelHibImpl.class);

	   /**
	     * add a Faculty
	     *
	     * @param dto
	     * @throws DatabaseException
	     */
	public long add(FacultyDTO dto) throws ApplicationException, DuplicateRecordException {
		 log.debug("Model add Started");
         FacultyDTO dtoExist=findByEmailId(dto.getEmailId());

         CollegeModelInt collegeModel=ModelFactory.getInstance().getCollegeModel();
         CourseModelInt courseModel=ModelFactory.getInstance().getCourseModel();
         SubjectModelInt subjectModel=ModelFactory.getInstance().getSubjectModel();
         
         CollegeDTO collegeDTO=collegeModel.findByPK(dto.getCollegeId());
         CourseDTO courseDTO=courseModel.findByPK(dto.getCourseId());
         SubjectDTO subjectDTO=subjectModel.findByPK(dto.getSubjectId());
         
         dto.setCollegeName(collegeDTO.getName());
         dto.setCourseName(courseDTO.getCourseName());
         dto.setSubjectName(subjectDTO.getSubjectName());
         
         System.out.println("sss"+dto.getCollegeName());
         System.out.println("sss"+dto.getCourseName());
         System.out.println("sss"+dto.getSubjectName());
         
         if(dtoExist!=null){
        	 throw new DuplicateRecordException("Faculty already Exist");
        	 }
		 long pk=0;
		 Session session=null;
		 Transaction transaction =null;
		 try{
			 session=HibDataSource.getSession();
			 transaction=session.beginTransaction();
			 session.save(dto);
			 pk=dto.getId();
		     transaction.commit();
			}catch(HibernateException e){
				log.error("Database Exception..", e);
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            throw new ApplicationException("Exception in Faculty Add "
	                    + e.getMessage());
	        } finally {
	            session.close();
	        }

	        log.debug("Model add End");
		
		return dto.getId();

		}
	/**
     * Update a Faculty
     *
     * @param dto
     * @throws DatabaseException
     */

	public void update(FacultyDTO dto) throws ApplicationException, DuplicateRecordException {
		Session session=null;
		Transaction transaction=null;
        FacultyDTO dtoExist=findByEmailId(dto.getEmailId());
        if(dtoExist!=null){
       	 throw new DuplicateRecordException("Faculty already Exist");
       	 }

		try{
			session=HibDataSource.getSession();
			transaction=session.beginTransaction();
			session.update(dto);
			transaction.commit();
		}catch(HibernateException e){
			log.error("Database Exception..", e);
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ApplicationException("Exception in Faculty Update "
                    + e.getMessage());
        } finally {
            session.close();
        }

        log.debug("Model add End");
	

	}
	/**
     * Delete a Faculty
     *
     * @param dto
     * @throws DatabaseException
     */

	public void delete(FacultyDTO dto) throws ApplicationException {
		Session session=null;
		Transaction transaction=null;
		try{
			session=HibDataSource.getSession();
			transaction=session.beginTransaction();
			session.delete(dto);
			System.out.println("delete successfull");
			transaction.commit();
			
		}catch (HibernateException e) {
            log.error("Database Exception..", e);
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ApplicationException("Exception in Faculty Delete"
                    + e.getMessage());
        } finally {
            session.close();
        }
        log.debug("Model delete End");		
	}
	/**
     * Find Faculty by Login
     *
     * @param login: get parameter
     * @return dto
     * @throws DatabaseException
     */
	public FacultyDTO findByEmailId(String emailId) throws ApplicationException {
		Session session=null;
		FacultyDTO dto=null;
		try{
			session =HibDataSource.getSession();
			Criteria criteria=session.createCriteria(FacultyDTO.class);
			criteria.add(Restrictions.eq("emailId",emailId ));
			List list=criteria.list();
			if(list.size()==1){
			dto=(FacultyDTO)list.get(0);
			}
		}catch(HibernateException e){
     	   log.error("Database Exception..", e);
           throw new ApplicationException(
                   "Exception in getting Faculty by email " + e.getMessage());

       }finally {
           session.close();
       }

       log.debug("Model findByLoginId End");
	return dto;
	}

	public FacultyDTO findByPK(long pk) throws ApplicationException {
		Session session=null;
		FacultyDTO dto=null;
		try{
			session =HibDataSource.getSession();
			dto=(FacultyDTO)session.get(FacultyDTO.class,pk);
			
		}catch(HibernateException e){
     	   log.error("Database Exception..", e);
           throw new ApplicationException(
                   "Exception in getting Faculty by email " + e.getMessage());

       }finally {
           session.close();
       }

       log.debug("Model findByLoginId End");
	return dto;
	}

	public List search(FacultyDTO dto, int pageNo, int pageSize) throws ApplicationException {
		 log.debug("Model search Started");
		  Session session=null;
		  List list=null;
		  try{
			  session=HibDataSource.getSession();
			  Criteria criteria=session.createCriteria(FacultyDTO.class);
			  if (dto.getId() > 0) {
	                criteria.add(Restrictions.eq("id", dto.getId()));
	            }
	            if (dto.getFirstName() != null && dto.getFirstName().length() > 0) {
	                criteria.add(Restrictions.like("firstName", dto.getFirstName()
	                        + "%"));
	            }
	            if (dto.getLastName() != null && dto.getLastName().length() > 0) {
	                criteria.add(Restrictions.like("lastName", dto.getLastName()
	                        + "%"));
	            }
	            if (dto.getEmailId() != null && dto.getEmailId().length() > 0) {
	                criteria.add(Restrictions.like("emailId", dto.getEmailId() + "%"));
	            }
	            if (dto.getGender() != null && dto.getGender().length() > 0) {
	                criteria.add(Restrictions.like("gender", dto.getGender()
	                        + "%"));
	            }
	            if (dto.getGender() != null && dto.getGender().length() > 0) {
	                criteria.add(Restrictions.like("gender", dto.getGender() + "%"));
	            }
	            if (dto.getJoiningDob() != null) {
	                criteria.add(Restrictions.eq("joiningDob", dto.getJoiningDob()));
	            }
	            if (dto.getQualification() != null && dto.getQualification().length() > 0) {
	                criteria.add(Restrictions.eq("qualification", dto.getQualification()));
	            }
	            if (dto.getMobileNo() != null && dto.getMobileNo().length() > 0) {
	                criteria.add(Restrictions.eq("mobileNo", dto.getMobileNo()));
	            }
	            if (dto.getQualification() != null && dto.getQualification().length() > 0) {
	                criteria.add(Restrictions.eq("qualification", dto.getQualification()));
	            }
	            if (dto.getCollegeId() > 0) {
	                criteria.add(Restrictions.eq("collegeId", dto.getCollegeId()));
	            }
	            if (dto.getCourseId() > 0) {
	                criteria.add(Restrictions.eq("courseId", dto.getCourseId()));
	            }
	            if (dto.getSubjectId() > 0) {
	                criteria.add(Restrictions.eq("subjectId", dto.getSubjectId()));
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

	public List search(FacultyDTO dto) throws ApplicationException {
		return search(dto, 0, 0);
	}

	public List list() throws ApplicationException {
		return list(0,0);
	}

	public List list(int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model list Started");
		Session session=null;
		List list=null;
		try{
			session=HibDataSource.getSession();
			Criteria criteria=session.createCriteria(FacultyDTO.class);
			
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

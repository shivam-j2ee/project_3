package in.co.rays.project_3.model;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import in.co.rays.project_3.dto.CollegeDTO;
import in.co.rays.project_3.dto.CourseDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.util.HibDataSource;

/**
 * Hibernate Implementation of CourseModel
 *
 * @author Shivam Tiwari
 */
public class CourseModelHibImpl implements CourseModelInt {
    private static Logger log = Logger.getLogger(CourseModelHibImpl.class);
    /**
     * Add a Course
     *
     * @param dto
     * @throws DatabaseException
     *
     */
	public long add(CourseDTO dto) throws ApplicationException, DuplicateRecordException {
		log.debug("Model add Started");
		CourseDTO dtoExist=findByName(dto.getCourseName());
		if(dtoExist!=null){
			throw new DuplicateRecordException("Course already exist");
		}
		Long pk=0L;
		Session session=null;
		Transaction transaction= null;
		try{
			session=HibDataSource.getSession();
            transaction = session.beginTransaction();
            session.save(dto);
            pk = dto.getId();
            transaction.commit();
		}catch(HibernateException e){
			e.printStackTrace();
        log.error("Database Exception..", e);
        if (transaction != null) {
            transaction.rollback();
        }
        throw new ApplicationException("Exception in Course Add "
                + e.getMessage());
    } finally {
        session.close();
    }

    log.debug("Model add End");
		
		return dto.getId();
	}
	 /**
     * Update a Course
     *
     * @param dto
     * @throws DatabaseException
     *
     */
	public void update(CourseDTO dto) throws ApplicationException, DuplicateRecordException {
		log.debug("Model update Started");
		Session session = null;
        Transaction transaction = null;
        CourseDTO dtoExist=findByName(dto.getCourseName());
		if(dtoExist!=null){
			throw new DuplicateRecordException("Course already exist");
		}
		try {

            session = HibDataSource.getSession();
            transaction = session.beginTransaction();
            session.update(dto);
            transaction.commit();
        } catch (HibernateException e) {
            log.error("Database Exception..", e);
            if (transaction != null) {
                transaction.rollback();
                throw new ApplicationException("Exception in College Update"
                        + e.getMessage());
            }
        } finally {
            session.close();
        }
        log.debug("Model update End");
	}
	 /**
     * Delete a Course
     *
     * @param dto
     * @throws DatabaseException
     */
	public void delete(CourseDTO dto) throws ApplicationException {
		log.debug("Model delete Started");
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibDataSource.getSession();
            transaction = session.beginTransaction();
            session.delete(dto);
            transaction.commit();
        } catch (HibernateException e) {
            log.error("Database Exception..", e);
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ApplicationException("Exception in course Delete"
                    + e.getMessage());
        } finally {
            session.close();
        }
        log.debug("Model delete End");		
	}
	/**
     * Find course by Course Name
     *
     * @param course
     *            : get parameter
     * @return dto
     * @throws DatabaseException
     */

	public CourseDTO findByName(String name) throws ApplicationException {
		 log.debug("Model findByName Started");
	        Session session = null;
	        CourseDTO dto = null;
	        try {
	            session = HibDataSource.getSession();
	            Criteria criteria = session.createCriteria(CourseDTO.class);
	            criteria.add(Restrictions.eq("courseName", name));
	            List list = criteria.list();
	            if (list.size() > 0) {
	                dto = (CourseDTO) list.get(0);
	            }

	        } catch (HibernateException e) {
	            log.error("Database Exception..", e);
	            throw new ApplicationException(
	                    "Exception in getting User by Login " + e.getMessage());

	        } finally {
	            session.close();
	        }

	        log.debug("Model findByName End");
	        return dto;
	}
	 /**
     * Find Course by PK
     *
     * @param pk
     *            : get parameter
     * @return dto
     * @throws DatabaseException
     */
	public CourseDTO findByPK(long pk) throws ApplicationException {
		log.debug("Model findByPK Started");
        Session session = null;
        CourseDTO dto = null;
        try {
            session = HibDataSource.getSession();
            dto = (CourseDTO) session.get(CourseDTO.class, pk);
        } catch (HibernateException e) {
            log.error("Database Exception..", e);
            throw new ApplicationException(
                    "Exception : Exception in getting College by pk");
        } finally {
            session.close();
        }

        log.debug("Model findByPK End");
        return dto;
	}
	/**
     * Searches Course with pagination
     *
     * @return list : List of Course
     * @param dto
     *            : Search Parameters
     * @param pageNo
     *            : Current Page No.
     * @param pageSize
     *            : Size of Page
     *
     * @throws DatabaseException
     */
	public List search(CourseDTO dto, int pageNo, int pageSize) throws ApplicationException {
		Session session=null;
		List list=null;
		try{
			session=HibDataSource.getSession();
			Criteria criteria=session.createCriteria(CourseDTO.class);
			if(dto.getId()>0){
				criteria.add(Restrictions.eq("id",dto.getId()));
			}
			System.out.println(dto.getCourseName());
			if(dto.getCourseName()!=null&&dto.getCourseName().length()>0){
				criteria.add(Restrictions.like("courseName",dto.getCourseName()+"%"));
			
			}
			if(dto.getDescription()!=null&&dto.getDescription().length()>0){
				criteria.add(Restrictions.like("description",dto.getDescription()+"%"));
			}
			if(dto.getDuration()!=null && dto.getDuration().length()>0){
				criteria.add(Restrictions.like("duration",dto.getDuration()+"%"));
			}
			// if page size is greater than zero the apply pagination
            if (pageSize > 0) {
                criteria.setFirstResult(((pageNo - 1) * pageSize));
                criteria.setMaxResults(pageSize);
            }

            list = criteria.list();
        } catch (HibernateException e) {
            log.error("Database Exception..", e);
            throw new ApplicationException("Exception in course search");
        } finally {
            session.close();
        }

        log.debug("Model search End");
		return list;
	}
	/**
     * Search Course
     *
     * @param dto
     *            : Search Parameters
     * @throws DatabaseException
     */
	public List search(CourseDTO dto) throws ApplicationException {
		// TODO Auto-generated method stub
		return search(dto, 0, 0);
	}
	/**
     * Gets List of Course
     *
     * @return list : List of Course
     * @throws DatabaseException
     */

	public List list() throws ApplicationException {
		// TODO Auto-generated method stub
		return list(0, 0);
	}
	/**
     * get List of Course with pagination
     *
     * @return list : List of College
     * @param pageNo
     *            : Current Page No.
     * @param pageSize
     *            : Size of Page
     * @throws DatabaseException
     */

	public List list(int pageNo, int pageSize) throws ApplicationException {
		 log.debug("Model list Started");
	        Session session = null;
	        List list = null;
	        try {
	            session = HibDataSource.getSession();
	            Criteria criteria = session.createCriteria(CourseDTO.class);

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
	                    "Exception : Exception in  Course list");
	        } finally {
	            session.close();
	        }

	        log.debug("Model list End");
	        return list;
	}

}

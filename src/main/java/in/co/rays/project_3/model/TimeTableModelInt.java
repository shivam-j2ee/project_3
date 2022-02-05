package in.co.rays.project_3.model;

import java.util.List;

import in.co.rays.project_3.dto.TimeTableDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;

public interface TimeTableModelInt {
	
	
	public TimeTableDTO  checkByCourseName(long CourseId,java.util.Date ExamDate)
		    throws ApplicationException;
	
	
	
	
	public TimeTableDTO  checkBySubjectName(long CourseId,long SubjectId,java.util.Date ExamDate)
		    throws ApplicationException;
	
	
	
	public TimeTableDTO checkBysemester(long CourseId,long SubjectId,String semester,java.util.Date ExamDate)
		    throws ApplicationException;
	
	
	
	  /**
     * Add a Student
     *
     * @param dto
     * @throws ApplicationException
     * @throws DuplicateRecordException
     *             : throws when Student already exists
     */
    public long add(TimeTableDTO dto) throws ApplicationException,
            DuplicateRecordException
            ;

    /**
     * Update a Student
     *
     * @param dto
     * @throws ApplicationException
     * @throws DuplicateRecordException
     *             : if updated user record is already exist
     */
    public void update(TimeTableDTO dto) throws ApplicationException,
            DuplicateRecordException;

    /**
     * Delete a Student
     *
     * @param dto
     * @throws ApplicationException
     */
    public void delete(TimeTableDTO dto) throws ApplicationException;

    /**
     * Find Student by EmailId
     *
     * @param name
     *            : get parameter
     * @return dto
     * @throws ApplicationException
     */
    public TimeTableDTO name(String emailId) throws ApplicationException;

    /**
     * Find Student by PK
     *
     * @param pk
     *            : get parameter
     * @return dto
     * @throws ApplicationException
     */
    public TimeTableDTO findByPK(long pk) throws ApplicationException;

    /**
     * Search Student with pagination
     *
     * @return list : List of Student
     * @param dto: Search Parameters
     * @param pageNo: Current Page No.
     * @param pageSize : Size of Page
     * @throws ApplicationException
     */
    public List search(TimeTableDTO dto, int pageNo, int pageSize)
            throws ApplicationException;

    /**
     * Search Student
     *
     * @return list : List of Student
     * @param dto: Search Parameters
     * @throws ApplicationException
     */
    public List search(TimeTableDTO dto) throws ApplicationException;

    /**
     * Gets List of College
     * @return list : List of College
     * @throws DatabaseException
     */
    public List list() throws ApplicationException;

    /**
     * get List of College with pagination
     *
     * @return list : List of College
     * @param pageNo : Current Page No.
     * @param pageSize: Size of Page            
     * @throws ApplicationException
     */
    public List list(int pageNo, int pageSize) throws ApplicationException;

}


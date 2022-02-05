package in.co.rays.project_3.model;

import java.util.List;

import in.co.rays.project_3.dto.FacultyDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;

/**
 * Data Access Object of Faculty
 *
 * @author Shivam Tiwari
 */

public interface FacultyModelInt {

    /**
     * Add a Faculty
     *
     * @param dto
     * @throws ApplicationException
     * @throws DuplicateRecordException
     *             : throws when Faculty already exists
     */
    public long add(FacultyDTO dto) throws ApplicationException,
            DuplicateRecordException;

    /**
     * Update a Faculty
     *
     * @param dto
     * @throws ApplicationException
     * @throws DuplicateRecordException
     *             : if updated user record is already exist
     */
    public void update(FacultyDTO dto) throws ApplicationException,
            DuplicateRecordException;

    /**
     * Delete a Faculty
     *
     * @param dto
     * @throws ApplicationException
     */
    public void delete(FacultyDTO dto) throws ApplicationException;

    /**
     * Find Faculty by EmailId
     *
     * @param name
     *            : get parameter
     * @return dto
     * @throws ApplicationException
     */
    public FacultyDTO findByEmailId(String emailId) throws ApplicationException;

    /**
     * Find Faculty by PK
     *
     * @param pk
     *            : get parameter
     * @return dto
     * @throws ApplicationException
     */
    public FacultyDTO findByPK(long pk) throws ApplicationException;

    /**
     * Search Faculty with pagination
     *
     * @return list : List of Faculty
     * @param dto: Search Parameters
     * @param pageNo: Current Page No.
     * @param pageSize : Size of Page
     * @throws ApplicationException
     */
    public List search(FacultyDTO dto, int pageNo, int pageSize)
            throws ApplicationException;

    /**
     * Search Faculty
     *
     * @return list : List of Faculty
     * @param dto: Search Parameters
     * @throws ApplicationException
     */
    public List search(FacultyDTO dto) throws ApplicationException;

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


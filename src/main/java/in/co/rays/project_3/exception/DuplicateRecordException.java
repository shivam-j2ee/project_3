package in.co.rays.project_3.exception;


/**
 * DuplicateRecordException thrown when a duplicate record occurred
 *
 * @author Shivam Tiwari
 *
 */

public class DuplicateRecordException extends Exception {

    /**
     * @param msg
     * error message
     */
    public DuplicateRecordException(String msg) {
        super(msg);
    }

}

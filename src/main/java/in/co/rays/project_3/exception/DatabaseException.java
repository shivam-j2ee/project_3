package in.co.rays.project_3.exception;


/**
 * DatabaseException is propogated by DAO classes when an unhandled Database
 * exception occurred
 *
 * @author Shivam Tiwari
 *
 */

public class DatabaseException extends Exception {

    /**
     * @param msg
     * Error message
     */
    public DatabaseException(String msg) {
        super(msg);
    }
}

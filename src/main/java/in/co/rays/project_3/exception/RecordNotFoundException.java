package in.co.rays.project_3.exception;

/**
 * RecordNotFoundException thrown when a record not found occurred
 *
 * @author Shivam Tiwari
 *
 */

public class RecordNotFoundException extends Exception{

    /**
     * @param msg
     * error message
     */
    public RecordNotFoundException(String msg) {
        super(msg);

    }
}

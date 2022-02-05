package in.co.rays.project_3.dto;

/**
 * Subject DTO Classes
 * @author Shivam Tiwari
 *
 */
public class SubjectDTO extends BaseDTO{
	/**
	 * Name of Subject 
	 */
	private String subjectName;
	/**
	 * Description of Subject 
	 */
	private String description;
	/**
	 * Name of Course
	 */
	private String courseName;
	/**
	 * ID of Course
	 */
	private long courseId;

	/**
	 * accessor
	 */
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public long getCourseId() {
		return courseId;
	}
	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}
	
	
	public String getKey() {
		return id+"";
	}


	public String getValue() {
		return subjectName;
	}

	


}


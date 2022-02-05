package in.co.rays.project_3.dto;

/**
 * Cousre DTO classes
 * @author Shivam Tiwari
 *
 */
public class CourseDTO extends BaseDTO{
	/**
	 * Name of Course
	 */
	private String courseName;
	/**
	 * Description of Course
	 */
	private String description;
	/**
	 * Duration of course
	 */
	private String duration;
	/**
	 * accessor
	 */
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getKey(){
		return id+"";
	}
	public String getValue(){
		return courseName;
	}
}
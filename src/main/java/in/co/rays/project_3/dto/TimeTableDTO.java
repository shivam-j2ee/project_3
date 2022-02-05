package in.co.rays.project_3.dto;

import java.util.Date;

/**
 * Time Table DTO Classes
 * @author Shivam Tiwari
 *
 */
public class TimeTableDTO extends BaseDTO {
	/**
	 * ID of Subject
	 */
	private long subId;
	/**
	 * Name of Subject 
	 */
	private String subName;
	/**
	 * ID of Course
	 */
	private long courseId;
	/**
	 * Name of Course
	 */
	private String courseName;
	/**
	 * Semester
	 */
	private String semester;
	/**
	 * Date of Exam
	 */
	private Date examDate;
	/**
	 * Time of Exam
	 */
	private String examTime;
	/**
	 * Description of TimeTable
	 */
	private String description;

	/**
	 * accessor
	 */
	public long getSubId() {
		return subId;
	}

	public void setSubId(long subId) {
		this.subId = subId;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	public String getExamTime() {
		return examTime;
	}

	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	public String getKey() {
		return id+"";
	}
	
	public String getValue() {
		return subName;
	}
}


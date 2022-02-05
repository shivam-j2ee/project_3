package in.co.rays.project_3.dto;

import java.util.Date;

/**
 * Faculty DTO classes
 * @author Shivam Tiwari
 *
 */
public class FacultyDTO extends BaseDTO {
	/**
	 * First Name of Faculty
	 */
	private String firstName;
	/**
	 * Last Name of Faculty
	 */
	private String lastName;
	/**
	 * Gender of Faculty 
	 */
	private String gender;
	/**
	 * Joining Date of Faculty
	 */
	private Date joiningDob;
	/**
	 * Qualification of Faculty
	 */
	private String qualification;
	/**
	 * Email ID of Faculty
	 */
	private String emailId;
	/**
	 * Mobile Number of Faculty
	 */
	private String mobileNo;
	/**
	 * ID of College
	 */
	private long collegeId;
	/**
	 * Name of College
	 */
	private String collegeName;
	/**
	 * ID of Course
	 */
	private long courseId;
	/**
	 * Name of Course
	 */
	private String courseName;
	/**
	 * ID of Subject
	 */
	private long subjectId;
	/**
	 * Name of Subject
	 */
	private String subjectName;

	/**
	 * accessor
	 */
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getJoiningDob() {
		return joiningDob;
	}

	public void setJoiningDob(Date joiningDob) {
		this.joiningDob = joiningDob;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public long getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(long collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
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

	public long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getKey() {
		return id + "";
	}

	public String getValue() {
		return firstName + " " + lastName;
	}

}

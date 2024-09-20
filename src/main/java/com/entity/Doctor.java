package com.entity;

public class Doctor {
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String gender;
	private String joiningDate;
	private String qualification;
	private String department;
	private String dob;
	private String mobNo;
	private String bloodGroup;
	private String image;
	
	
	public Doctor() {
		super();
	}
	
	public Doctor(String firstName, String lastName, String email, String password, String gender,
			String joiningDate, String qualification, String department, String dob, String mobNo, String bloodGroup, String image) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.joiningDate = joiningDate;
		this.qualification = qualification;
		this.department = department;
		this.dob = dob;
		this.mobNo = mobNo;
		this.bloodGroup = bloodGroup;
		this.image = image;
	}
	
	
	public Doctor(int id, String firstName, String lastName, String email, String password, String gender, String joiningDate,
			String qualification, String department, String dob, String mobNo, String bloodGroup) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.joiningDate = joiningDate;
		this.qualification = qualification;
		this.department = department;
		this.dob = dob;
		this.mobNo = mobNo;
		this.bloodGroup = bloodGroup;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getMobNo() {
		return mobNo;
	}
	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
	public String getBloodGroup() {
		return bloodGroup;
	}
	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	
}

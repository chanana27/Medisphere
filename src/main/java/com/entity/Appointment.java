package com.entity;

public class Appointment {
	private int id;
	private int userId;
	private int doctorId;
	private String fullName;
	private int age;
	private String email;
	private String appointmentDate;
	private String timeSlot;
	private String detail;
	private String status;
	
	public Appointment() {
		super();
	}
	
	public Appointment(int userId, int doctorId, String fullName, int age, String email, String appointmentDate,
			String timeSlot, String detail, String status) {
		super();
		this.userId = userId;
		this.doctorId = doctorId;
		this.fullName = fullName;
		this.age = age;
		this.email = email;
		this.appointmentDate = appointmentDate;
		this.timeSlot = timeSlot;
		this.detail = detail;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public String getTimeSlot() {
		return timeSlot;
	}

	public void setTimeSlot(String timeSlot) {
		this.timeSlot = timeSlot;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}


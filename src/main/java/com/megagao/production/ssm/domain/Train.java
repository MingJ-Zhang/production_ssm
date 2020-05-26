package com.megagao.production.ssm.domain;



import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Train {
	private int id;
	private String name;
	private String mode;
	private String teacher;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date start_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date end_time;
	private String address;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	
}

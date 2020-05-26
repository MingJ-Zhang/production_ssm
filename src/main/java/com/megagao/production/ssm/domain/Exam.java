package com.megagao.production.ssm.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Exam {
	private String id;
	private String title;
	private String teacher;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date create_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date over_time;
	private String address;
	private int type;
	private int lack_person;
	private String join_person;
	private String context;
	private String result;
	private String others;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getOver_time() {
		return over_time;
	}
	public void setOver_time(Date over_time) {
		this.over_time = over_time;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getLach_person() {
		return lack_person;
	}
	public void setLach_person(int lach_person) {
		this.lack_person = lach_person;
	}
	public String getJoin_person() {
		return join_person;
	}
	public void setJoin_person(String join_person) {
		this.join_person = join_person;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getOthers() {
		return others;
	}
	public void setOthers(String others) {
		this.others = others;
	}
	public Exam(String id, String title, String teacher, Date create_time,
			Date over_time, String address, int type, int lack_person,
			String join_person, String context, String result, String others) {
		super();
		this.id = id;
		this.title = title;
		this.teacher = teacher;
		this.create_time = create_time;
		this.over_time = over_time;
		this.address = address;
		this.type = type;
		this.lack_person = lack_person;
		this.join_person = join_person;
		this.context = context;
		this.result = result;
		this.others = others;
	}
	public Exam() {
		super();
	}
	
	
}

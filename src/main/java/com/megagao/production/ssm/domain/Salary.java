package com.megagao.production.ssm.domain;

import java.util.Date;

public class Salary {
	private String id;
	private String topic;
	private String month;
	private Date start_date;
	private Date end_date;
	private String user;
	private Date date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Salary(String id, String topic, String month, Date start_date,
			Date end_date, String user, Date date) {
		super();
		this.id = id;
		this.topic = topic;
		this.month = month;
		this.start_date = start_date;
		this.end_date = end_date;
		this.user = user;
		this.date = date;
	}
	public Salary() {
		super();
	}
	@Override
	public String toString() {
		return "Salary [id=" + id + ", topic=" + topic + ", month=" + month
				+ ", start_date=" + start_date + ", end_date=" + end_date
				+ ", user=" + user + ", date=" + date + "]";
	}
	
}

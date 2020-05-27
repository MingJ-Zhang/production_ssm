package com.megagao.production.ssm.domain;

import java.sql.Date;

import javax.management.loading.PrivateClassLoader;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class Job {

	@NotEmpty(message = "计划编号不能为空")
	private String idW;
	//所属月份

	@NotEmpty(message = "计划主题不能为空")
	 private String title;

	private String people;
	
//	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private String  startDate;
//	private Date  startDate;
	
	private String beizhu;


	@Override
	public String toString() {
		return "Job [idW=" + idW + ", title=" + title + ", people=" + people
				+ ", startDate=" + startDate + ", beizhu=" + beizhu + "]";
	}


	public Job(String idW, String title, String people, String startDate,
			String beizhu) {
		super();
		this.idW = idW;
		this.title = title;
		this.people = people;
		this.startDate = startDate;
		this.beizhu = beizhu;
	}


	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getIdW() {
		return idW;
	}


	public void setIdW(String idW) {
		this.idW = idW;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPeople() {
		return people;
	}


	public void setPeople(String people) {
		this.people = people;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getBeizhu() {
		return beizhu;
	}


	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	

	 
}

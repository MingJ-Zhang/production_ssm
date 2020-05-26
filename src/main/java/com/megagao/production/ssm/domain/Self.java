package com.megagao.production.ssm.domain;

import java.util.Date;

import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class Self {

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String now_time;
	
	private int self_id;

	private String title;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date end_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date start_date;

	private String evaluation_type;
	
	public String getNow_time() {
		return now_time;
	}

	public void setNow_time(String string) {
		this.now_time = string;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date examination_date;

	private String work_content;

	private String finish_situation;

	private String difficulty;

	private String suggest;

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getShortages() {
		return shortages;
	}

	public void setShortages(String shortages) {
		this.shortages = shortages;
	}

	public String getAfter_work() {
		return after_work;
	}

	public void setAfter_work(String after_work) {
		this.after_work = after_work;
	}

	private String remarks;

	private String shortages;

	private String after_work;

	public int getSelf_id() {
		return self_id;
	}

	public void setSelf_id(int self_id) {
		this.self_id = self_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public String getEvaluation_type() {
		return evaluation_type;
	}

	public void setEvaluation_type(String evaluation_type) {
		this.evaluation_type = evaluation_type;
	}

	public Date getExamination_date() {
		return examination_date;
	}

	public void setExamination_date(Date examination_date) {
		this.examination_date = examination_date;
	}

	public String getWork_content() {
		return work_content;
	}

	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}

	public String getFinish_situation() {
		return finish_situation;
	}

	public void setFinish_situation(String finish_situation) {
		this.finish_situation = finish_situation;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public String getSuggest() {
		return suggest;
	}

	public void setSuggest(String suggest) {
		this.suggest = suggest;
	}

}

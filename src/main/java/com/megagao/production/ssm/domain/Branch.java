package com.megagao.production.ssm.domain;

import org.hibernate.validator.constraints.NotEmpty;

public class Branch {

	private String id;
	private String name;
	private String short_name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@NotEmpty(message = "机构名称不能为空")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShort_name() {
		return short_name;
	}

	public void setShort_name(String short_name) {
		this.short_name = short_name;
	}

}

package com.megagao.production.ssm.domain;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class Quality {
	//编号规则名称
	private String id;
	//单据名称
	private String documentName;
	//编号前缀
	private String prefix;
	//日期类型
	private String dateType;
	//流水号长度
	private int length;
	//编号示例
	private String examples;
	//是否为缺省规则
	private boolean defaultRule;
	//启用状态
	private int type;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDocumentName() {
		return documentName;
	}
	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public String getDateType() {
		return dateType;
	}
	public void setDateType(String dateType) {
		this.dateType = dateType;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public String getExamples() {
		return examples;
	}
	public void setExamples(String examples) {
		this.examples = examples;
	}
	public boolean isDefaultRule() {
		return defaultRule;
	}
	public void setDefaultRule(boolean defaultRule) {
		this.defaultRule = defaultRule;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

	
	
	

}
package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.Report;

public interface ReportMapper {
	List<Report> find();

	int add(Report report);
	
}

package com.megagao.production.ssm.service;

import java.util.List;


import com.megagao.production.ssm.domain.Report;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface  ReportService {

	List<Report> find();
	
	EUDataGridResult getList(int page, int rows ) throws Exception;

	
	CustomResult insert(Report report) throws Exception;
	
	

}

package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.Assessment;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface AssessmentService {
	List<Assessment> find() throws Exception;

	EUDataGridResult getList(int page, int rows) throws Exception;
	
	EUDataGridResult searchAssessmentByid(Integer page, Integer rows,
			String id) throws Exception;
	
	EUDataGridResult searchAssessmentByname(Integer page, Integer rows,
			String name) throws Exception;
	EUDataGridResult searchAssessmentBymode(Integer page, Integer rows,
			String mode) throws Exception;
	
	CustomResult delete(String id) throws Exception;

	CustomResult deleteBatch(String[] ids) throws Exception;

	 CustomResult insert(Assessment assessment) throws Exception;
	 
	 Assessment get(String id);
	
}

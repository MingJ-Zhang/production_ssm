package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.Salary;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;


public interface SalaryService {
	List<Salary> find() throws Exception;
	
	EUDataGridResult getList(int page, int rows) throws Exception;
	
	CustomResult insert(Salary salary) throws Exception;
	
	CustomResult delete(String id) throws Exception;
	
	CustomResult deleteBatch(String[] ids) throws Exception;
}

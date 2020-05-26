package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.Salary;


public interface SalaryMapper {
	List<Salary> find();
	
	int add(Salary salary);
	
	int delete(String id);
	
	int deleteBatch(String[] ids);
	
	
}

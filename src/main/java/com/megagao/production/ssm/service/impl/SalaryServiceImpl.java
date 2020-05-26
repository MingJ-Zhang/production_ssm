package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.Salary;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.SalaryMapper;
import com.megagao.production.ssm.service.SalaryService;
@Service
public class SalaryServiceImpl implements SalaryService {
	
	@Autowired
	SalaryMapper salaryMapper;
	
	@Override
	public List<Salary> find() throws Exception {
		return salaryMapper.find();
	}

	@Override
	public EUDataGridResult getList(int page, int rows) throws Exception {
		
		PageHelper.startPage(page, rows);
		List<Salary> list = salaryMapper.find();
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Salary> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public CustomResult insert(Salary salary) throws Exception {
		int i = salaryMapper.add(salary);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "新增部门失败");
		}
	}
	@Override
	public CustomResult delete(String id) throws Exception {
		int i = salaryMapper.delete(id);
		if (i>0) {
			return CustomResult.ok();
		}else {
			return null;
		}
		
	}

	@Override
	public CustomResult deleteBatch(String[] ids) throws Exception {
		int i = salaryMapper.deleteBatch(ids);
		if (i>0) {
			return CustomResult.ok();
		}else {
			return null;
		}
	}
}

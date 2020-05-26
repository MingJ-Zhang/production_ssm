package com.megagao.production.ssm.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.megagao.production.ssm.domain.Branch;
import com.megagao.production.ssm.domain.Department;
import com.megagao.production.ssm.domain.Salary;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.service.BranchService;
import com.megagao.production.ssm.service.SalaryService;

@Controller
@RequestMapping("/salary")
public class SalaryController {
	@Autowired
	private SalaryService salaryservice;

	@RequestMapping("/find")
	public String find() throws Exception {
		return "salary_list";
	}

	@RequestMapping("/list")
	@ResponseBody
	public EUDataGridResult getItemList(Integer page, Integer rows)
			throws Exception {
		EUDataGridResult result = salaryservice.getList(page, rows);
		return result;
	}

	@RequestMapping("/add")
	public String add() throws Exception{
		return "salary_add";
	}
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	private CustomResult insert(@Valid Salary salary, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}	
			result = salaryservice.insert(salary);
		return result;
	}
	
	@RequestMapping(value = "/delete")
	@ResponseBody
	private CustomResult delete(String id) throws Exception {
		CustomResult result = salaryservice.delete(id);
		return result;
	}
	
	@RequestMapping(value="/delete_batch")
	@ResponseBody
	private CustomResult deleteBatch(String[] ids) throws Exception {
		CustomResult result = salaryservice.deleteBatch(ids);
		return result;
	}
}

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
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.service.BranchService;

@Controller
@RequestMapping("/branch")
public class BranchController {
	@Autowired
	private BranchService branchService;

	@RequestMapping("/find")
	public String find() throws Exception {
		return "branch_list";
	}

	@RequestMapping("/list")
	@ResponseBody
	public EUDataGridResult getItemList(Integer page, Integer rows)
			throws Exception {
		EUDataGridResult result = branchService.getList(page, rows);
		return result;
	}

	// 根据部门id查找
	@RequestMapping("/search_branch_by_branchId")
	@ResponseBody
	public EUDataGridResult searchBranchByid(Integer page, Integer rows,
			String searchValue) throws Exception {
		searchValue = new String(searchValue.getBytes("ISO-8859-1"),"UTF-8");	
		searchValue = "%" + searchValue + "%";
		EUDataGridResult result = branchService.searchBranchByid(page, rows,
				searchValue);
		return result;
	}

	// 根据部门name查找
	@RequestMapping("/search_branch_by_branchName")
	@ResponseBody
	public EUDataGridResult searchBranchByname(Integer page, Integer rows,
			String searchValue) throws Exception {
		searchValue = new String(searchValue.getBytes("ISO-8859-1"),"UTF-8");	
		searchValue = "%" + searchValue + "%";
		EUDataGridResult result = branchService.searchBranchByname(page, rows,
				searchValue);
		return result;
	}

	@RequestMapping(value = "/delete")
	@ResponseBody
	private CustomResult delete(String id) throws Exception {
		CustomResult result = branchService.delete(id);
		return result;
	}
	
	@RequestMapping(value="/delete_batch")
	@ResponseBody
	private CustomResult deleteBatch(String[] ids) throws Exception {
		CustomResult result = branchService.deleteBatch(ids);
		return result;
	}
	
	@RequestMapping("/add")
	public String add() throws Exception{
		return "branch_add";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	private CustomResult insert(@Valid Branch branch, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		if(branchService.get(branch.getId()) != null){
			result = new CustomResult(0, "该部门编号已经存在，请更换部门编号！", null);
		}else{
			result = branchService.insert(branch);
		}
		return result;
	}
	
	@RequestMapping("/edit")
	public String edit() throws Exception{
		return "branch_edit";
	}
	
	@RequestMapping(value="/update_all")
	@ResponseBody
	private CustomResult updateAll(@Valid Branch branch, BindingResult bindingResult) throws Exception {
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		return branchService.update(branch);
	}
}

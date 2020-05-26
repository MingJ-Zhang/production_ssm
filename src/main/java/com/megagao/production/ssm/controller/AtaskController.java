package com.megagao.production.ssm.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.megagao.production.ssm.domain.Atask;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.service.AtaskService;

@Controller
@RequestMapping("/atask")
public class AtaskController {
	@Autowired
	private AtaskService ataskService;

	@RequestMapping("/find")
	public String find() throws Exception {
		return "atask_list";
	}

	@RequestMapping("/get_data")
	@ResponseBody
	public List<Atask> getData() throws Exception{
		return ataskService.find();
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public EUDataGridResult getItemList(Integer page, Integer rows)
			throws Exception {
		EUDataGridResult result = ataskService.getList(page, rows);
		return result;
	}
	
	@RequestMapping("/search_atask_by_ataskId")
	@ResponseBody
	public EUDataGridResult searchTrainByid(Integer page, Integer rows,
			String searchValue) throws Exception {
		searchValue = new String(searchValue.getBytes("ISO-8859-1"),"UTF-8");	
		searchValue = "%" + searchValue + "%";
		EUDataGridResult result = ataskService.searchAtaskByid(page, rows, searchValue);
		return result;
	}
	
	@RequestMapping("/search_atask_by_ataskTheme")
	@ResponseBody
	public EUDataGridResult searchTrainByname(Integer page, Integer rows,
			String searchValue) throws Exception {
		searchValue = new String(searchValue.getBytes("ISO-8859-1"),"UTF-8");	
		searchValue = "%" + searchValue + "%";
		EUDataGridResult result = ataskService.searchAtaskBytheme(page, rows, searchValue);
		return result;
	}
	
	@RequestMapping("/search_atask_by_ataskType")
	@ResponseBody
	public EUDataGridResult searchTrainBymode(Integer page, Integer rows,
			String searchValue) throws Exception {
		searchValue = new String(searchValue.getBytes("ISO-8859-1"),"UTF-8");	
		searchValue = "%" + searchValue + "%";
		EUDataGridResult result = ataskService.searchAtaskBytype(page, rows, searchValue);
		return result;
	}
	
	@RequestMapping("/add")
	public String add() throws Exception{
		return "atask_add";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	private CustomResult insert(@Valid Atask atask, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		if(ataskService.get(atask.getId()) != null){
			result = new CustomResult(0, "该考核任务编号已经存在，请更换考核任务编号！", null);
		}else{
			result = ataskService.insert(atask);
		}
		return result;
	}
	
	@RequestMapping(value = "/delete")
	@ResponseBody
	private CustomResult delete(String id) throws Exception {
		CustomResult result = ataskService.delete(id);
		return result;
	}
	
	@RequestMapping(value="/delete_batch")
	@ResponseBody
	private CustomResult deleteBatch(String[] ids) throws Exception {
		CustomResult result = ataskService.deleteBatch(ids);
		return result;
	}
}

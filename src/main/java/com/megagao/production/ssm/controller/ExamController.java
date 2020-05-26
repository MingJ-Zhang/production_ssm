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
import com.megagao.production.ssm.domain.Exam;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.service.ExamService;

@Controller
@RequestMapping("exam")
public class ExamController {
	@Autowired
	ExamService examService;
	
	@RequestMapping("/find")
	public String find() throws Exception {
		return "exam_list";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public EUDataGridResult getList(Integer page, Integer rows) throws Exception{
		EUDataGridResult result = examService.getList(page, rows);
		return result;
	}
	
	@RequestMapping("/add")
	public String add() throws Exception{
		System.out.println("添加中");
		return "exam_add";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	@ResponseBody
	private CustomResult insert(@Valid Exam exam, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			System.out.println(fieldError.getDefaultMessage());
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		if(examService.getExamById(exam.getId())!=null){
			result = new CustomResult(0, "考试构编号已经存在，请更换考试编号！", null);
		}else{
			result = examService.add(exam);
		}
		return result;
	}
	
	@RequestMapping(value="/delete_batch")
	@ResponseBody
	private CustomResult deleteBatch(String[] ids) throws Exception {
		CustomResult result = examService.deleteBatch(ids);
		return result;
	}
}

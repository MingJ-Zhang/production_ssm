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

import com.megagao.production.ssm.domain.Assessment;
import com.megagao.production.ssm.domain.Employee;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.service.AssessmentService;

@Controller
@RequestMapping("/assessment")
public class AssessmentController {
	@Autowired
	private AssessmentService assessmentService;

	@RequestMapping("/find")
	public String find() throws Exception {
		return "assessment_list";
	}

	@RequestMapping("/get_data")
	@ResponseBody
	public List<Assessment> getData() throws Exception{
		return assessmentService.find();
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public EUDataGridResult getItemList(Integer page, Integer rows)
			throws Exception {
		EUDataGridResult result = assessmentService.getList(page, rows);
		return result;
	}
	
	@RequestMapping("/search_assessment_by_assessmentId")
	@ResponseBody
	public EUDataGridResult searchTrainByid(Integer page, Integer rows,
			String searchValue) throws Exception {
		searchValue = new String(searchValue.getBytes("ISO-8859-1"),"UTF-8");	
		searchValue = "%" + searchValue + "%";
		EUDataGridResult result = assessmentService.searchAssessmentByid(page, rows, searchValue);
		return result;
	}
	
	@RequestMapping("/search_assessment_by_assessmentName")
	@ResponseBody
	public EUDataGridResult searchTrainByname(Integer page, Integer rows,
			String searchValue) throws Exception {
		searchValue = new String(searchValue.getBytes("ISO-8859-1"),"UTF-8");	
		searchValue = "%" + searchValue + "%";
		EUDataGridResult result = assessmentService.searchAssessmentByname(page, rows, searchValue);
		return result;
	}
	
	@RequestMapping("/search_assessment_by_assessmentMode")
	@ResponseBody
	public EUDataGridResult searchTrainBymode(Integer page, Integer rows,
			String searchValue) throws Exception {
		searchValue = new String(searchValue.getBytes("ISO-8859-1"),"UTF-8");	
		searchValue = "%" + searchValue + "%";
		EUDataGridResult result = assessmentService.searchAssessmentBymode(page, rows, searchValue);
		return result;
	}
	
	@RequestMapping("/add")
	public String add() throws Exception{
		return "assessment_add";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	private CustomResult insert(@Valid Assessment assessment, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		if(assessmentService.get(assessment.getId()) != null){
			result = new CustomResult(0, "该培训考核编号已经存在，请更换培训考核编号！", null);
		}else{
			result = assessmentService.insert(assessment);
			System.out.println(result.getData());
		}
		return result;
	}
	
	@RequestMapping(value = "/delete")
	@ResponseBody
	private CustomResult delete(String id) throws Exception {
		CustomResult result = assessmentService.delete(id);
		return result;
	}
	
	@RequestMapping(value="/delete_batch")
	@ResponseBody
	private CustomResult deleteBatch(String[] ids) throws Exception {
		CustomResult result = assessmentService.deleteBatch(ids);
		return result;
	}
}

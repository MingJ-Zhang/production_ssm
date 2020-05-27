package com.megagao.production.ssm.controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.megagao.production.ssm.domain.Job;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.service.JobService;

@Controller
@RequestMapping("/job")
public class JobController {
		@Autowired
	private JobService jobService;

		@RequestMapping("/find")
		public String find() throws Exception {
			return "job_list";
		}

		@RequestMapping("/list")
		@ResponseBody
		public EUDataGridResult getList(Integer page, Integer rows)
				throws Exception {
			System.out.println("吉拉拉");
			EUDataGridResult result = jobService.getList(page, rows);
			return result;
		}
		
		

		@RequestMapping("/add")
		public String add() throws Exception{
			return "job_add";
		}
		@RequestMapping(value="/insert", method=RequestMethod.POST)
		@ResponseBody
		private CustomResult insert(@Valid Job job, BindingResult bindingResult) throws Exception {
			CustomResult result;
			if(bindingResult.hasErrors()){
				FieldError fieldError = bindingResult.getFieldError();
				return CustomResult.build(100, fieldError.getDefaultMessage());
			}	
				result =jobService.insert(job);
			return result;
		}
		
		
		@RequestMapping(value="/delete_batch")
		@ResponseBody
		private CustomResult deleteJob(String[] ids) throws Exception {
			CustomResult result = jobService.deleteBatch(ids);
			return result;
		}
	}
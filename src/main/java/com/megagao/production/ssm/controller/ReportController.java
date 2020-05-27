package com.megagao.production.ssm.controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.megagao.production.ssm.domain.Report;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {
		@Autowired
	private ReportService reportService;

		@RequestMapping("/find")
		public String find() throws Exception {
			return "report_list";
		}

		@RequestMapping("/list")
		@ResponseBody
		public EUDataGridResult getList(Integer page, Integer rows)
				throws Exception {
			EUDataGridResult result = reportService.getList(page, rows);
			return result;
		}
		
		

		@RequestMapping("/add")
		public String add() throws Exception{
			return "report_add";
		}
		@RequestMapping(value="/insert", method=RequestMethod.POST)
		@ResponseBody
		private CustomResult insert(@Valid Report report, BindingResult bindingResult) throws Exception {
			CustomResult result;
			if(bindingResult.hasErrors()){
				FieldError fieldError = bindingResult.getFieldError();
				return CustomResult.build(100, fieldError.getDefaultMessage());
			}	
				result =reportService.insert(report);
			return result;
		}
	}
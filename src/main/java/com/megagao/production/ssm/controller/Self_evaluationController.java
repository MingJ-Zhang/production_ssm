package com.megagao.production.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.megagao.production.ssm.domain.Self;
import com.megagao.production.ssm.domain.Work;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.domain.vo.WorkVO;
import com.megagao.production.ssm.service.SelfService;
import com.megagao.production.ssm.service.WorkService;

@Controller
@RequestMapping("/self")
public class Self_evaluationController {
	@Autowired
	private SelfService selfService;

	@RequestMapping("/add")
	public String add() throws Exception {
		return "self_add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	private CustomResult add(@Valid Self self, BindingResult bindingResult)
			throws Exception {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
		self.setNow_time(df.format(System.currentTimeMillis()));
		return selfService.add(self);

	}

	@RequestMapping("/find")
	public String find() throws Exception {
		return "self_list";
	}

	@RequestMapping("/list")
	@ResponseBody
	public EUDataGridResult getList(Integer page, Integer rows)
			throws Exception {
		EUDataGridResult result = selfService.getList(page, rows);
		return result;
	}

}

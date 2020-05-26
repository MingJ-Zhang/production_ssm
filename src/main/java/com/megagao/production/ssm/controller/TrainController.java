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

import com.megagao.production.ssm.domain.Train;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.service.TrainService;

@Controller
@RequestMapping("/train")
public class TrainController {
	@Autowired
	private TrainService trainService;

	@RequestMapping("/find")
	public String find() throws Exception {
		return "train_list";
	}
	
	@RequestMapping("/get_data")
	@ResponseBody
	public List<Train> getData() throws Exception{
		return trainService.find();
	}
	@RequestMapping("/list")
	@ResponseBody
	public EUDataGridResult getItemList(Integer page, Integer rows)
			throws Exception {
		EUDataGridResult result = trainService.getList(page, rows);
		return result;
	}
	
	@RequestMapping("/search_train_by_trainId")
	@ResponseBody
	public EUDataGridResult searchTrainByid(Integer page, Integer rows,
			int searchValue) throws Exception {
		
		EUDataGridResult result = trainService.searchTrainByid(page, rows, searchValue);
		return result;
	}
	
	@RequestMapping("/search_train_by_trainName")
	@ResponseBody
	public EUDataGridResult searchTrainByname(Integer page, Integer rows,
			String searchValue) throws Exception {
		searchValue = new String(searchValue.getBytes("ISO-8859-1"),"UTF-8");	
		searchValue = "%" + searchValue + "%";
		EUDataGridResult result = trainService.searchTrainByname(page, rows, searchValue);
		return result;
	}
	
	@RequestMapping("/search_train_by_trainMode")
	@ResponseBody
	public EUDataGridResult searchTrainBymode(Integer page, Integer rows,
			String searchValue) throws Exception {
		searchValue = new String(searchValue.getBytes("ISO-8859-1"),"UTF-8");	
		searchValue = "%" + searchValue + "%";
		EUDataGridResult result = trainService.searchTrainBymode(page, rows, searchValue);
		return result;
	}
	
	@RequestMapping("/add")
	public String add() throws Exception{
		return "train_add";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	private CustomResult insert(@Valid Train train, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if(bindingResult.hasErrors()){
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		if(trainService.get(train.getId()) != null){
			result = new CustomResult(0, "该培训编号已经存在，请更换培训编号！", null);
		}else{
			result = trainService.insert(train);
		}
		return result;
	}
	
	@RequestMapping(value = "/delete")
	@ResponseBody
	private CustomResult delete(int id) throws Exception {
		CustomResult result = trainService.delete(id);
		return result;
	}
	
	@RequestMapping(value="/delete_batch")
	@ResponseBody
	private CustomResult deleteBatch(int[] ids) throws Exception {
		CustomResult result = trainService.deleteBatch(ids);
		return result;
	}
}

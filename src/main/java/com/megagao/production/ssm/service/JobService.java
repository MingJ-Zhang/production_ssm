package com.megagao.production.ssm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.megagao.production.ssm.domain.Job;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface  JobService {

	List<Job> find();
	
	EUDataGridResult getList(int page, int rows ) throws Exception;

	
	CustomResult insert(Job job) throws Exception;
	
	
	CustomResult deleteBatch(String[] ids) throws Exception;

}

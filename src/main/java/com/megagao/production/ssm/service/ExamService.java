package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.Branch;
import com.megagao.production.ssm.domain.Exam;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface ExamService {
	List<Exam> find();
	
	EUDataGridResult getList(int page, int rows ) throws Exception;
	
	Exam getExamById(String id);
	
	CustomResult add(Exam exam);
	
	CustomResult deleteBatch(String[] ids) throws Exception;
	
	 //更新全部字段，不判断非空，直接进行更新
    CustomResult updateAll(Branch branch) throws Exception;
} 

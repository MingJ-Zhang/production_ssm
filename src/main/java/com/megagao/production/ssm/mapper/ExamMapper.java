package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.Branch;
import com.megagao.production.ssm.domain.Exam;

public interface ExamMapper {
	List<Exam> find();
	
	Exam getExamById(String id);
	
	int add(Exam exam);
	
	int deleteBatch(String[] ids);
	
	int updateByPrimaryKey(Exam exam);
}

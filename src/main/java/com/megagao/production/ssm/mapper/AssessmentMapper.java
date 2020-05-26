package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.Assessment;

public interface AssessmentMapper {
	List<Assessment> find();
	
	List<Assessment> searchAssessmentByid(String id);
	List<Assessment> searchAssessmentBymode(String mode);
	List<Assessment> searchAssessmentByname(String name);
	int delete(String id);
	
	int deleteBatch(String[] ids);
	
	int add(Assessment assessment);
	Assessment load(String id);
}

package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.Job;

public interface JobMapper {

    List<Job> find() ;	
 
    int add(Job job);
	
	int deleteBatch(String[] ids);
}

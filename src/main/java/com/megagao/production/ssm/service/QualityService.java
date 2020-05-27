package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.Quality;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface QualityService {
	List<Quality> find();
	
	EUDataGridResult getList(int page, int rows ) throws Exception;
	
	CustomResult add(Quality quality);
	
	CustomResult deleteBatch(String[] numberNames) throws Exception;

	Object get(String numberName);
	
}

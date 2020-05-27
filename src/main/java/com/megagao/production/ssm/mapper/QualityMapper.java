package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.Quality;

public interface QualityMapper {
	List<Quality> find();

	int add(Quality quality);

	int deleteBatch(String[] ids);
	
}

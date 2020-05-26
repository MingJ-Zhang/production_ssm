package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.Self;

public interface SelfMapper {
 
	int add(Self self);
	
	List<Self> list();
}

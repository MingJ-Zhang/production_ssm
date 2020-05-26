package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.Atask;

public interface AtaskMapper {
	List<Atask> find();
	
	List<Atask> searchAtaskByid(String id);
	List<Atask> searchAtaskBytheme(String theme);
	List<Atask> searchAtaskBytype(String type);
	
	int delete(String id);
	
	int deleteBatch(String[] ids);
	
	int add(Atask atask);
	
	Atask load(String id);
}

package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.Atask;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface AtaskService {
	List<Atask> find() throws Exception;

	EUDataGridResult getList(int page, int rows) throws Exception;
	
	EUDataGridResult searchAtaskByid(Integer page, Integer rows,
			String id) throws Exception;
	
	EUDataGridResult searchAtaskBytheme(Integer page, Integer rows,
			String theme) throws Exception;
	EUDataGridResult searchAtaskBytype(Integer page, Integer rows,
			String type) throws Exception;
	
	CustomResult delete(String id) throws Exception;

	CustomResult deleteBatch(String[] ids) throws Exception;

	 CustomResult insert(Atask atask) throws Exception;
	 
	 Atask get(String id);
	
}

package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.Branch;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface BranchService {
	List<Branch> find() throws Exception;

	EUDataGridResult getList(int page, int rows) throws Exception;
	
	EUDataGridResult searchBranchByid(Integer page, Integer rows,
			String id) throws Exception;
	
	EUDataGridResult searchBranchByname(Integer page, Integer rows,
			String name) throws Exception;
	
	CustomResult delete(String id) throws Exception;

	CustomResult deleteBatch(String[] ids) throws Exception;

	 CustomResult insert(Branch branch) throws Exception;
	 
	 Branch get(String id);
	 
	 CustomResult update(Branch branch) throws Exception;
}

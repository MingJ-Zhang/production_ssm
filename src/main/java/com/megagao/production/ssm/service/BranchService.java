package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.Branch;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface BranchService {
	List<Branch> find();
	
	public EUDataGridResult getList(int page, int rows ) throws Exception;
}

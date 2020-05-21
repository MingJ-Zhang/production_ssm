package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.Branch;
import com.megagao.production.ssm.domain.Department;

public interface BranchMapper {
	List<Branch> find();
	
	List<Branch> searchBranchByid(String id);

	List<Branch> searchBranchByname(String name);
	
	int delete(String id);
	
	int deleteBatch(String[] ids);
	
	int add(Branch branch);
	
	Branch load(String id);
	
	int update(Branch branch);
}

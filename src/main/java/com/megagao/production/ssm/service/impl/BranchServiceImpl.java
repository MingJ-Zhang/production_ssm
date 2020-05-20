package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.Branch;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.BranchMapper;
import com.megagao.production.ssm.service.BranchService;

@Service
public class BranchServiceImpl implements BranchService {

	@Autowired
	BranchMapper branchMapper;

	@Override
	public List<Branch> find() {
		return branchMapper.find();
	}

	@Override
	public EUDataGridResult getList(int page, int rows) throws Exception {
		
		//分页处理
		PageHelper.startPage(page, rows);
		List<Branch> list = branchMapper.find();
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Branch> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	
}

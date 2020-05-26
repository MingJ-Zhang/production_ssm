package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.Assessment;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.AssessmentMapper;
import com.megagao.production.ssm.service.AssessmentService;
@Service
public class AssessmentServiceImpl implements AssessmentService{
	@Autowired
	AssessmentMapper assessmentMapper;
	@Override
	public List<Assessment> find() throws Exception {
		return assessmentMapper.find();
	}

	@Override
	public EUDataGridResult getList(int page, int rows) throws Exception {
		//分页处理
		PageHelper.startPage(page, rows);
		List<Assessment> list = assessmentMapper.find();
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Assessment> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EUDataGridResult searchAssessmentByid(Integer page, Integer rows, String id)
			throws Exception {
		//分页处理
				PageHelper.startPage(page, rows);
				List<Assessment> list = assessmentMapper.searchAssessmentByid(id);
				//创建一个返回值对象
				EUDataGridResult result = new EUDataGridResult();
				result.setRows(list);
				//取记录总条数
				PageInfo<Assessment> pageInfo = new PageInfo<>(list);
				result.setTotal(pageInfo.getTotal());
				return result;
	}

	@Override
	public EUDataGridResult searchAssessmentByname(Integer page, Integer rows,
			String name) throws Exception {
		//分页处理
		PageHelper.startPage(page, rows);
		List<Assessment> list = assessmentMapper.searchAssessmentByname(name);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Assessment> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EUDataGridResult searchAssessmentBymode(Integer page, Integer rows,
			String mode) throws Exception {
		//分页处理
		PageHelper.startPage(page, rows);
		List<Assessment> list = assessmentMapper.searchAssessmentBymode(mode);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Assessment> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public CustomResult delete(String id) throws Exception {
		int i = assessmentMapper.delete(id);
		if (i>0) {
			return CustomResult.ok();
		}else {
			return null;
		}
	}

	@Override
	public CustomResult deleteBatch(String[] ids) throws Exception {
		int i = assessmentMapper.deleteBatch(ids);
		if (i>0) {
			return CustomResult.ok();
		}else {
			return null;
		}
	}

	@Override
	public CustomResult insert(Assessment assessment) throws Exception {
		int i = assessmentMapper.add(assessment);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "新增培训考核失败");
		}
	}

	@Override
	public Assessment get(String id) {
		return assessmentMapper.load(id);
	}

}

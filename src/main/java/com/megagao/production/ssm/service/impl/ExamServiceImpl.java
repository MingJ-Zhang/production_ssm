package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.Branch;
import com.megagao.production.ssm.domain.Exam;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.ExamMapper;
import com.megagao.production.ssm.service.ExamService;
@Service
public class ExamServiceImpl implements ExamService{

	@Autowired
	ExamMapper examMapper;
	
	@Override
	public List<Exam> find() {
		// TODO Auto-generated method stub
		return examMapper.find();
	}

	@Override
	public EUDataGridResult getList(int page, int rows) throws Exception {
		//分页处理
		PageHelper.startPage(page, rows);
		List<Exam> list = examMapper.find();
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Exam> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public Exam getExamById(String id) {
		// TODO Auto-generated method stub
		return examMapper.getExamById(id);
	}

	@Override
	public CustomResult add(Exam exam) {
		int i = examMapper.add(exam);
		if(i>0){
			return CustomResult.ok();
		}else{
		return CustomResult.build(101, "新增考试失败");
	}
	}

	@Override
	public CustomResult deleteBatch(String[] ids) throws Exception {
		int i = examMapper.deleteBatch(ids);
		if(i>0){
			return CustomResult.ok();
		}
		return null;
	}

	@Override
	public CustomResult updateAll(Branch branch) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

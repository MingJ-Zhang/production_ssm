package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.Quality;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.QualityMapper;
import com.megagao.production.ssm.service.QualityService;


@Service
public class QualityServiceImpl implements QualityService{
	@Autowired
	QualityMapper qualityMapper;

	@Override
	public List<Quality> find() {
		// TODO Auto-generated method stub
		return qualityMapper.find();
	}

	@Override
	public EUDataGridResult getList(int page, int rows) throws Exception {
		//分页处理
		PageHelper.startPage(page,rows);
		List<Quality>list=qualityMapper.find();
		//创建一个返回值对象
		EUDataGridResult result=new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Quality> pageInfo=new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public CustomResult add(Quality quality) {
		int i = qualityMapper.add(quality);
		if(i>0){
			return CustomResult.ok();
		}else{
		return CustomResult.build(101, "新增失败");
	}
	}

	@Override
	public CustomResult deleteBatch(String[] numberNames) throws Exception {
		int i = qualityMapper.deleteBatch(numberNames);
		if(i>0){
			return CustomResult.ok();
		}
		return null;
	}

	@Override
	public Object get(String numberName) {
		// TODO Auto-generated method stub
		return null;
	}



	

}

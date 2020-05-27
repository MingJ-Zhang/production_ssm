package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.Job;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.JobMapper;
import com.megagao.production.ssm.service.JobService;
@Service
public class JobServiceImpl implements JobService {

	@Autowired
	JobMapper jobMapper;

	@Override
	public List<Job> find() {
		// TODO Auto-generated method stub
		return jobMapper.find();
	}

	@Override
	public EUDataGridResult getList(int page, int rows) throws Exception {
		//分页处理
				PageHelper.startPage(page, rows);
				List<Job> list = jobMapper.find();
				//创建一个返回值对象
				EUDataGridResult result = new EUDataGridResult();
				result.setRows(list);
				//取记录总条数
				PageInfo<Job> pageInfo = new PageInfo<>(list);
				result.setTotal(pageInfo.getTotal());
				return result;
			}

	@Override
	public CustomResult insert(Job job) throws Exception {
		int i = jobMapper.add(job);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "新增部门失败");
		}
	}

	

	@Override
	public CustomResult deleteBatch(String[] ids) throws Exception {
		int i = jobMapper.deleteBatch(ids);
		if (i>0) {
			return CustomResult.ok();
		}else {
			return null;
		}
	}
	}
	
	



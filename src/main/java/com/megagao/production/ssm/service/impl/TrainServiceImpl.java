package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.Train;
import com.megagao.production.ssm.domain.Train;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.TrainMapper;
import com.megagao.production.ssm.service.TrainService;
@Service
public class TrainServiceImpl implements TrainService{
	@Autowired
	TrainMapper trainMapper;
	@Override
	public List<Train> find() throws Exception {
		return trainMapper.find();
	}

	@Override
	public EUDataGridResult getList(int page, int rows) throws Exception {
		//分页处理
		PageHelper.startPage(page, rows);
		List<Train> list = trainMapper.find();
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Train> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EUDataGridResult searchTrainByid(Integer page, Integer rows, int id)
			throws Exception {
		//分页处理
				PageHelper.startPage(page, rows);
				List<Train> list = trainMapper.searchTrainByid(id);
				//创建一个返回值对象
				EUDataGridResult result = new EUDataGridResult();
				result.setRows(list);
				//取记录总条数
				PageInfo<Train> pageInfo = new PageInfo<>(list);
				result.setTotal(pageInfo.getTotal());
				return result;
	}

	@Override
	public EUDataGridResult searchTrainByname(Integer page, Integer rows,
			String name) throws Exception {
		//分页处理
		PageHelper.startPage(page, rows);
		List<Train> list = trainMapper.searchTrainByname(name);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Train> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EUDataGridResult searchTrainBymode(Integer page, Integer rows,
			String mode) throws Exception {
		//分页处理
		PageHelper.startPage(page, rows);
		List<Train> list = trainMapper.searchTrainBymode(mode);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Train> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public CustomResult delete(int id) throws Exception {
		int i = trainMapper.delete(id);
		if (i>0) {
			return CustomResult.ok();
		}else {
			return null;
		}
	}

	@Override
	public CustomResult deleteBatch(int[] ids) throws Exception {
		int i = trainMapper.deleteBatch(ids);
		if (i>0) {
			return CustomResult.ok();
		}else {
			return null;
		}
	}

	@Override
	public CustomResult insert(Train train) throws Exception {
		int i = trainMapper.add(train);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "新增培训失败");
		}
	}

	@Override
	public Train get(int id) {
		return trainMapper.load(id);
	}

}

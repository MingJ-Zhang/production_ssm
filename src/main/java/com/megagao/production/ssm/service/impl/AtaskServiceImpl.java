package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.Atask;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.AtaskMapper;
import com.megagao.production.ssm.service.AtaskService;

@Service
public class AtaskServiceImpl implements AtaskService{
	@Autowired
	AtaskMapper ataskMapper;

	@Override
	public List<Atask> find() throws Exception {
		return ataskMapper.find();
	}

	@Override
	public EUDataGridResult getList(int page, int rows) throws Exception {
		//分页处理
				PageHelper.startPage(page, rows);
				List<Atask> list = ataskMapper.find();
				//创建一个返回值对象
				EUDataGridResult result = new EUDataGridResult();
				result.setRows(list);
				//取记录总条数
				PageInfo<Atask> pageInfo = new PageInfo<>(list);
				result.setTotal(pageInfo.getTotal());
				return result;
	}

	@Override
	public EUDataGridResult searchAtaskByid(Integer page, Integer rows,
			String id) throws Exception {
		//分页处理
		PageHelper.startPage(page, rows);
		List<Atask> list = ataskMapper.searchAtaskByid(id);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Atask> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EUDataGridResult searchAtaskBytheme(Integer page, Integer rows,
			String theme) throws Exception {
		PageHelper.startPage(page, rows);
		List<Atask> list = ataskMapper.searchAtaskBytheme(theme);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Atask> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EUDataGridResult searchAtaskBytype(Integer page, Integer rows,
			String type) throws Exception {
		PageHelper.startPage(page, rows);
		List<Atask> list = ataskMapper.searchAtaskBytype(type);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Atask> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public CustomResult delete(String id) throws Exception {
		int i = ataskMapper.delete(id);
		if (i>0) {
			return CustomResult.ok();
		}else {
			return null;
		}
	}

	@Override
	public CustomResult deleteBatch(String[] ids) throws Exception {
		int i = ataskMapper.deleteBatch(ids);
		if (i>0) {
			return CustomResult.ok();
		}else {
			return null;
		}
	}

	@Override
	public CustomResult insert(Atask atask) throws Exception {
		int i = ataskMapper.add(atask);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "新增考核任务失败");
		}
	}

	@Override
	public Atask get(String id) {
		
		return ataskMapper.load(id);
	}
}

package com.megagao.production.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.megagao.production.ssm.domain.Branch;
import com.megagao.production.ssm.domain.Self;
import com.megagao.production.ssm.domain.authority.SysPermission;
import com.megagao.production.ssm.domain.authority.SysPermissionExample;
import com.megagao.production.ssm.domain.authority.SysUser;
import com.megagao.production.ssm.domain.authority.SysUserExample;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;
import com.megagao.production.ssm.mapper.SelfMapper;
import com.megagao.production.ssm.mapper.authority.SysPermissionMapper;
import com.megagao.production.ssm.mapper.authority.SysPermissionMapperCustom;
import com.megagao.production.ssm.mapper.authority.SysUserMapper;
import com.megagao.production.ssm.service.SelfService;
import com.megagao.production.ssm.util.CollectionsFactory;

@Service
public class SelfServiceImpl implements SelfService {
	@Autowired
	private SelfMapper selfMapper;

	


	@Override
	// 添加 如果添加成功 则显示添加成功
	public CustomResult add(Self self) {
		int i = selfMapper.add(self);
		if (i > 0) {
			return CustomResult.ok();
		} else {
			return CustomResult.build(101, "新增xx失败");
		}
	}


	
	@Override
	public EUDataGridResult getList(int page, int rows) throws Exception {
		// 分页处理
		PageHelper.startPage(page, rows);
		List<Self> list = selfMapper.list();
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		PageInfo<Self> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}


	@Override
	public List<Self> list() {
		
		return selfMapper.list();
	}

}

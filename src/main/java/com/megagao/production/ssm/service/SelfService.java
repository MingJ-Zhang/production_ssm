package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.Self;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface SelfService {
	CustomResult add(Self self);

	List<Self> list();

	EUDataGridResult getList(int page, int rows) throws Exception;
}

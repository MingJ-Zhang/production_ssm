package com.megagao.production.ssm.service;

import java.util.List;

import com.megagao.production.ssm.domain.Train;
import com.megagao.production.ssm.domain.customize.CustomResult;
import com.megagao.production.ssm.domain.customize.EUDataGridResult;

public interface TrainService {
	List<Train> find() throws Exception;

	EUDataGridResult getList(int page, int rows) throws Exception;
	
	EUDataGridResult searchTrainByid(Integer page, Integer rows,
			int id) throws Exception;
	
	EUDataGridResult searchTrainByname(Integer page, Integer rows,
			String name) throws Exception;
	EUDataGridResult searchTrainBymode(Integer page, Integer rows,
			String mode) throws Exception;
	
	CustomResult delete(int id) throws Exception;

	CustomResult deleteBatch(int[] ids) throws Exception;

	 CustomResult insert(Train train) throws Exception;
	 
	 Train get(int id);
	
}

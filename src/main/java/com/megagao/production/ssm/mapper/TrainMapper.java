package com.megagao.production.ssm.mapper;

import java.util.List;

import com.megagao.production.ssm.domain.Train;

public interface TrainMapper {
	List<Train> find();
	
	List<Train> searchTrainByid(int id);
	List<Train> searchTrainByname(String name);
	List<Train> searchTrainBymode(String mode);
	
	int delete(int id);
	
	int deleteBatch(int[] ids);
	
	int add(Train train);
	Train load(int id);
}

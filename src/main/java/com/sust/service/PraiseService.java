package com.sust.service;

import java.util.List;

import com.sust.entity.Praise;

public interface PraiseService {

	List<Praise> getUserPraiseInfo(Integer usId);

	Praise getRaInfoByraId(int prId);

	int DeletePrInfo(int prId);

	int addPrInfo(Praise praise);

	String getUserNameById(Integer usId);

	int upPrInfo(Praise praise);

}

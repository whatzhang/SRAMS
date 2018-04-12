package com.sust.service;

import java.util.List;

import com.sust.entity.Patent;

public interface PatentService {

	List<Patent> getUserPatent(Integer usId);

	Patent getPaInfoByraId(int paId);

	int DeletePaInfoById(int paId);

	int addPaInfo(Patent patent);

	String getUserNameById(Integer usId);

	int upPaInfo(Patent patent);

}

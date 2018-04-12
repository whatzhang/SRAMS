package com.sust.service;

import java.util.List;

import com.sust.entity.Race;

public interface RaceService {

	List<Race> getUserRace(Integer usId);

	Race getRaInfoByraId(int id);

	int DeleteRaInfoByThid(int raId);

	String getUserNameById(Integer usId);

	int addRaInfo(Race race);

	int upRaInfo(Race race);

}

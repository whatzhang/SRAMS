package com.sust.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.sust.entity.Race;

public interface RaceService {

	List<Race> getUserRace(Integer usId);

	Race getRaInfoByraId(int id);

	String DeleteRaInfoByThid(int deId, String fg, String type, HttpSession session);

	String getUserNameById(Integer usId);

	int addRaInfo(Race race);

	int upRaInfo(Race race);

	List<Race> getAllRaceInfo();

}

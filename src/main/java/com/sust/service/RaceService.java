package com.sust.service;

import java.util.List;
import java.util.Map;

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

	Map<String, Object> GuiNaRace(String flg, String xuyuan, String sex, String duty, String bigAge, String smlAge,
			String major, String raCate, String raTuan, String bigRada, String smlRada, String bigRaUp, String smlRaUp);

	List<Race> findRaInfo(String bigThda, String smlThda, String raCate, String raTuan, String bigThUp, String smlThUp);

}

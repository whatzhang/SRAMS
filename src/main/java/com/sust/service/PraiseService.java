package com.sust.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.sust.entity.Praise;

public interface PraiseService {

	List<Praise> getUserPraiseInfo(Integer usId);

	Praise getRaInfoByraId(int prId);

	String DeletePrInfo(int deId, String fg, String type, HttpSession session);

	int addPrInfo(Praise praise);

	String getUserNameById(Integer usId);

	int upPrInfo(Praise praise);

}

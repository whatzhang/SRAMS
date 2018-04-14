package com.sust.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.sust.entity.Patent;

public interface PatentService {

	List<Patent> getUserPatent(Integer usId);

	Patent getPaInfoByraId(int paId);

	String DeletePaInfoById(int deId, String fg, String type, HttpSession session);

	int addPaInfo(Patent patent);

	String getUserNameById(Integer usId);

	int upPaInfo(Patent patent);

}

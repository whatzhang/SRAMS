package com.sust.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.sust.entity.Praise;

public interface PraiseService {

	List<Praise> getUserPraiseInfo(Integer usId);

	Praise getRaInfoByraId(int prId);

	String DeletePrInfo(int deId, String fg, String type, HttpSession session);

	int addPrInfo(Praise praise);

	String getUserNameById(Integer usId);

	int upPrInfo(Praise praise);

	List<Praise> getAllPraiseInfo();

	Map<String, Object> GuiNaPraise(String flg, String xuyuan, String sex, String duty, String bigAge, String smlAge,
			String major, String prCate, String bigPrda, String smlPrda, String bigPrUp, String smlPrUp);

	List<Praise> findPrInfo(String bigThda, String smlThda, String prCate, String bigThUp, String smlThUp);
	
	List<Praise> findUserPraiseInfo(Integer usId, String bigThda, String smlThda, String prCate, String bigThUp, String smlThUp);

}

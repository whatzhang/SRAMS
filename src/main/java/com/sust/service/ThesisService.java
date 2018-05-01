package com.sust.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.sust.entity.Thesis;

public interface ThesisService {

	public List<Thesis> getThesisInfo(Integer integer);

	public Thesis getThInfoByThid(int id);

	public String deleteThesisById(int deId, String fg, String type, HttpSession session);

	public int addThesis(Thesis thesis);

	String getUserNameById(int usId);

	public int upThesisInfo(Thesis thesis);

	public List<Thesis> getAllThInfo();

	public Map<String,Object>  GuiNaThesis(String flg,String xuyuan, String sex, String duty, String bigAge, String smlAge, String major,
			String bigThda, String smlThda, String thCate, String thle, String thIsCl, String bigThUp, String smlThUp);

}

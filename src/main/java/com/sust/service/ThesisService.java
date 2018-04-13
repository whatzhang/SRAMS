package com.sust.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.sust.entity.Thesis;

public interface ThesisService {

	public List<Thesis> getThesisInfo(Integer integer);

	public Thesis getThInfoByThid(int id);

	public String deleteThesisById(int deId, String fg, String type, HttpSession session);

	public int addThesis(Thesis thesis);

	String getUserNameById(int usId);

	public int upThesisInfo(Thesis thesis);
}

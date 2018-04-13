package com.sust.service;

import java.util.List;

import com.sust.entity.Thesis;

public interface ThesisService {

	public List<Thesis> getThesisInfo(Integer integer);

	public Thesis getThInfoByThid(int id);

	public int deleteThesisById(int deId);

	public int addThesis(Thesis thesis);

	String getUserNameById(int usId);

	public int upThesisInfo(Thesis thesis);
}

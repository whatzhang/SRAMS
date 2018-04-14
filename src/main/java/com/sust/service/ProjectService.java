package com.sust.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.sust.entity.Project;

public interface ProjectService {

	int upProInfo(Project project);

	int addProInfo(Project project);

	String DeleteProInfoById(int deId, String fg, String type, HttpSession session);

	Project getProInfoByProId(int proId);

	List<Project> getUserProList(Integer usId);

}

package com.sust.controller;

import java.util.List;

import com.sust.entity.Project;

public interface ProjectService {

	int upProInfo(Project project);

	int addProInfo(Project project);

	int DeleteProInfoById(int proId);

	Project getProInfoByProId(int proId);

	List<Project> getUserProList(Integer usId);

}

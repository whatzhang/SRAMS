package com.sust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.ProjectMapper;
import com.sust.entity.Project;
import com.sust.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectMapper projectMapper;
	
	@Override
	public int upProInfo(Project project) {
		
		return this.projectMapper.updateByPrimaryKeySelective(project);
	}

	@Override
	public int addProInfo(Project project) {
		
		return this.projectMapper.insertSelective(project);
	}

	@Override
	public int DeleteProInfoById(int proId) {
		
		return this.projectMapper.deleteByPrimaryKey(Integer.valueOf(proId));
	}

	@Override
	public Project getProInfoByProId(int proId) {
		
		return this.projectMapper.selectByPrimaryKey(Integer.valueOf(proId));
	}

	@Override
	public List<Project> getUserProList(Integer usId) {
		
		return this.projectMapper.selectProjectList(usId);
	}

}

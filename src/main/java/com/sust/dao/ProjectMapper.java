package com.sust.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sust.entity.Project;

@Repository
public interface ProjectMapper {
	int deleteByPrimaryKey(Integer proId);

	int insert(Project record);

	int insertSelective(Project record);

	Project selectByPrimaryKey(Integer proId);

	int updateByPrimaryKeySelective(Project record);

	int updateByPrimaryKey(Project record);

	List<Project> selectProjectList(Integer usId);

	void updateUpTime(@Param("proUptime") Date proUptime, @Param("proId") Integer proId);

	Date selectUpTimeByKey(Integer proId);

	String selectNameById(Integer proId);

}
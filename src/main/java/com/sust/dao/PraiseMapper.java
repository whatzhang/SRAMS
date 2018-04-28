package com.sust.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sust.entity.Praise;

@Repository
public interface PraiseMapper {
	int deleteByPrimaryKey(Integer prId);

	int insert(Praise record);

	int insertSelective(Praise record);

	Praise selectByPrimaryKey(Integer prId);

	int updateByPrimaryKeySelective(Praise record);

	int updateByPrimaryKey(Praise record);

	List<Praise> selectUserPraiseInfo(Integer usId);

	String selectUserNameById(Integer usId);

	void updateUpTime(@Param("prUptime") Date prUptime, @Param("prId") Integer prId);

	Date selectUpTimeByKey(Integer prId);

	String selectNameById(Integer prId);

	List<Praise> selectAllPraiseInfo();

	int deleteByUsId(Integer usId);

}
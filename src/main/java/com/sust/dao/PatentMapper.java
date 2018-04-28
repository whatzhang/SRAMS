package com.sust.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sust.entity.Patent;

@Repository
public interface PatentMapper {
	int deleteByPrimaryKey(Integer paId);

	int insert(Patent record);

	int insertSelective(Patent record);

	Patent selectByPrimaryKey(Integer paId);

	int updateByPrimaryKeySelective(Patent record);

	int updateByPrimaryKey(Patent record);

	List<Patent> selectByUsId(Integer paId);

	String selectgetUserNameById(Integer usId);

	void updateUpTime(@Param("paUptime") Date paUptime, @Param("paId") Integer paId);

	Date selectUpTimeByKey(Integer paId);

	String selectNameById(Integer paId);

	List<Patent> selectAllPaInfo();

	int deleteByUsId(Integer usId);
}
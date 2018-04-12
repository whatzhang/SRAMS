package com.sust.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sust.entity.Race;

@Repository
public interface RaceMapper {
    int deleteByPrimaryKey(Integer raId);

    int insert(Race record);

    int insertSelective(Race record);

    Race selectByPrimaryKey(Integer raId);

    int updateByPrimaryKeySelective(Race record);

    int updateByPrimaryKey(Race record);

	List<Race> selectUserRaceList(Integer usId);

	String selectUserNameById(Integer usId);
}
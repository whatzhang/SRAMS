package com.sust.dao;

import java.util.List;

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
}
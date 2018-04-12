package com.sust.dao;

import java.util.List;

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

	List<Patent> selectByUsId(Integer usId);

	String selectgetUserNameById(Integer usId);
}
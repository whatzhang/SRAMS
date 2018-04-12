package com.sust.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sust.entity.Thesis;

@Repository
public interface ThesisMapper {
    int deleteByPrimaryKey(Integer thId);

    int insert(Thesis record);

    int insertSelective(Thesis record);

    Thesis selectByPrimaryKey(Integer thId);

    int updateByPrimaryKeySelective(Thesis record);

    int updateByPrimaryKey(Thesis record);

	List<Thesis> selectByUsId(Integer usId);

	String selectUserNameById(int usId);
}
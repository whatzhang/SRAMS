package com.sust.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sust.entity.Users;

@Repository
public interface UsersMapper {
	int deleteByPrimaryKey(Integer usId);

	int insert(Users record);

	int insertSelective(Users record);

	Users selectByPrimaryKey(Integer usId);

	int updateByPrimaryKeySelective(Users record);

	int updateByPrimaryKey(Users record);

	int insertUserInfo(Users users);

	int selectByNum(String usNum);

	List<String> selectUsidByPartName(String Part);
}
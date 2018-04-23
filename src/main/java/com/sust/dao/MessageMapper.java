package com.sust.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sust.entity.Message;

@Repository
public interface MessageMapper {
	int deleteByPrimaryKey(Integer meId);

	int insert(Message record);

	int insertSelective(Message record);

	Message selectByPrimaryKey(Integer meId);

	int updateByPrimaryKeySelective(Message record);

	int updateByPrimaryKey(Message record);

	List<Message> selectMeDelByUsId(Integer usId);

	List<Message> selectMeReadByUsId(Integer usId);

	List<Message> selectMeNoReadByUsId(Integer usId);

	String selectUserNameById(int id);

	int deleteReadNews(Integer usId);

	List<Message> selectAllMessages();

	List<Message> selectNowMessages();

	Integer selectNoReadNum(Integer meId);

	Integer selectReadedNum(Integer meId);

	Integer selectDelNum(Integer meId);
}
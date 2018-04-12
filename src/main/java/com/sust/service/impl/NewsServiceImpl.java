package com.sust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.MessageMapper;
import com.sust.entity.Message;
import com.sust.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService {

	@Resource
	private MessageMapper messageMapper;
	
	@Override
	public List<Message> getUserMeDel(int usId) {
		
		return this.messageMapper.selectMeDelByUsId(usId);
	}

	@Override
	public List<Message> getUserMeRead(int usId) {
		
		return this.messageMapper.selectMeReadByUsId(usId);
	}

	@Override
	public List<Message> getUserMeNoRead(int usId) {

		return this.messageMapper.selectMeNoReadByUsId(usId);
	}

	@Override
	public Message getNewsById(int id) {
		
		return this.messageMapper.selectByPrimaryKey(id);
	}

	@Override
	public String getUserNameById(int id) {
		
		return this.messageMapper.selectUserNameById(id);
	}

	@Override
	public String deleteReadNews(Integer usId) {
	
		return String.valueOf(this.messageMapper.deleteReadNews(usId));
	}

}

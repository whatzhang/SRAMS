package com.sust.service;

import java.util.List;

import com.sust.entity.Message;


public interface NewsService {

	public List<Message> getUserMeRead(int usId);

	public List<Message> getUserMeNoRead(int usId);

	public List<Message> getUserMeDel(int usId);

	public Message getNewsById(int id);

	public String getUserNameById(int id);

	public String deleteReadNews(Integer usId);

}

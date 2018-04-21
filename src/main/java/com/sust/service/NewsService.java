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

	public List<Message> getAllMessages();

	public List<Message> getNowMessages();
	
	public String getNoReadNum(Integer meId);

	public String getReadedNum(Integer meId);

	public String getDelNum(Integer meId);

	public String updataMessage(Integer meId, String meTitle, String meSend, String meReceive, String meDate,
			String meAbout);

	public String deleteMessage(Integer meId);

}

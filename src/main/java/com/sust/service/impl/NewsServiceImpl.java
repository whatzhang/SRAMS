package com.sust.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.LoginMapper;
import com.sust.dao.MeStatusMapper;
import com.sust.dao.MessageMapper;
import com.sust.entity.MeStatus;
import com.sust.entity.Message;
import com.sust.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService {

	@Resource
	private MessageMapper messageMapper;

	@Resource
	private MeStatusMapper meStatusMapper;

	@Resource
	private LoginMapper loginMapper;

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

	@Override
	public List<Message> getAllMessages() {

		return this.messageMapper.selectAllMessages();
	}

	@Override
	public List<Message> getNowMessages() {

		return this.messageMapper.selectNowMessages();
	}

	@Override
	public String getNoReadNum(Integer meId) {

		return String.valueOf(this.messageMapper.selectNoReadNum(meId));
	}

	@Override
	public String getReadedNum(Integer meId) {

		return String.valueOf(this.messageMapper.selectReadedNum(meId));
	}

	@Override
	public String getDelNum(Integer meId) {

		return String.valueOf(this.messageMapper.selectDelNum(meId));
	}

	@Override
	public String updataMessage(Integer meId, String meTitle, String meSend, String meReceive, String meDate,
			String meAbout) {
		try {
			this.messageMapper.updateByPrimaryKey(new Message(meId, meTitle, Integer.valueOf(meSend), meReceive,
					(Date) (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(meDate)), meAbout));
		} catch (Exception e) {
			return "更新信息失败，请重试！";
		}
		return "更新信息成功！";
	}

	@Override
	public String deleteMessage(Integer meId) {
		try {
			this.messageMapper.deleteByPrimaryKey(meId);
			this.meStatusMapper.deleteBymeId(meId);
		} catch (Exception e) {
			return "删除信息失败，请重试！";
		}
		return "删除信息成功！";
	}

	@Override
	public String addMessage(Message message) {
		try {
			this.messageMapper.insertSelective(message);
			List<Integer> usIdList = this.loginMapper.selectUsIdList();
			for (int i = 0; i < usIdList.size(); i++) {
				this.meStatusMapper.insertSelective(new MeStatus(message.getMeId(), usIdList.get(i), (byte) 0));
			}
		} catch (Exception e) {
			return "发布新消息失败，请重试！";
		}
		return "发布新消息成功！";
	}

}

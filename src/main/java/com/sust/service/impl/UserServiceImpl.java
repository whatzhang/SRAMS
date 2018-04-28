package com.sust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.BookMapper;
import com.sust.dao.LoginMapper;
import com.sust.dao.PatentMapper;
import com.sust.dao.PraiseMapper;
import com.sust.dao.ProjectMapper;
import com.sust.dao.RaceMapper;
import com.sust.dao.ThesisMapper;
import com.sust.dao.UsersMapper;
import com.sust.entity.Login;
import com.sust.entity.Users;
import com.sust.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UsersMapper userMapper;
	@Resource
	private LoginMapper loginMapper;
	@Resource
	private BookMapper bookMapper;
	@Resource
	private PatentMapper patentMapper;
	@Resource
	private ProjectMapper projectMapper;
	@Resource
	private PraiseMapper praiseMapper;
	@Resource
	private RaceMapper raceMapper;
	@Resource
	private ThesisMapper thesisMapper;

	@Override
	public Users getUserInfo(Integer usId) {

		return this.userMapper.selectByPrimaryKey(usId);
	}

	@Override
	public int upUserInfo(Users users) {

		return this.userMapper.updateByPrimaryKeySelective(users);
	}

	@Override
	public List<String> getUsidByPartName(String usName) {
		
		return this.userMapper.selectUsidByPartName(usName);
	}

	@Override
	public List<Users> getAllUsersInfo() {
		
		return this.userMapper.selectAllUsers();
	}

	@Override
	public List<Login> getAllLoginInfo() {
		
		return this.loginMapper.selectAllLogin();
	}

	@Override
	public Integer getUsIdByName(String loName) {
		
		return this.loginMapper.selectUsIdByName(loName);
	}

	@Override
	public String addUserInfo(Users users) {
		
		try {
			this.userMapper.insertSelective(users);
		} catch (Exception e) {
			return "用户信息添加失败！";
		}
		return "用户信息添加成功！";
	}

	@Override
	public String DeleteUserInfo(Integer usId, String fg) {

		try {
			this.userMapper.deleteByPrimaryKey(usId);
			this.loginMapper.deleteByPrimaryKey(usId);
			if("yes".equals(fg)){
				this.patentMapper.deleteByUsId(usId);
				this.projectMapper.deleteByUsId(usId);
				this.praiseMapper.deleteByUsId(usId);
				this.raceMapper.deleteByUsId(usId);
				this.thesisMapper.deleteByUsId(usId);
				this.bookMapper.deleteByUsId(usId);
			}
		} catch (Exception e) {
			return "删除信息失败!";
		}
		return "删除信息成功!";
	}

}

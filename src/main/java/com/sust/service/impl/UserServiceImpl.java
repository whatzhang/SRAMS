package com.sust.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.UsersMapper;
import com.sust.entity.Users;
import com.sust.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UsersMapper userMapper;

	@Override
	public Users getUserInfo(Integer usId) {

		return this.userMapper.selectByPrimaryKey(usId);
	}

	@Override
	public int upUserInfo(Users users) {

		return this.userMapper.updateByPrimaryKey(users);
	}

}

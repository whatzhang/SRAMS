package com.sust.service;

import java.util.List;

import com.sust.entity.Users;

public interface UserService {

	Users getUserInfo(Integer usId);

	int upUserInfo(Users users);

	List<String> getUsidByPartName(String usName);

}

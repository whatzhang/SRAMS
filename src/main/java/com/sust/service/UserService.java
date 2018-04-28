package com.sust.service;

import java.util.List;

import com.sust.entity.Login;
import com.sust.entity.Users;

public interface UserService {

	Users getUserInfo(Integer usId);

	int upUserInfo(Users users);

	List<String> getUsidByPartName(String usName);

	List<Users> getAllUsersInfo();

	List<Login> getAllLoginInfo();

	Integer getUsIdByName(String loName);

	String addUserInfo(Users users);

	String DeleteUserInfo(Integer usId, String fg);

}

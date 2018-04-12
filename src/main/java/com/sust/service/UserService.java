package com.sust.service;

import com.sust.entity.Users;

public interface UserService {

	Users getUserInfo(Integer usId);

	int upUserInfo(Users users);

}

package com.sust.service;

import java.util.List;
import java.util.Map;

import com.sust.entity.Login;

public interface LoginService {

  
    public Login getLogin(String type, String account, String userPassword) throws Exception;

	public String getLoginInfo(String account, String password, String type);

	public String saveNewInfo(String account, String pass, String type, String name,
			String age, String sex, String brith, String num, String duty,
			String major, String address, String phone, String mail,
			String academy, String qu1, String key1, String qu2, String key2);

	public List<String> findQuKey(String account);

	public String getPass(String usId);

	public Map<String, String> getInitInfo(String account, String type);

	public int upDataPass(Integer usId, String pass);

}

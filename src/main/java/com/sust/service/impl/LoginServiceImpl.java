package com.sust.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sust.controller.LoginController;
import com.sust.dao.LoginMapper;
import com.sust.dao.UsersMapper;
import com.sust.entity.Login;
import com.sust.entity.Users;
import com.sust.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	private static final Logger logger = Logger.getLogger(LoginController.class);

	@Resource
	private LoginMapper loginMapper;
	@Resource
	private UsersMapper usersMapper;

	@Override
	public Login getLogin(String type, String account, String userPassword) throws Exception {

		return loginMapper.selectLoginInfo(account, userPassword, type);
	}

	@Override
	public String getLoginInfo(String account, String password, String type) {

		logger.info("getLoginInfo:" + loginMapper.selectLoginByAccount(account) + "+++"
				+ loginMapper.selectLoginByPass(password) + "+++"
				+ loginMapper.selectLoginByAll(account, password, type));
		if (loginMapper.selectLoginByAccount(account) > 0) {
			if (loginMapper.selectLoginByPass(password) > 0) {
				if (loginMapper.selectLoginByAll(account, password, type) > 0) {
					return "yes";
				} else {
					return "用户等级错误！";
				}
			} else {
				return "用户密码错误！";
			}
		} else {
			return "没有此用户！";
		}
	}

	@Override
	public String saveNewInfo(String account, String pass, String type, String name, String age, String sex,
			String brith, String num, String duty, String major, String address, String phone, String mail,
			String academy, String qu1, String key1, String qu2, String key2) {
		int id, usId;
		String result = "fail";
		try {
			id = usersMapper.insertUserInfo(
					new Users(name, age, Byte.parseByte(sex), (new SimpleDateFormat("yyyy-MM-dd")).parse(brith), num,
							duty, major, address, mail, phone, academy, qu1, key1, qu2, key2));
			usId = usersMapper.selectByNum(num);
			System.out.println("LoginServiceImpl++" + id + "+++" + usId);
			if (id > 0) {
				if (loginMapper.insert(new Login(usId, account, pass, type)) > 0) {
					result = "success";
				} else {
					usersMapper.deleteByPrimaryKey(usId);
					result = "fail";
				}
			} else {
				result = "fail";
			}
		} catch (Exception e) {
			System.out.println("usersMapper类型转换出错！");
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<String> findQuKey(String account) {

		List<String> kk = new ArrayList<String>();
		if (loginMapper.selectLoginByAccount(account) > 0) {
			Users user = this.usersMapper.selectByPrimaryKey(this.loginMapper.selectByAccount(account));
			kk.add("success");
			kk.add(user.getUsQuestion1());
			kk.add(user.getUsKey1());
			kk.add(user.getUsQuestion2());
			kk.add(user.getUsKey2());
			kk.add(user.getUsId().toString());
		} else {
			kk.add("fail");
		}
		return kk;
	}

	@Override
	public String getPass(String usId) {

		return this.loginMapper.selectByPrimaryKey((Integer) Integer.parseInt(usId)).getLoPass();
	}

	@Override
	public Map<String, String> getInitInfo(String account, String type, Integer id, boolean flg) {

		if (flg) {
			id = this.loginMapper.selectByAccount(account);
		}
		Map<String, String> init = new HashMap<String, String>();
		init.put("name", account);
		init.put("type", type);
		init.put("usId", Integer.toString(id));
		init.put("thNum", Integer.toString(this.loginMapper.selectThNum(id)));
		init.put("paNum", Integer.toString(this.loginMapper.selectPaNum(id)));
		init.put("prNum", Integer.toString(this.loginMapper.selectPrNum(id)));
		init.put("proNum", Integer.toString(this.loginMapper.selectProNum(id)));
		init.put("boNum", Integer.toString(this.loginMapper.selectBoNum(id)));
		init.put("raNum", Integer.toString(this.loginMapper.selectRaNum(id)));
		init.put("meNum", Integer.toString(this.loginMapper.selectMeNum(id)));
		return init;
	}

	@Override
	public int upDataPass(Integer usId, String pass) {

		return this.loginMapper.updatePassword(usId, pass);
	}

	@Override
	public Map<String, String> getAdminInitInfo() {
		Map<String, String> init = new HashMap<String, String>();
		int thNum = this.loginMapper.selectAllThNum();
		int paNum = this.loginMapper.selectAllPaNum();
		int prNum = this.loginMapper.selectAllPrNum();
		int proNum = this.loginMapper.selectAllProNum();
		int boNum = this.loginMapper.selectAllBoNum();
		int raNum = this.loginMapper.selectAllRaNum();
		int meNum = this.loginMapper.selectAllMeNum();
		int userNum = this.loginMapper.selectAllUser();
		int allData = thNum + paNum + prNum + proNum + boNum + raNum;

		init.put("thNum", String.valueOf(thNum));
		init.put("paNum", String.valueOf(paNum));
		init.put("prNum", String.valueOf(prNum));
		init.put("proNum", String.valueOf(proNum));
		init.put("boNum", String.valueOf(boNum));
		init.put("raNum", String.valueOf(raNum));
		init.put("meNum", String.valueOf(meNum));
		init.put("userNum", String.valueOf(userNum));
		init.put("allData", String.valueOf(allData));
		return init;
	}

	@Override
	public List<Login> getAllLoginInfo() {

		return this.loginMapper.selectAllLogin();
	}

	@Override
	public Login getLoginInfoById(Integer usId) {

		return this.loginMapper.selectByPrimaryKey(usId);
	}

	@Override
	public String updataLoginInfo(Login login) {
		try {
			this.loginMapper.updateByPrimaryKeySelective(login);
		} catch (Exception e) {
			return "更新失败";
		}
		return "更新信息成功！";
	}

	@Override
	public String addloginInfo(Login login) {
		try {
			this.loginMapper.insertSelective(login);
		} catch (Exception e) {
			return "添加失败";
		}
		return "添加信息成功！";
	}

}

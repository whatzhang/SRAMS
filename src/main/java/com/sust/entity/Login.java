package com.sust.entity;

import com.sust.other.MD5Util;

public class Login {
	private Integer usId;

	private String loLogin;

	private String loPass;

	private String loType;

	public Login(Integer usId, String loLogin, String loPass, String loType) {
		this.usId = usId;
		this.loLogin = loLogin;
		this.loPass = MD5Util.convertMD5(loPass);
		this.loType = loType;
	}

	public Login(String loLogin, String loPass, String loType) {
		this.loLogin = loLogin;
		this.loPass = MD5Util.convertMD5(loPass);
		this.loType = loType;
	}

	public Integer getUsId() {
		return usId;
	}

	public void setUsId(Integer usId) {
		this.usId = usId;
	}

	public String getLoLogin() {
		return loLogin;
	}

	public void setLoLogin(String loLogin) {
		this.loLogin = loLogin == null ? null : loLogin.trim();
	}

	public String getLoPass() {
		return MD5Util.convertMD5(MD5Util.convertMD5(loPass));
	}

	public void setLoPass(String loPass) {
		this.loPass = loPass == null ? null : (MD5Util.convertMD5(loPass).trim());
	}

	public String getLoType() {
		return loType;
	}

	public void setLoType(String loType) {
		this.loType = loType == null ? null : loType.trim();
	}

	@Override
	public String toString() {
		return "Login [usId=" + usId + ", loLogin=" + loLogin + ", loPass=" + loPass + ", loType=" + loType + "]";
	}

}
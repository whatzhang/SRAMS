package com.sust.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Users {
	private Integer usId;

	private String usName;

	private String usAge;

	private Byte usSex;

	private Date usBirthday;

	private String usNum;

	private String usDuty;

	private String usMajor;

	private String usAddress;

	private String usMail;

	private String usPhone;

	private String usAcademy;

	private String usQuestion1;

	private String usKey1;

	private String usQuestion2;

	private String usKey2;

	public Users() {

	}

	public Users(String usName, String usAge, Byte usSex, Date usBirthday, String usNum, String usDuty, String usMajor,
			String usAddress, String usMail, String usPhone, String usAcademy, String usQuestion1, String usKey1,
			String usQuestion2, String usKey2) {
		this.usName = usName;
		this.usAge = usAge;
		this.usSex = usSex;
		this.usBirthday = usBirthday;
		this.usNum = usNum;
		this.usDuty = usDuty;
		this.usMajor = usMajor;
		this.usAddress = usAddress;
		this.usMail = usMail;
		this.usPhone = usPhone;
		this.usAcademy = usAcademy;
		this.usQuestion1 = usQuestion1;
		this.usKey1 = usKey1;
		this.usQuestion2 = usQuestion2;
		this.usKey2 = usKey2;
	}

	public Users(Integer usId, String usName, String usAge, Byte usSex, Date usBirthday, String usNum, String usDuty,
			String usMajor, String usAddress, String usMail, String usPhone, String usAcademy, String usQuestion1,
			String usKey1, String usQuestion2, String usKey2) {
		super();
		this.usId = usId;
		this.usName = usName;
		this.usAge = usAge;
		this.usSex = usSex;
		this.usBirthday = usBirthday;
		this.usNum = usNum;
		this.usDuty = usDuty;
		this.usMajor = usMajor;
		this.usAddress = usAddress;
		this.usMail = usMail;
		this.usPhone = usPhone;
		this.usAcademy = usAcademy;
		this.usQuestion1 = usQuestion1;
		this.usKey1 = usKey1;
		this.usQuestion2 = usQuestion2;
		this.usKey2 = usKey2;
	}

	public Integer getUsId() {
		return usId;
	}

	public void setUsId(Integer usId) {
		this.usId = usId;
	}

	public String getUsName() {
		return usName;
	}

	public void setUsName(String usName) {
		this.usName = usName == null ? null : usName.trim();
	}

	public String getUsAge() {
		return usAge;
	}

	public void setUsAge(String usAge) {
		this.usAge = usAge == null ? null : usAge.trim();
	}

	public Byte getUsSex() {
		return usSex;
	}

	public void setUsSex(Byte usSex) {
		this.usSex = usSex;
	}

	public String getUsBirthday() {
		return new SimpleDateFormat("yyyy-MM-dd").format(usBirthday);
	}

	public void setUsBirthday(Date usBirthday) {
		this.usBirthday = usBirthday;
	}

	public String getUsNum() {
		return usNum;
	}

	public void setUsNum(String usNum) {
		this.usNum = usNum == null ? null : usNum.trim();
	}

	public String getUsDuty() {
		return usDuty;
	}

	public void setUsDuty(String usDuty) {
		this.usDuty = usDuty == null ? null : usDuty.trim();
	}

	public String getUsMajor() {
		return usMajor;
	}

	public void setUsMajor(String usMajor) {
		this.usMajor = usMajor == null ? null : usMajor.trim();
	}

	public String getUsAddress() {
		return usAddress;
	}

	public void setUsAddress(String usAddress) {
		this.usAddress = usAddress == null ? null : usAddress.trim();
	}

	public String getUsMail() {
		return usMail;
	}

	public void setUsMail(String usMail) {
		this.usMail = usMail == null ? null : usMail.trim();
	}

	public String getUsPhone() {
		return usPhone;
	}

	public void setUsPhone(String usPhone) {
		this.usPhone = usPhone == null ? null : usPhone.trim();
	}

	public String getUsAcademy() {
		return usAcademy;
	}

	public void setUsAcademy(String usAcademy) {
		this.usAcademy = usAcademy == null ? null : usAcademy.trim();
	}

	public String getUsQuestion1() {
		return usQuestion1;
	}

	public void setUsQuestion1(String usQuestion1) {
		this.usQuestion1 = usQuestion1 == null ? null : usQuestion1.trim();
	}

	public String getUsKey1() {
		return usKey1;
	}

	public void setUsKey1(String usKey1) {
		this.usKey1 = usKey1 == null ? null : usKey1.trim();
	}

	public String getUsQuestion2() {
		return usQuestion2;
	}

	public void setUsQuestion2(String usQuestion2) {
		this.usQuestion2 = usQuestion2 == null ? null : usQuestion2.trim();
	}

	public String getUsKey2() {
		return usKey2;
	}

	public void setUsKey2(String usKey2) {
		this.usKey2 = usKey2 == null ? null : usKey2.trim();
	}

	@Override
	public String toString() {
		return "Users [usId=" + usId + ", usName=" + usName + ", usAge=" + usAge + ", usSex=" + usSex + ", usBirthday="
				+ usBirthday + ", usNum=" + usNum + ", usDuty=" + usDuty + ", usMajor=" + usMajor + ", usAddress="
				+ usAddress + ", usMail=" + usMail + ", usPhone=" + usPhone + ", usAcademy=" + usAcademy
				+ ", usQuestion1=" + usQuestion1 + ", usKey1=" + usKey1 + ", usQuestion2=" + usQuestion2 + ", usKey2="
				+ usKey2 + "]";
	}

}
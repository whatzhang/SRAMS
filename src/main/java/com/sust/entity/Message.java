package com.sust.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {
	private Integer meId;

	private String meTitle;

	private Integer meSend;

	private String meReceive;

	private Date meDate;

	private String meAbout;

	public Message() {

	}

	public Message(Integer meId, String meTitle, Integer meSend, String meReceive, Date meDate, String meAbout) {
		super();
		this.meId = meId;
		this.meTitle = meTitle;
		this.meSend = meSend;
		this.meReceive = meReceive;
		this.meDate = meDate;
		this.meAbout = meAbout;
	}

	public Message(String meTitle, Integer meSend, String meReceive, Date meDate, String meAbout) {
		super();
		this.meTitle = meTitle;
		this.meSend = meSend;
		this.meReceive = meReceive;
		this.meDate = meDate;
		this.meAbout = meAbout;
	}

	public Integer getMeId() {
		return meId;
	}

	public void setMeId(Integer meId) {
		this.meId = meId;
	}

	public String getMeTitle() {
		return meTitle;
	}

	public void setMeTitle(String meTitle) {
		this.meTitle = meTitle == null ? null : meTitle.trim();
	}

	public Integer getMeSend() {
		return meSend;
	}

	public void setMeSend(Integer meSend) {
		this.meSend = meSend;
	}

	public String getMeReceive() {
		return meReceive;
	}

	public void setMeReceive(String meReceive) {
		this.meReceive = meReceive == null ? null : meReceive.trim();
	}

	public String getMeDate() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(meDate);
	}

	public void setMeDate(Date meDate) {
		this.meDate = meDate;
	}

	public String getMeAbout() {
		return meAbout;
	}

	public void setMeAbout(String meAbout) {
		this.meAbout = meAbout == null ? null : meAbout.trim();
	}

	@Override
	public String toString() {
		return "Message [meId=" + meId + ", meTitle=" + meTitle + ", meSend=" + meSend + ", meReceive=" + meReceive
				+ ", meDate=" + meDate + ", meAbout=" + meAbout + "]";
	}

}
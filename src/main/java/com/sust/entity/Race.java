package com.sust.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Race {
	private Integer raId;

	private Integer usId;

	private String raName;

	private String raCategory;

	private String raType;

	private String raAuthor;

	private String raLevel;

	private String raTeacher;

	private Date raDate;

	private String raAbout;

	private Date raUptime;

	public Race() {

	}

	public Race(Integer raId, Integer usId, String raName, String raCategory, String raType, String raAuthor,
			String raLevel, String raTeacher, Date raDate, String raAbout, Date raUptime) {
		super();
		this.raId = raId;
		this.usId = usId;
		this.raName = raName;
		this.raCategory = raCategory;
		this.raType = raType;
		this.raAuthor = raAuthor;
		this.raLevel = raLevel;
		this.raTeacher = raTeacher;
		this.raDate = raDate;
		this.raAbout = raAbout;
		this.raUptime = raUptime;
	}

	public Race(Integer usId, String raName, String raCategory, String raType, String raAuthor, String raLevel,
			String raTeacher, Date raDate, String raAbout, Date raUptime) {
		super();
		this.usId = usId;
		this.raName = raName;
		this.raCategory = raCategory;
		this.raType = raType;
		this.raAuthor = raAuthor;
		this.raLevel = raLevel;
		this.raTeacher = raTeacher;
		this.raDate = raDate;
		this.raAbout = raAbout;
		this.raUptime = raUptime;
	}

	public Integer getRaId() {
		return raId;
	}

	public void setRaId(Integer raId) {
		this.raId = raId;
	}

	public Integer getUsId() {
		return usId;
	}

	public void setUsId(Integer usId) {
		this.usId = usId;
	}

	public String getRaName() {
		return raName;
	}

	public void setRaName(String raName) {
		this.raName = raName == null ? null : raName.trim();
	}

	public String getRaCategory() {
		return raCategory;
	}

	public void setRaCategory(String raCategory) {
		this.raCategory = raCategory == null ? null : raCategory.trim();
	}

	public String getRaType() {
		return raType;
	}

	public void setRaType(String raType) {
		this.raType = raType == null ? null : raType.trim();
	}

	public String getRaAuthor() {
		return raAuthor;
	}

	public void setRaAuthor(String raAuthor) {
		this.raAuthor = raAuthor == null ? null : raAuthor.trim();
	}

	public String getRaLevel() {
		return raLevel;
	}

	public void setRaLevel(String raLevel) {
		this.raLevel = raLevel == null ? null : raLevel.trim();
	}

	public String getRaTeacher() {
		return raTeacher;
	}

	public void setRaTeacher(String raTeacher) {
		this.raTeacher = raTeacher == null ? null : raTeacher.trim();
	}

	public String getRaDate() {
		return new SimpleDateFormat("yyyy-MM-dd").format(raDate);
	}

	public void setRaDate(Date raDate) {
		this.raDate = raDate;
	}

	public String getRaAbout() {
		return raAbout;
	}

	public void setRaAbout(String raAbout) {
		this.raAbout = raAbout == null ? null : raAbout.trim();
	}

	public String getRaUptime() {
		return new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss").format(raUptime);
	}

	public void setRaUptime(Date raUptime) {
		this.raUptime = raUptime;
	}

	@Override
	public String toString() {
		return "Race [raId=" + raId + ", usId=" + usId + ", raName=" + raName + ", raCategory=" + raCategory
				+ ", raType=" + raType + ", raAuthor=" + raAuthor + ", raLevel=" + raLevel + ", raTeacher=" + raTeacher
				+ ", raDate=" + raDate + ", raAbout=" + raAbout + ", raUptime=" + raUptime + "]";
	}
	
}
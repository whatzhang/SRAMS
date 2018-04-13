package com.sust.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Praise {
	private Integer prId;

	private Integer usId;

	private String prName;

	private String prCategory;

	private Date prDate;

	private String prUnit;

	private String prAuthor;

	private String prAbout;

	private Date prUptime;

	public Praise() {

	}

	public Praise(Integer usId, String prName, String prCategory, Date prDate, String prUnit, String prAuthor,
			String prAbout, Date prUptime) {
		super();
		this.usId = usId;
		this.prName = prName;
		this.prCategory = prCategory;
		this.prDate = prDate;
		this.prUnit = prUnit;
		this.prAuthor = prAuthor;
		this.prAbout = prAbout;
		this.prUptime = prUptime;
	}

	public Praise(Integer prId, Integer usId, String prName, String prCategory, Date prDate, String prUnit,
			String prAuthor, String prAbout, Date prUptime) {
		super();
		this.prId = prId;
		this.usId = usId;
		this.prName = prName;
		this.prCategory = prCategory;
		this.prDate = prDate;
		this.prUnit = prUnit;
		this.prAuthor = prAuthor;
		this.prAbout = prAbout;
		this.prUptime = prUptime;
	}

	public Integer getPrId() {
		return prId;
	}

	public void setPrId(Integer prId) {
		this.prId = prId;
	}

	public Integer getUsId() {
		return usId;
	}

	public void setUsId(Integer usId) {
		this.usId = usId;
	}

	public String getPrName() {
		return prName;
	}

	public void setPrName(String prName) {
		this.prName = prName == null ? null : prName.trim();
	}

	public String getPrCategory() {
		return prCategory;
	}

	public void setPrCategory(String prCategory) {
		this.prCategory = prCategory == null ? null : prCategory.trim();
	}

	public String getPrDate() {
		return new SimpleDateFormat("yyyy-MM-dd").format(prDate);
	}

	public void setPrDate(Date prDate) {
		this.prDate = prDate;
	}

	public String getPrUnit() {
		return prUnit;
	}

	public void setPrUnit(String prUnit) {
		this.prUnit = prUnit == null ? null : prUnit.trim();
	}

	public String getPrAuthor() {
		return prAuthor;
	}

	public void setPrAuthor(String prAuthor) {
		this.prAuthor = prAuthor == null ? null : prAuthor.trim();
	}

	public String getPrAbout() {
		return prAbout;
	}

	public void setPrAbout(String prAbout) {
		this.prAbout = prAbout == null ? null : prAbout.trim();
	}

	public Date getPrUptime() {
		return prUptime;
	}

	public void setPrUptime(Date prUptime) {
		this.prUptime = prUptime;
	}
}
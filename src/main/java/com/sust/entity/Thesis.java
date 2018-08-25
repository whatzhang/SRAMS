package com.sust.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Thesis {
	private Integer thId;

	private Integer usId;

	private String thName;

	private String thCategory;

	private String thAuthor;

	private Date thDate;

	private String thLevel;

	private String thFactor;

	private String thIncluded;

	private String thNumber;

	private String thJournal;

	private String thPage;

	private String thAbout;

	private Date thUptime;

	public Thesis() {

	}
	public Thesis(String thName) {
		super();
		this.thName = thName;
	}

	public Thesis(Integer thId, Integer usId, String thName, String thCategory, String thAuthor, Date thDate,
			String thLevel, String thFactor, String thIncluded, String thNumber, String thJournal, String thPage,
			String thAbout, Date thUptime) {
		super();
		this.thId = thId;
		this.usId = usId;
		this.thName = thName;
		this.thCategory = thCategory;
		this.thAuthor = thAuthor;
		this.thDate = thDate;
		this.thLevel = thLevel;
		this.thFactor = thFactor;
		this.thIncluded = thIncluded;
		this.thNumber = thNumber;
		this.thJournal = thJournal;
		this.thPage = thPage;
		this.thAbout = thAbout;
		this.thUptime = thUptime;
	}

	public Thesis(Integer usId, String thName, String thCategory, String thAuthor, Date thDate, String thLevel,
			String thFactor, String thIncluded, String thNumber, String thJournal, String thPage, String thAbout,
			Date thUptime) {
		this.usId = usId;
		this.thName = thName;
		this.thCategory = thCategory;
		this.thAuthor = thAuthor;
		this.thDate = thDate;
		this.thLevel = thLevel;
		this.thFactor = thFactor;
		this.thIncluded = thIncluded;
		this.thNumber = thNumber;
		this.thJournal = thJournal;
		this.thPage = thPage;
		this.thAbout = thAbout;
		this.thUptime = thUptime;
	}

	public Integer getThId() {
		return thId;
	}

	public void setThId(Integer thId) {
		this.thId = thId;
	}

	public Integer getUsId() {
		return usId;
	}

	public void setUsId(Integer usId) {
		this.usId = usId;
	}

	public String getThName() {
		return thName;
	}

	public void setThName(String thName) {
		this.thName = thName == null ? null : thName.trim();
	}

	public String getThCategory() {
		return thCategory;
	}

	public void setThCategory(String thCategory) {
		this.thCategory = thCategory == null ? null : thCategory.trim();
	}

	public String getThAuthor() {
		return thAuthor;
	}

	public void setThAuthor(String thAuthor) {
		this.thAuthor = thAuthor == null ? null : thAuthor.trim();
	}

	public String getThDate() {
		return new SimpleDateFormat("yyyy-MM-dd").format(thDate);
	}

	public void setThDate(Date thDate) {
		this.thDate = thDate;
	}

	public String getThLevel() {
		return thLevel;
	}

	public void setThLevel(String thLevel) {
		this.thLevel = thLevel == null ? null : thLevel.trim();
	}

	public String getThFactor() {

		if ("0".equals(thFactor)) {
			return "否";
		} else if ("1".equals(thFactor)) {
			return "是";
		} else if ("2".equals(thFactor)) {
			return "其它";
		} else {
			return thFactor;
		}
	}

	public void setThFactor(String thFactor) {
		this.thFactor = thFactor == null ? null : thFactor.trim();
	}

	public String getThIncluded() {
		return thIncluded;
	}

	public void setThIncluded(String thIncluded) {
		this.thIncluded = thIncluded == null ? null : thIncluded.trim();
	}

	public String getThNumber() {
		return thNumber;
	}

	public void setThNumber(String thNumber) {
		this.thNumber = thNumber == null ? null : thNumber.trim();
	}

	public String getThJournal() {
		return thJournal;
	}

	public void setThJournal(String thJournal) {
		this.thJournal = thJournal == null ? null : thJournal.trim();
	}

	public String getThPage() {
		return thPage;
	}

	public void setThPage(String thPage) {
		this.thPage = thPage == null ? null : thPage.trim();
	}

	public String getThAbout() {
		return thAbout;
	}

	public void setThAbout(String thAbout) {
		this.thAbout = thAbout == null ? null : thAbout.trim();
	}

	public String getThUptime() {
		return new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss").format(thUptime);
	}

	public void setThUptime(Date thUptime) {
		this.thUptime = thUptime;
	}

	@Override
	public String toString() {
		return "Thesis [thId=" + thId + ", usId=" + usId + ", thName=" + thName + ", thCategory=" + thCategory
				+ ", thAuthor=" + thAuthor + ", thDate=" + thDate + ", thLevel=" + thLevel + ", thFactor=" + thFactor
				+ ", thIncluded=" + thIncluded + ", thNumber=" + thNumber + ", thJournal=" + thJournal + ", thPage="
				+ thPage + ", thAbout=" + thAbout + ", thUptime=" + thUptime + "]";
	}

}
package com.sust.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Patent {
    private Integer paId;

    private Integer usId;

    private String paName;

    private String paCategory;

    private String paAuthor;

    private Date paPlease;

    private Date paDate;

    private String paNumber;

    private String paAbout;

    private Date paUptime;
    
    public Patent(){
    	
    }
    
    public Patent(Integer paId, Integer usId, String paName, String paCategory,
			String paAuthor, Date paPlease, Date paDate, String paNumber,
			String paAbout, Date paUptime) {
		super();
		this.paId = paId;
		this.usId = usId;
		this.paName = paName;
		this.paCategory = paCategory;
		this.paAuthor = paAuthor;
		this.paPlease = paPlease;
		this.paDate = paDate;
		this.paNumber = paNumber;
		this.paAbout = paAbout;
		this.paUptime = paUptime;
	}
    
    public Patent(Integer usId, String paName, String paCategory,
			String paAuthor, Date paPlease, Date paDate, String paNumber,
			String paAbout, Date paUptime) {
		super();
		this.usId = usId;
		this.paName = paName;
		this.paCategory = paCategory;
		this.paAuthor = paAuthor;
		this.paPlease = paPlease;
		this.paDate = paDate;
		this.paNumber = paNumber;
		this.paAbout = paAbout;
		this.paUptime = paUptime;
	}

	public Integer getPaId() {
        return paId;
    }

    public void setPaId(Integer paId) {
        this.paId = paId;
    }

    public Integer getUsId() {
        return usId;
    }

    public void setUsId(Integer usId) {
        this.usId = usId;
    }

    public String getPaName() {
        return paName;
    }

    public void setPaName(String paName) {
        this.paName = paName == null ? null : paName.trim();
    }

    public String getPaCategory() {
        return paCategory;
    }

    public void setPaCategory(String paCategory) {
        this.paCategory = paCategory == null ? null : paCategory.trim();
    }

    public String getPaAuthor() {
        return paAuthor;
    }

    public void setPaAuthor(String paAuthor) {
        this.paAuthor = paAuthor == null ? null : paAuthor.trim();
    }

    public String getPaPlease() {
        return new SimpleDateFormat("yyyy-MM-dd").format(paPlease);
    }

    public void setPaPlease(Date paPlease) {
        this.paPlease = paPlease;
    }

    public String getPaDate() {
        return new SimpleDateFormat("yyyy-MM-dd").format(paDate);
    }

    public void setPaDate(Date paDate) {
        this.paDate = paDate;
    }

    public String getPaNumber() {
        return paNumber;
    }

    public void setPaNumber(String paNumber) {
        this.paNumber = paNumber == null ? null : paNumber.trim();
    }

    public String getPaAbout() {
        return paAbout;
    }

    public void setPaAbout(String paAbout) {
        this.paAbout = paAbout == null ? null : paAbout.trim();
    }

    public Date getPaUptime() {
        return paUptime;
    }

    public void setPaUptime(Date paUptime) {
        this.paUptime = paUptime;
    }
}
package com.sust.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Project {
	private Integer proId;

	private Integer usId;

	private String proName;

	private String proCategory;

	private Date proDate;

	private Integer proCash;

	private String proLeader;

	private String proTeam;

	private String proAbout;

	private Date proUptime;

	public Project() {

	}

	public Project(Integer usId, String proName, String proCategory, Date proDate, Integer proCash, String proLeader,
			String proTeam, String proAbout, Date proUptime) {
		super();
		this.usId = usId;
		this.proName = proName;
		this.proCategory = proCategory;
		this.proDate = proDate;
		this.proCash = proCash;
		this.proLeader = proLeader;
		this.proTeam = proTeam;
		this.proAbout = proAbout;
		this.proUptime = proUptime;
	}

	public Project(Integer proId, Integer usId, String proName, String proCategory, Date proDate, Integer proCash,
			String proLeader, String proTeam, String proAbout, Date proUptime) {
		super();
		this.proId = proId;
		this.usId = usId;
		this.proName = proName;
		this.proCategory = proCategory;
		this.proDate = proDate;
		this.proCash = proCash;
		this.proLeader = proLeader;
		this.proTeam = proTeam;
		this.proAbout = proAbout;
		this.proUptime = proUptime;
	}

	public Integer getProId() {
		return proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	public Integer getUsId() {
		return usId;
	}

	public void setUsId(Integer usId) {
		this.usId = usId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName == null ? null : proName.trim();
	}

	public String getProCategory() {
		return proCategory;
	}

	public void setProCategory(String proCategory) {
		this.proCategory = proCategory == null ? null : proCategory.trim();
	}

	public String getProDate() {
		return new SimpleDateFormat("yyyy-MM-dd").format(proDate);
	}

	public void setProDate(Date proDate) {
		this.proDate = proDate;
	}

	public Integer getProCash() {
		return proCash;
	}

	public void setProCash(Integer proCash) {
		this.proCash = proCash;
	}

	public String getProLeader() {
		return proLeader;
	}

	public void setProLeader(String proLeader) {
		this.proLeader = proLeader == null ? null : proLeader.trim();
	}

	public String getProTeam() {
		return proTeam;
	}

	public void setProTeam(String proTeam) {
		this.proTeam = proTeam == null ? null : proTeam.trim();
	}

	public String getProAbout() {
		return proAbout;
	}

	public void setProAbout(String proAbout) {
		this.proAbout = proAbout == null ? null : proAbout.trim();
	}

	public String getProUptime() {
		return new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss").format(proUptime);
	}

	public void setProUptime(Date proUptime) {
		this.proUptime = proUptime;
	}
}
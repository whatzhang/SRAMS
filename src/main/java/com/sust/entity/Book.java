package com.sust.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Book {
	private Integer boId;

	private Integer usId;

	private String boName;

	private String boCategory;

	private Date boDate;

	private String boEditor;

	private String boEditor2;

	private Integer boFont;

	private String boPublish;

	private String boAbout;

	private Date boUptime;

	public Book() {

	}

	public Book(Integer usId, String boName, String boCategory, Date boDate, String boEditor, String boEditor2,
			Integer boFont, String boPublish, String boAbout, Date boUptime) {
		super();
		this.usId = usId;
		this.boName = boName;
		this.boCategory = boCategory;
		this.boDate = boDate;
		this.boEditor = boEditor;
		this.boEditor2 = boEditor2;
		this.boFont = boFont;
		this.boPublish = boPublish;
		this.boAbout = boAbout;
		this.boUptime = boUptime;
	}

	public Book(Integer boId, Integer usId, String boName, String boCategory, Date boDate, String boEditor,
			String boEditor2, Integer boFont, String boPublish, String boAbout, Date boUptime) {
		super();
		this.boId = boId;
		this.usId = usId;
		this.boName = boName;
		this.boCategory = boCategory;
		this.boDate = boDate;
		this.boEditor = boEditor;
		this.boEditor2 = boEditor2;
		this.boFont = boFont;
		this.boPublish = boPublish;
		this.boAbout = boAbout;
		this.boUptime = boUptime;
	}

	public Integer getBoId() {
		return boId;
	}

	public void setBoId(Integer boId) {
		this.boId = boId;
	}

	public Integer getUsId() {
		return usId;
	}

	public void setUsId(Integer usId) {
		this.usId = usId;
	}

	public String getBoName() {
		return boName;
	}

	public void setBoName(String boName) {
		this.boName = boName == null ? null : boName.trim();
	}

	public String getBoCategory() {
		return boCategory;
	}

	public void setBoCategory(String boCategory) {
		this.boCategory = boCategory == null ? null : boCategory.trim();
	}

	public String getBoDate() {
		return new SimpleDateFormat("yyyy-MM-dd").format(boDate);
	}

	public void setBoDate(Date boDate) {
		this.boDate = boDate;
	}

	public String getBoEditor() {
		return boEditor;
	}

	public void setBoEditor(String boEditor) {
		this.boEditor = boEditor == null ? null : boEditor.trim();
	}

	public String getBoEditor2() {
		return boEditor2;
	}

	public void setBoEditor2(String boEditor2) {
		this.boEditor2 = boEditor2 == null ? null : boEditor2.trim();
	}

	public Integer getBoFont() {
		return boFont;
	}

	public void setBoFont(Integer boFont) {
		this.boFont = boFont;
	}

	public String getBoPublish() {
		return boPublish;
	}

	public void setBoPublish(String boPublish) {
		this.boPublish = boPublish == null ? null : boPublish.trim();
	}

	public String getBoAbout() {
		return boAbout;
	}

	public void setBoAbout(String boAbout) {
		this.boAbout = boAbout == null ? null : boAbout.trim();
	}

	public String getBoUptime() {
		return new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss").format(boUptime);
	}

	public void setBoUptime(Date boUptime) {
		this.boUptime = boUptime;
	}

	@Override
	public String toString() {
		return "Book [boId=" + boId + ", usId=" + usId + ", boName=" + boName + ", boCategory=" + boCategory
				+ ", boDate=" + boDate + ", boEditor=" + boEditor + ", boEditor2=" + boEditor2 + ", boFont=" + boFont
				+ ", boPublish=" + boPublish + ", boAbout=" + boAbout + ", boUptime=" + boUptime + "]";
	}

}
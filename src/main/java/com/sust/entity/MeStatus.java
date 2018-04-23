package com.sust.entity;

public class MeStatus {
	private Integer stId;

	private Integer meId;

	private Integer usId;

	private Byte stIsread;

	public MeStatus() {

	}

	public MeStatus(Integer meId, Integer usId, Byte stIsread) {
		super();
		this.meId = meId;
		this.usId = usId;
		this.stIsread = stIsread;
	}

	public MeStatus(Integer stId, Integer meId, Integer usId, Byte stIsread) {
		super();
		this.stId = stId;
		this.meId = meId;
		this.usId = usId;
		this.stIsread = stIsread;
	}

	public Integer getStId() {
		return stId;
	}

	public void setStId(Integer stId) {
		this.stId = stId;
	}

	public Integer getMeId() {
		return meId;
	}

	public void setMeId(Integer meId) {
		this.meId = meId;
	}

	public Integer getUsId() {
		return usId;
	}

	public void setUsId(Integer usId) {
		this.usId = usId;
	}

	public Byte getStIsread() {
		return stIsread;
	}

	public void setStIsread(Byte stIsread) {
		this.stIsread = stIsread;
	}
}
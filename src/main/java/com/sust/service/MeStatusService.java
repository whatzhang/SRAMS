package com.sust.service;

public interface MeStatusService {

	public String setReadStatus(int meId, Integer usId);

	public String setNoReadStatus(int meId, Integer usId);

	public String setDelStatus(int meId, Integer usId);

}

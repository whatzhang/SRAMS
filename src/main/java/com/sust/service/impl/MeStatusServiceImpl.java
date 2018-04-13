package com.sust.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.MeStatusMapper;
import com.sust.service.MeStatusService;

@Service
public class MeStatusServiceImpl implements MeStatusService {

	@Resource
	private MeStatusMapper MeStatusMapper;

	@Override
	public String setReadStatus(int meId, Integer usId) {

		return String.valueOf(this.MeStatusMapper.updateSetReadStatus(Integer.valueOf(meId), usId));
	}

	@Override
	public String setNoReadStatus(int meId, Integer usId) {

		return String.valueOf(this.MeStatusMapper.updateSetNoReadStatus(Integer.valueOf(meId), usId));
	}

	@Override
	public String setDelStatus(int meId, Integer usId) {

		return String.valueOf(this.MeStatusMapper.updateSetDelStatus(Integer.valueOf(meId), usId));
	}
}

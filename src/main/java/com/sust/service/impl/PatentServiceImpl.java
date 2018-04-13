package com.sust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.PatentMapper;
import com.sust.entity.Patent;
import com.sust.service.PatentService;

@Service
public class PatentServiceImpl implements PatentService {

	@Resource
	private PatentMapper petentMapper;

	@Override
	public List<Patent> getUserPatent(Integer usId) {
		return this.petentMapper.selectByUsId(usId);
	}

	@Override
	public Patent getPaInfoByraId(int paId) {
		return this.petentMapper.selectByPrimaryKey(paId);
	}

	@Override
	public int DeletePaInfoById(int paId) {
		return this.petentMapper.deleteByPrimaryKey(paId);
	}

	@Override
	public int addPaInfo(Patent patent) {
		return this.petentMapper.insertSelective(patent);
	}

	@Override
	public String getUserNameById(Integer usId) {
		return this.petentMapper.selectgetUserNameById(usId);
	}

	@Override
	public int upPaInfo(Patent patent) {
		return this.petentMapper.updateByPrimaryKey(patent);
	}

}

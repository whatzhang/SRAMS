package com.sust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.PraiseMapper;
import com.sust.entity.Praise;
import com.sust.service.PraiseService;

@Service
public class PraiseServiceImpl implements PraiseService {

	@Resource
	private PraiseMapper praiseMapper;
	
	@Override
	public List<Praise> getUserPraiseInfo(Integer usId) {
		
		return this.praiseMapper.selectUserPraiseInfo(usId);
	}

	@Override
	public Praise getRaInfoByraId(int prId) {
		
		return this.praiseMapper.selectByPrimaryKey(Integer.valueOf(prId));
	}

	@Override
	public int DeletePrInfo(int prId) {
		
		return this.praiseMapper.deleteByPrimaryKey(Integer.valueOf(prId));
	}

	@Override
	public int addPrInfo(Praise praise) {
		
		return this.praiseMapper.insertSelective(praise);
	}

	@Override
	public String getUserNameById(Integer usId) {
		
		return this.praiseMapper.selectUserNameById(usId);
	}

	@Override
	public int upPrInfo(Praise praise) {
		
		return this.praiseMapper.updateByPrimaryKey(praise);
	}

}

package com.sust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.RaceMapper;
import com.sust.entity.Race;
import com.sust.service.RaceService;

@Service
public class RaceServiceImpl implements RaceService {

	@Resource
	private RaceMapper raceMapper;
	
	@Override
	public List<Race> getUserRace(Integer usId) {
		
		return this.raceMapper.selectUserRaceList(usId);
	}

	@Override
	public Race getRaInfoByraId(int raId) {
		
		return this.raceMapper.selectByPrimaryKey(raId);
	}

	@Override
	public int DeleteRaInfoByThid(int raId) {
		
		return this.raceMapper.deleteByPrimaryKey(raId);
	}

	@Override
	public String getUserNameById(Integer usId) {

		return this.raceMapper.selectUserNameById(usId);
	}

	@Override
	public int addRaInfo(Race race) {
		
		return this.raceMapper.insertSelective(race);
	}

	@Override
	public int upRaInfo(Race race) {
		
		return this.raceMapper.updateByPrimaryKey(race);
	}

}

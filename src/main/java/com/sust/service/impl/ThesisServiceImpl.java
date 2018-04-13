package com.sust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.ThesisMapper;
import com.sust.entity.Thesis;
import com.sust.service.ThesisService;

@Service
public class ThesisServiceImpl implements ThesisService {

	@Resource
	private ThesisMapper thesisMapper;

	@Override
	public List<Thesis> getThesisInfo(Integer usId) {

		return this.thesisMapper.selectByUsId(usId);
	}

	@Override
	public Thesis getThInfoByThid(int id) {

		return this.thesisMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteThesisById(int deId) {

		return this.thesisMapper.deleteByPrimaryKey(deId);
	}

	@Override
	public int addThesis(Thesis thesis) {

		System.out.println(thesis.toString());

		return this.thesisMapper.insertSelective(thesis);
	}

	@Override
	public String getUserNameById(int usId) {

		return this.thesisMapper.selectUserNameById(usId);
	}

	@Override
	public int upThesisInfo(Thesis thesis) {

		return this.thesisMapper.updateByPrimaryKey(thesis);
	}
}

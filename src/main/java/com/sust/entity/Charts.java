package com.sust.entity;

import java.util.Arrays;
import java.util.List;

import com.sust.other.MyUtils;

public class Charts {

	private List<String> typeName = Arrays.asList("论文","专利","获奖","项目","教材","竞赛");

	
	
	
	
	
	public String getTypeName() {
		return MyUtils.getData(typeName);
	}

	public void setTypeName(List<String> typeName) {
		this.typeName = typeName;
	}
	
	
}

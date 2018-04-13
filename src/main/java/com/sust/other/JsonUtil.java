package com.sust.other;

import java.util.List;

import net.sf.json.JSONArray;

public class JsonUtil {

	public String toStr(List<String> list) {

		return JSONArray.fromObject(list).toString();
	}

	@SuppressWarnings("unchecked")
	public List<String> toList(JSONArray jsonArray) {

		return (List<String>) JSONArray.toCollection(jsonArray);
	}

}

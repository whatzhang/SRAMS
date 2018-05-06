package com.sust.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.sust.entity.Project;

public interface ProjectService {

	int upProInfo(Project project);

	int addProInfo(Project project);

	String DeleteProInfoById(int deId, String fg, String type, HttpSession session);

	Project getProInfoByProId(int proId);

	List<Project> getUserProList(Integer usId);

	List<Project> getAllProList();

	Map<String, Object> GuiNaProject(String flg, String xuyuan, String sex, String duty, String bigAge, String smlAge,
			String major, String proCate, String bigProda, String smlProda, String bigMoney, String smlMoney,
			String bigProUp, String smlProUp);

	List<Project> findProInfo(String bigThda, String smlThda, String proCate, String bigMoney, String smlMoney,
			String bigThUp, String smlThUp);

}

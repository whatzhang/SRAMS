package com.sust.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sust.entity.AllInfo;
import com.sust.entity.Login;
import com.sust.entity.Project;
import com.sust.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	private static final Log logger = LogFactory.getLog(ProjectController.class);

	@Resource
	private ProjectService projectService;

	@RequestMapping("/getUserProList")
	private String getUserProList(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {
		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("getUserProList++" + usId);
		PageHelper.startPage(pa, pageSize);
		List<Project> list = projectService.getUserProList(usId);
		PageInfo<Project> page = new PageInfo<Project>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("ProjectList", list);
		return "users/project";
	}

	@RequestMapping(value = "/getProInfo")
	@ResponseBody
	public Project getProInfo(@RequestParam("ProId") int ProId) {

		logger.info("getProInfo++" + ProId);
		return this.projectService.getProInfoByProId(ProId);
	}

	@RequestMapping(value = "/DeleteProInfo", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo DeleteProInfo(@RequestParam("deId") int deId, @RequestParam("fg") String fg, HttpSession session) {

		logger.info("DeleteProInfo++" + deId + "++" + fg);
		return new AllInfo(this.projectService.DeleteProInfoById(deId, fg, "project", session));
	}

	@RequestMapping(value = "/addProInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo addProInfo(@RequestParam("usId") Integer usId, @RequestParam("ProName") String ProName,
			@RequestParam("ProCategory") String ProCategory, @RequestParam("ProDate") String ProDate,
			@RequestParam("proCash") Integer proCash, @RequestParam("proLeader") String proLeader,
			@RequestParam("proTeam") String proTeam, @RequestParam("ProAbout") String ProAbout) throws ParseException {

		logger.info("addProInfo++" + usId + "++" + ProName + "++" + ProCategory + "++" + ProDate + "++" + proCash + "++"
				+ proLeader + "++" + proTeam + "++" + ProAbout);
		int re = this.projectService.addProInfo(
				new Project(usId, ProName, ProCategory, (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(ProDate)),
						proCash, proLeader, proTeam, ProAbout, new Date(System.currentTimeMillis())));
		return new AllInfo(String.valueOf(re));
	}

	@RequestMapping(value = "/upProInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo upProInfo(@RequestParam("ProId") Integer ProId, @RequestParam("usId") Integer usId,
			@RequestParam("ProName") String ProName, @RequestParam("ProCategory") String ProCategory,
			@RequestParam("ProDate") String ProDate, @RequestParam("proCash") Integer proCash,
			@RequestParam("proLeader") String proLeader, @RequestParam("proTeam") String proTeam,
			@RequestParam("ProAbout") String ProAbout) throws ParseException {

		logger.info("addProInfo++" + ProId + "++" + usId + "++" + ProName + "++" + ProCategory + "++" + ProDate + "++"
				+ proCash + "++" + proLeader + "++" + proTeam + "++" + ProAbout);
		int re = this.projectService.upProInfo(new Project(ProId, usId, ProName, ProCategory,
				(Date) (new SimpleDateFormat("yyyy-MM-dd").parse(ProDate)), proCash, proLeader, proTeam, ProAbout,
				new Date(System.currentTimeMillis())));
		return new AllInfo(String.valueOf(re));
	}
	/**
	 * admin数据处理
	 */
	@RequestMapping("/getAllProList")
	private String getAllProList(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {

		logger.info("getAllProList++"+pageSize+"++"+pa);
		PageHelper.startPage(pa, pageSize);
		List<Project> list = projectService.getAllProList();
		PageInfo<Project> page = new PageInfo<Project>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("ProjectList", list);
		return "admin/ad_project";
	}
}
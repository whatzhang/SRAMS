package com.sust.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.sust.other.PageUtil;
import com.sust.service.DownloadService;
import com.sust.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	private static final Log logger = LogFactory.getLog(ProjectController.class);

	@Resource
	private ProjectService projectService;
	@Resource
	private DownloadService downloadService;
	private List<Project> projectList = null;

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
						proCash, proLeader, proTeam, ProAbout, new Date()));
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
				new Date()));
		return new AllInfo(String.valueOf(re));
	}

	@RequestMapping(value = "/findUserProjectInfo", method = RequestMethod.GET)
	private void findUserBookInfo(@RequestParam("date6") String bigThda, @RequestParam("Cdate6") String smlThda,
			@RequestParam("ProCate") String ProCate, @RequestParam("bigMoney") String bigMoney,
			@RequestParam("smlMoney") String smlMoney, @RequestParam("date7") String bigThUp,
			@RequestParam("Cdate7") String smlThUp, Model model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		logger.info("findUserProjectInfo++" + bigMoney + "++" + ProCate);
		this.setProjectList(this.projectService.findUserProjectInfo(((Login) session.getAttribute("login")).getUsId(),
				bigThda, smlThda, ProCate, bigMoney, smlMoney, bigThUp, smlThUp));
		try {
			request.getRequestDispatcher("/project/getUserPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findProjectInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
	}

	@RequestMapping("/getUserPage")
	public String getUserPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getUserPage++" + pageSize + "++" + pa);
		if (this.getProjectList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Project> page1 = new PageUtil<Project>(this.getProjectList(), pa, pageSize);
			model.addAttribute("ProjectList", page1.getPagedList());
			/*
			 * for (Project thesis : page1.getPagedList()) {
			 * System.out.println(thesis.toString()); }
			 */
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "users/project";
	}

	@RequestMapping("/downloadUserFind")
	public ResponseEntity<byte[]> downloadUserFind(HttpSession session) {

		HttpHeaders headers = new HttpHeaders();
		String FileName = "findExcl" + ".xls";
		try {
			FileName = new String(FileName.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			logger.error("downloadUserFind_error");
		}
		headers.setContentDispositionFormData("attachment", FileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		ResponseEntity<byte[]> entity = null;
		try {
			entity = new ResponseEntity<byte[]>(
					FileUtils.readFileToByteArray(
							this.downloadService.getGuiNaWorkBookStreamPro("project", this.getProjectList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadUserFind_ResponseEntity_error");
		}
		return entity;
	}

	/**
	 * admin数据处理
	 */
	@RequestMapping("/getAllProList")
	private String getAllProList(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {

		logger.info("getAllProList++" + pageSize + "++" + pa);
		PageHelper.startPage(pa, pageSize);
		List<Project> list = projectService.getAllProList();
		PageInfo<Project> page = new PageInfo<Project>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("ProjectList", list);
		return "admin/ad_project";
	}

	@RequestMapping(value = "/findProjectInfo", method = RequestMethod.GET)
	private void findProjectInfo(@RequestParam("date6") String bigThda, @RequestParam("Cdate6") String smlThda,
			@RequestParam("ProCate") String ProCate, @RequestParam("bigMoney") String bigMoney,
			@RequestParam("smlMoney") String smlMoney, @RequestParam("date7") String bigThUp,
			@RequestParam("Cdate7") String smlThUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		logger.info("findProjectInfo++" + bigThda + "++" + ProCate);
		this.setProjectList(
				this.projectService.findProInfo(bigThda, smlThda, ProCate, bigMoney, smlMoney, bigThUp, smlThUp));
		try {
			request.getRequestDispatcher("/project/getPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findprojectInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
		logger.info("/project/getPage");
	}

	@RequestMapping("/getPage")
	public String getPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getPage++" + pageSize + "++" + pa);
		if (this.getProjectList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Project> page1 = new PageUtil<Project>(this.getProjectList(), pa, pageSize);
			model.addAttribute("ProjectList", page1.getPagedList());
			/*
			 * for (Project thesis : page1.getPagedList()) {
			 * System.out.println(thesis.toString()); }
			 */
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "admin/ad_project";
	}

	@RequestMapping("/downloadFind")
	public ResponseEntity<byte[]> downloadFind(HttpSession session) {

		HttpHeaders headers = new HttpHeaders();
		String FileName = "findExcl" + ".xls";
		try {
			FileName = new String(FileName.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			logger.error("downloadFind_error");
		}
		headers.setContentDispositionFormData("attachment", FileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		ResponseEntity<byte[]> entity = null;
		try {
			entity = new ResponseEntity<byte[]>(
					FileUtils.readFileToByteArray(
							this.downloadService.getGuiNaWorkBookStreamPro("project", this.getProjectList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadFind_ResponseEntity_error");
		}
		return entity;
	}

	public List<Project> getProjectList() {
		return projectList;
	}

	public void setProjectList(List<Project> projectList) {
		this.projectList = projectList;
	}
}
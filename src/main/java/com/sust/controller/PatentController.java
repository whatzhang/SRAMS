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
import com.sust.entity.Patent;
import com.sust.entity.Thesis;
import com.sust.service.PatentService;

@Controller
@RequestMapping("/patent")
public class PatentController {

	private static final Log logger = LogFactory.getLog(PatentController.class);

	@Resource
	private PatentService patentService;

	@RequestMapping("/getUserPaInfo")
	private String getUserPaInfo(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {
		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("getUserPaInfo++" + usId);
		PageHelper.startPage(pa, pageSize);
		List<Patent> list = patentService.getUserPatent(usId);
		PageInfo<Patent> page = new PageInfo<Patent>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("PatentList", list);
		return "users/patent";
	}

	@RequestMapping(value = "/getPaInfo")
	@ResponseBody
	public Patent getPaInfo(@RequestParam("Id") int paId) {

		logger.info("getPaInfo++" + paId);
		return this.patentService.getPaInfoByraId(paId);
	}

	@RequestMapping(value = "/DeletePaInfo", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo DeletePaInfo(@RequestParam("deId") int deId, @RequestParam("fg") String fg, HttpSession session) {

		logger.info("DeletePaInfo++" + deId + "++" + fg);
		return new AllInfo(this.patentService.DeletePaInfoById(deId, fg, "patent", session));
	}

	@RequestMapping(value = "/addPaInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo addPaInfo(@RequestParam("usId") Integer usId, @RequestParam("paName") String paName,
			@RequestParam("paCategory") String paCategory, @RequestParam("paNumber") String paNumber,
			@RequestParam("paPlease") String paPlease, @RequestParam("paDate") String paDate,
			@RequestParam("paAbout") String paAbout) throws ParseException {

		logger.info("addPaInfo++" + usId + "++" + paName + "++" + paCategory + "++" + paNumber + "++" + paPlease + "++"
				+ paDate + "++" + paAbout);
		int re = this.patentService.addPaInfo(new Patent(usId, paName, paCategory, patentService.getUserNameById(usId),
				(Date) (new SimpleDateFormat("yyyy-MM-dd").parse(paPlease)),
				(Date) (new SimpleDateFormat("yyyy-MM-dd").parse(paDate)), paNumber, paAbout,
				new Date()));
		return new AllInfo(String.valueOf(re));
	}

	@RequestMapping(value = "/upPaInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo upPaInfo(@RequestParam("usId") Integer usId, @RequestParam("Id") Integer paId,
			@RequestParam("paName") String paName, @RequestParam("paCategory") String paCategory,
			@RequestParam("paNumber") String paNumber, @RequestParam("paPlease") String paPlease,
			@RequestParam("paDate") String paDate, @RequestParam("paAbout") String paAbout) throws ParseException {

		logger.info("upPaInfo++" + usId + "++" + paId + "++" + paName + "++" + paCategory + "++" + paNumber + "++"
				+ paPlease + "++" + paDate + "++" + paAbout);
		int re = this.patentService.upPaInfo(new Patent(paId, usId, paName, paCategory,
				patentService.getUserNameById(usId), (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(paPlease)),
				(Date) (new SimpleDateFormat("yyyy-MM-dd").parse(paDate)), paNumber, paAbout,
				new Date()));
		return new AllInfo(String.valueOf(re));
	}

	/**
	 * admin数据处理
	 */
	@RequestMapping(value = "/getAllPaInfo")
	private String getAllPaInfo(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getAllPaInfo++" + pageSize + "++" + pa);
		PageHelper.startPage(pa, pageSize);
		List<Thesis> thList = this.patentService.getAllPaInfo();
		PageInfo<Thesis> page = new PageInfo<Thesis>(thList);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("PatentList", thList);
		return "admin/ad_patent";
	}
}

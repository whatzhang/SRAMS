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
import com.sust.entity.Praise;
import com.sust.service.PraiseService;

@Controller
@RequestMapping("/praise")
public class PraiseController {

	private static final Log logger = LogFactory.getLog(PraiseController.class);

	@Resource
	private PraiseService praiseService;

	@RequestMapping("/getUserPraiseInfo")
	public String getUserPraiseInfo(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {
		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("getUserInfo++" + usId);
		PageHelper.startPage(pa, pageSize);
		List<Praise> list = this.praiseService.getUserPraiseInfo(usId);
		PageInfo<Praise> page = new PageInfo<Praise>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("Pa", list);
		return "users/praise";
	}

	@RequestMapping(value = "/getPrInfo")
	@ResponseBody
	public Praise getPrInfo(@RequestParam("prId") int prId) {

		logger.info("getPrInfo++" + prId);
		return this.praiseService.getRaInfoByraId(prId);
	}

	@RequestMapping(value = "/DeletePrInfo", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo DeletePrInfo(@RequestParam("deId") int deId, @RequestParam("fg") String fg, HttpSession session) {

		logger.info("DeletePrInfo++" + deId + "++" + fg);
		return new AllInfo(this.praiseService.DeletePrInfo(deId, fg, "praise", session));
	}

	@RequestMapping(value = "/addPrInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo addPrInfo(@RequestParam("usId") Integer usId, @RequestParam("prName") String prName,
			@RequestParam("prCategory") String prCategory, @RequestParam("prDate") String prDate,
			@RequestParam("prUnit") String prUnit, @RequestParam("prAbout") String prAbout) throws ParseException {

		logger.info("addPrInfo++" + usId + "++" + prName + "++" + prCategory + "++" + prDate + "++" + prUnit + "++"
				+ prAbout);
		int re = this.praiseService.addPrInfo(
				new Praise(usId, prName, prCategory, (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(prDate)), prUnit,
						praiseService.getUserNameById(usId), prAbout, new Date(System.currentTimeMillis())));
		return new AllInfo(String.valueOf(re));
	}

	@RequestMapping(value = "/upPrInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo upPrInfo(@RequestParam("usId") Integer usId, @RequestParam("prId") Integer prId,
			@RequestParam("prName") String prName, @RequestParam("prCategory") String prCategory,
			@RequestParam("prDate") String prDate, @RequestParam("prUnit") String prUnit,
			@RequestParam("prAbout") String prAbout) throws ParseException {

		logger.info("upPrInfo++" + prId + "++" + usId + "++" + prName + "++" + prCategory + "++" + prDate + "++"
				+ prUnit + "++" + prAbout);
		int re = this.praiseService.upPrInfo(
				new Praise(prId, usId, prName, prCategory, (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(prDate)),
						prUnit, praiseService.getUserNameById(usId), prAbout, new Date(System.currentTimeMillis())));
		return new AllInfo(String.valueOf(re));
	}
}

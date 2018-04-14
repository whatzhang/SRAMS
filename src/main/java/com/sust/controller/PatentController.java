package com.sust.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sust.entity.AllInfo;
import com.sust.entity.Login;
import com.sust.entity.Patent;
import com.sust.service.PatentService;

@Controller
@RequestMapping("/patent")
public class PatentController {

	private static final Log logger = LogFactory.getLog(PatentController.class);

	@Resource
	private PatentService patentService;

	@RequestMapping("/getUserPaInfo")
	private String getUserPaInfo(Model model, HttpServletRequest request) {

		Integer usId = ((Login) request.getSession().getAttribute("login")).getUsId();
		logger.info("getUserPaInfo++" + usId);
		model.addAttribute("PatentList", patentService.getUserPatent(usId));
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

		logger.info("DeletePaInfo++" + deId+"++"+fg);
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
				new Date(System.currentTimeMillis())));
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
				new Date(System.currentTimeMillis())));
		return new AllInfo(String.valueOf(re));
	}
}

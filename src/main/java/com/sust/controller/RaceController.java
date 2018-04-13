package com.sust.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import com.sust.entity.Race;
import com.sust.service.RaceService;

@Controller
@RequestMapping("/race")
public class RaceController {

	private static final Log logger = LogFactory.getLog(RaceController.class);

	@Resource
	private RaceService raceservice;

	@RequestMapping("/getUserRaceInfo")
	private String getUserRaceInfo(Model model, HttpServletRequest request) {

		Integer usId = ((Login) request.getSession().getAttribute("login")).getUsId();
		logger.info("getUserRaceInfo++" + usId);
		model.addAttribute("RaceList", raceservice.getUserRace(usId));
		return "users/race";
	}

	@RequestMapping(value = "/getRaInfo")
	@ResponseBody
	public Race getRaInfo(@RequestParam("raId") int raId) {

		logger.info("getRaInfo++" + raId);
		return this.raceservice.getRaInfoByraId(raId);
	}

	@RequestMapping(value = "/DeleteRaInfo", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo DeleteRaInfo(@RequestParam("raId") int raId) {

		logger.info("DeleteRaInfo++" + raId);
		return new AllInfo(String.valueOf(this.raceservice.DeleteRaInfoByThid(raId)));
	}

	@RequestMapping(value = "/addRaInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo addRaInfo(@RequestParam("usId") Integer usId, @RequestParam("raName") String raName,
			@RequestParam("raCategory") String raCategory, @RequestParam("Cdate") String Cdate,
			@RequestParam("raLevel") String raLevel, @RequestParam("raType") String raType,
			@RequestParam("raTeacher") String raTeacher, @RequestParam("raAbout") String raAbout)
					throws ParseException {

		logger.info("addRaInfo++" + usId + "++" + raName + "++" + raCategory + "++" + Cdate + "++" + raLevel + "++"
				+ raType + "++" + raTeacher + "++" + raAbout);
		int re = this.raceservice
				.addRaInfo(new Race(usId, raName, raCategory, raType, raceservice.getUserNameById(usId), raLevel,
						raTeacher, (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(Cdate)), raAbout,
						new Date(System.currentTimeMillis())));
		return new AllInfo(String.valueOf(re));
	}

	@RequestMapping(value = "/upRaInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo upRaInfo(@RequestParam("usId") Integer usId, @RequestParam("raId") Integer raId,
			@RequestParam("raName") String raName, @RequestParam("raCategory") String raCategory,
			@RequestParam("Cdate") String Cdate, @RequestParam("raLevel") String raLevel,
			@RequestParam("raType") String raType, @RequestParam("raTeacher") String raTeacher,
			@RequestParam("raAbout") String raAbout) throws ParseException {

		logger.info("upRaInfo++" + usId + "++" + raId + "++" + raName + "++" + raCategory + "++" + Cdate + "++"
				+ raLevel + "++" + raType + "++" + raTeacher + "++" + raAbout);
		int re = this.raceservice
				.upRaInfo(new Race(raId, usId, raName, raCategory, raType, raceservice.getUserNameById(usId), raLevel,
						raTeacher, (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(Cdate)), raAbout,
						new Date(System.currentTimeMillis())));
		return new AllInfo(String.valueOf(re));
	}
}

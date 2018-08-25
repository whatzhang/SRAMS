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
import com.sust.entity.Race;
import com.sust.other.PageUtil;
import com.sust.service.DownloadService;
import com.sust.service.RaceService;

@Controller
@RequestMapping("/race")
public class RaceController {

	private static final Log logger = LogFactory.getLog(RaceController.class);

	@Resource
	private RaceService raceService;
	@Resource
	private DownloadService downloadService;
	private List<Race> raceList = null;

	@RequestMapping("/getUserRaceInfo")
	private String getUserRaceInfo(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {
		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("getUserRaceInfo++" + usId);
		PageHelper.startPage(pa, pageSize);
		List<Race> list = raceService.getUserRace(usId);
		PageInfo<Race> page = new PageInfo<Race>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("RaceList", list);
		return "users/race";
	}

	@RequestMapping(value = "/getRaInfo")
	@ResponseBody
	public Race getRaInfo(@RequestParam("raId") int raId) {

		logger.info("getRaInfo++" + raId);
		return this.raceService.getRaInfoByraId(raId);
	}

	@RequestMapping(value = "/DeleteRaInfo", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo DeleteRaInfo(@RequestParam("deId") int deId, @RequestParam("fg") String fg, HttpSession session) {

		logger.info("DeleteThInfo++" + deId + "++" + fg);
		return new AllInfo(this.raceService.DeleteRaInfoByThid(deId, fg, "race", session));
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
		int re = this.raceService
				.addRaInfo(new Race(usId, raName, raCategory, raType, raceService.getUserNameById(usId), raLevel,
						raTeacher, (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(Cdate)), raAbout,
						new Date()));
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
		int re = this.raceService
				.upRaInfo(new Race(raId, usId, raName, raCategory, raType, raceService.getUserNameById(usId), raLevel,
						raTeacher, (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(Cdate)), raAbout,
						new Date()));
		return new AllInfo(String.valueOf(re));
	}
	
	@RequestMapping(value = "/findUserRaceInfo", method = RequestMethod.GET)
	private void findUserBookInfo(@RequestParam("date10") String bigThda, @RequestParam("Cdate10") String smlThda,
			@RequestParam("RaCate") String RaCate, @RequestParam("RaTuan") String RaTuan,
			@RequestParam("date11") String bigThUp, @RequestParam("Cdate11") String smlThUp, Model model, HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {

		logger.info("findUserRaceInfo++" + bigThda + "++" + RaCate);
		this.setRaceList(this.raceService.findUserRaceInfo(((Login)session.getAttribute("login")).getUsId(),bigThda, smlThda, RaCate, RaTuan, bigThUp, smlThUp));
		try {
			request.getRequestDispatcher("/race/getUserPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findRaceInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getUserPage")
	public String getUserPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getUserPage++" + pageSize + "++" + pa);
		if (this.getRaceList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Race> page1 = new PageUtil<Race>(this.getRaceList(), pa, pageSize);
			model.addAttribute("RaList", page1.getPagedList());
			/*for (Race thesis : page1.getPagedList()) {
				System.out.println(thesis.toString());
			}*/
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "users/race";
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
					FileUtils.readFileToByteArray(this.downloadService.getGuiNaWorkBookStreamRa("race", this.getRaceList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadUserFind_ResponseEntity_error");
		}
		return entity;
	}

	/**
	 * admin数据处理
	 */
	@RequestMapping("/getAllRaceInfo")
	private String getAllRaceInfo(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {

		logger.info("getAllRaceInfo++" + pageSize + "++" + pa);
		PageHelper.startPage(pa, pageSize);
		List<Race> list = raceService.getAllRaceInfo();
		PageInfo<Race> page = new PageInfo<Race>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("RaceList", list);
		return "admin/ad_race";
	}
	
	@RequestMapping(value = "/findRaceInfo", method = RequestMethod.GET)
	private void findRaceInfo(@RequestParam("date10") String bigThda, @RequestParam("Cdate10") String smlThda,
			@RequestParam("RaCate") String RaCate, @RequestParam("RaTuan") String RaTuan,
			@RequestParam("date11") String bigThUp, @RequestParam("Cdate11") String smlThUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		logger.info("findRaceInfo++" + bigThda + "++" + RaCate);
		this.setRaceList(this.raceService.findRaInfo(bigThda, smlThda, RaCate, RaTuan, bigThUp, smlThUp));
		try {
			request.getRequestDispatcher("/race/getPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findRaceInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
        logger.info("/race/getPage");
	}

	@RequestMapping("/getPage")
	public String getPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getPage++" + pageSize + "++" + pa);
		if (this.getRaceList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Race> page1 = new PageUtil<Race>(this.getRaceList(), pa, pageSize);
			model.addAttribute("RaLists", page1.getPagedList());
			/*for (Race thesis : page1.getPagedList()) {
				System.out.println(thesis.toString());
			}*/
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "admin/ad_race";
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
					FileUtils.readFileToByteArray(this.downloadService.getGuiNaWorkBookStreamRa("race", this.getRaceList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadFind_ResponseEntity_error");
		}
		return entity;
	}

	public List<Race> getRaceList() {
		return raceList;
	}

	public void setRaceList(List<Race> raceList) {
		this.raceList = raceList;
	}
}

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
import com.sust.entity.Praise;
import com.sust.other.PageUtil;
import com.sust.service.DownloadService;
import com.sust.service.PraiseService;

@Controller
@RequestMapping("/praise")
public class PraiseController {

	private static final Log logger = LogFactory.getLog(PraiseController.class);

	@Resource
	private PraiseService praiseService;
	@Resource
	private DownloadService downloadService;
	private List<Praise> praiseList = null;

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
						praiseService.getUserNameById(usId), prAbout, new Date()));
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
						prUnit, praiseService.getUserNameById(usId), prAbout, new Date()));
		return new AllInfo(String.valueOf(re));
	}
	
	@RequestMapping(value = "/findUserPraiseInfo", method = RequestMethod.GET)
	private void findUserBookInfo(@RequestParam("date4") String bigThda, @RequestParam("Cdate4") String smlThda,
			@RequestParam("PrCate") String PrCate, @RequestParam("date5") String bigThUp,
			@RequestParam("Cdate5") String smlThUp, Model model, HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {

		logger.info("findUserPraiseInfo++" + bigThda + "++" + PrCate);
		this.setPraiseList(this.praiseService.findUserPraiseInfo(((Login)session.getAttribute("login")).getUsId(),bigThda, smlThda, PrCate, bigThUp, smlThUp));
		try {
			request.getRequestDispatcher("/praise/getUserPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findPraiseInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getUserPage")
	public String getUserPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getUserPage++" + pageSize + "++" + pa);
		if (this.getPraiseList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Praise> page1 = new PageUtil<Praise>(this.getPraiseList(), pa, pageSize);
			model.addAttribute("PrList", page1.getPagedList());
			/*for (Praise thesis : page1.getPagedList()) {
				System.out.println(thesis.toString());
			}*/
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "users/praise";
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
					FileUtils.readFileToByteArray(this.downloadService.getGuiNaWorkBookStreamPr("praise", this.getPraiseList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadUserFind_ResponseEntity_error");
		}
		return entity;
	}

	/**
	 * admin数据处理
	 */
	@RequestMapping("/getAllPraiseInfo")
	public String getAllPraiseInfo(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {

		logger.info("getAllPraiseInfo++" + pageSize + "++" + pa);
		PageHelper.startPage(pa, pageSize);
		List<Praise> list = this.praiseService.getAllPraiseInfo();
		PageInfo<Praise> page = new PageInfo<Praise>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("Pa", list);
		return "admin/ad_praise";
	}
	
	@RequestMapping(value = "/findPraiseInfo", method = RequestMethod.GET)
	private void findPraiseInfo(@RequestParam("date4") String bigThda, @RequestParam("Cdate4") String smlThda,
			@RequestParam("PrCate") String PrCate, @RequestParam("date5") String bigThUp,
			@RequestParam("Cdate5") String smlThUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		logger.info("findPraiseInfo++" + bigThda + "++" + PrCate);
		this.setPraiseList(this.praiseService.findPrInfo(bigThda, smlThda, PrCate, bigThUp, smlThUp));
		try {
			request.getRequestDispatcher("/praise/getPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findpraiseInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
        logger.info("/praise/getPage");
	}

	@RequestMapping("/getPage")
	public String getPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getPage++" + pageSize + "++" + pa);
		if (this.getPraiseList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Praise> page1 = new PageUtil<Praise>(this.getPraiseList(), pa, pageSize);
			model.addAttribute("PraiseList", page1.getPagedList());
			/*for (Praise thesis : page1.getPagedList()) {
				System.out.println(thesis.toString());
			}*/
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "admin/ad_praise";
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
					FileUtils.readFileToByteArray(this.downloadService.getGuiNaWorkBookStreamPr("praise", this.getPraiseList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadFind_ResponseEntity_error");
		}
		return entity;
	}

	public List<Praise> getPraiseList() {
		return praiseList;
	}

	public void setPraiseList(List<Praise> praiseList) {
		this.praiseList = praiseList;
	}
}

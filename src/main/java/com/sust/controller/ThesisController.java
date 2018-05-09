package com.sust.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.sust.entity.Thesis;
import com.sust.other.PageUtil;
import com.sust.service.DownloadService;
import com.sust.service.ThesisService;

@Controller
@RequestMapping("/thesis")
public class ThesisController {

	private static final Log logger = LogFactory.getLog(ThesisController.class);
	@Resource
	private ThesisService thesisService;
	@Resource
	private DownloadService downloadService;
	private List<Thesis> ThesisList = null;

	@RequestMapping(value = "/getUserThInfo")
	private String getUserThInfo(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {
		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("getUserThInfo++" + usId);
		PageHelper.startPage(pa, pageSize);
		List<Thesis> thList = this.thesisService.getThesisInfo(usId);
		PageInfo<Thesis> page = new PageInfo<Thesis>(thList);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("list", thList);
		return "users/thesis";
	}

	@RequestMapping(value = "/getShowInfo", method = RequestMethod.POST)
	@ResponseBody
	public Thesis getShowInfo(@RequestParam("thId") int id) {

		logger.info("getShowInfo++" + id);
		return this.thesisService.getThInfoByThid(id);
	}

	@RequestMapping(value = "/DeleteThInfo", method = RequestMethod.POST)
	@ResponseBody
	private AllInfo DeleteThInfo(@RequestParam("deId") int deId, @RequestParam("fg") String fg, HttpSession session) {

		logger.info("DeleteThInfo++" + deId + "++" + fg);
		return new AllInfo(this.thesisService.deleteThesisById(deId, fg, "thesis", session));
	}

	@RequestMapping(value = "/getThInfoUp", method = RequestMethod.POST)
	@ResponseBody
	private Thesis getThInfoUp(@RequestParam("upId") int upId) {

		logger.info("getThInfoUp++" + upId);
		return this.thesisService.getThInfoByThid(upId);
	}

	@RequestMapping(value = "/addThesisInfo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> addThesisInfo(@RequestParam("usId") int usId, @RequestParam("thName") String thName,
			@RequestParam("thCate") String thCate, @RequestParam("Cdate") String Cdate,
			@RequestParam("thLevel") String thLevel, @RequestParam("thfactor") String thfactor,
			@RequestParam("thIscloud") String thIscloud, @RequestParam("thNum") String thNum,
			@RequestParam("thJour") String thJour, @RequestParam("thPage") String thPage,
			@RequestParam("thAbout") String thAbout) throws ParseException {

		logger.info("addThesisInfo++" + usId + "++" + thName + "++" + thName + "++" + thCate + "++" + Cdate + "++"
				+ thLevel + "++" + thfactor + "++" + thIscloud + "++" + thNum + "++" + thJour + "++" + thPage + "++"
				+ thAbout);
		int sta = this.thesisService.addThesis(new Thesis(usId, thName, thCate, thesisService.getUserNameById(usId),
				(Date) (new SimpleDateFormat("yyyy-MM-dd").parse(Cdate)), thLevel, thfactor, thIscloud, thNum, thJour,
				thPage, thAbout, new Date()));
		Map<String, String> result = new HashMap<String, String>();
		result.put("status", String.valueOf(sta));
		result.put("info", "添加论文信息成功！");
		result.put("urlNext", "/thesis/getUserThInfo");
		return result;
	}

	@RequestMapping(value = "/updateThInfo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> updateThInfo(@RequestParam("usId") int usId, @RequestParam("thId") int thId,
			@RequestParam("thName") String thName, @RequestParam("thCate") String thCate,
			@RequestParam("Cdate") String Cdate, @RequestParam("thLevel") String thLevel,
			@RequestParam("thfactor") String thfactor, @RequestParam("thIscloud") String thIscloud,
			@RequestParam("thNum") String thNum, @RequestParam("thJour") String thJour,
			@RequestParam("thPage") String thPage, @RequestParam("thAbout") String thAbout) throws ParseException {

		logger.info("updateThInfo++" + usId + "++" + thId + "++" + thName + "++" + thName + "++" + thCate + "++" + Cdate
				+ "++" + thLevel + "++" + thfactor + "++" + thIscloud + "++" + thNum + "++" + thJour + "++" + thPage
				+ "++" + thAbout);
		int sta = this.thesisService.upThesisInfo(new Thesis(thId, usId, thName, thCate,
				thesisService.getUserNameById(usId), (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(Cdate)), thLevel,
				thfactor, thIscloud, thNum, thJour, thPage, thAbout, new Date()));
		Map<String, String> result = new HashMap<String, String>();
		result.put("status", String.valueOf(sta));
		result.put("info", "修改论文信息成功！");
		result.put("urlNext", "/thesis/getUserThInfo");
		return result;
	}
	
	@RequestMapping(value = "/findUserThesisInfo", method = RequestMethod.GET)
	private void findUserBookInfo(@RequestParam("date") String bigThda, @RequestParam("Cdate") String smlThda,
			@RequestParam("thCate") String thCate, @RequestParam("thle") String thle,
			@RequestParam("thIsCl") String thIsCl, @RequestParam("date1") String bigThUp,
			@RequestParam("Cdate1") String smlThUp, Model model, HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {

		logger.info("findUserThesisInfo++" + bigThda + "++" + thCate);
		this.setThesisList(this.thesisService.findUserThesisInfo(((Login)session.getAttribute("login")).getUsId(),bigThda, smlThda, thCate, thle, thIsCl, bigThUp, smlThUp));
		try {
			request.getRequestDispatcher("/thesis/getUserPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findThesisInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getUserPage")
	public String getUserPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getUserPage++" + pageSize + "++" + pa);
		if (this.getThesisList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Thesis> page1 = new PageUtil<Thesis>(this.getThesisList(), pa, pageSize);
			model.addAttribute("ThesisList", page1.getPagedList());
			/*for (Thesis thesis : page1.getPagedList()) {
				System.out.println(thesis.toString());
			}*/
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "users/thesis";
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
					FileUtils.readFileToByteArray(this.downloadService.getGuiNaWorkBookStreamTh("thesis", this.getThesisList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadUserFind_ResponseEntity_error");
		}
		return entity;
	}

	/**
	 * admin数据处理
	 */
	@RequestMapping("/getAllThInfo")
	private String getAllThInfo(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getAllThInfo++" + pageSize + "++" + pa);
		PageHelper.startPage(pa, pageSize);
		List<Thesis> thList = this.thesisService.getAllThInfo();
		PageInfo<Thesis> page = new PageInfo<Thesis>(thList);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("list", thList);
		return "admin/ad_thesis";
	}

	@RequestMapping(value = "/addAllThesisInfo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> addAllThesisInfo(@RequestParam("usId") int usId, @RequestParam("thName") String thName,
			@RequestParam("thAuthor") String thAuthor, @RequestParam("thCate") String thCate,
			@RequestParam("Cdate") String Cdate, @RequestParam("thLevel") String thLevel,
			@RequestParam("thfactor") String thfactor, @RequestParam("thIscloud") String thIscloud,
			@RequestParam("thNum") String thNum, @RequestParam("thJour") String thJour,
			@RequestParam("thPage") String thPage, @RequestParam("thAbout") String thAbout) throws ParseException {

		logger.info("addAllThesisInfo++" + usId + "++" + thName + "++" + thName + "++" + thCate + "++" + Cdate + "++"
				+ thLevel + "++" + thfactor + "++" + thIscloud + "++" + thNum + "++" + thJour + "++" + thPage + "++"
				+ thAbout);
		int sta = this.thesisService.addThesis(
				new Thesis(usId, thName, thCate, thAuthor, (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(Cdate)),
						thLevel, thfactor, thIscloud, thNum, thJour, thPage, thAbout, new Date()));
		Map<String, String> result = new HashMap<String, String>();
		result.put("status", String.valueOf(sta));
		result.put("info", "添加论文信息成功！");
		result.put("urlNext", "/thesis/getAllThInfo");
		return result;
	}

	@RequestMapping(value = "/updateAllThInfo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> updateAllThInfo(@RequestParam("usId") int usId, @RequestParam("thId") int thId,
			@RequestParam("thName") String thName, @RequestParam("thCate") String thCate,
			@RequestParam("Cdate") String Cdate, @RequestParam("thLevel") String thLevel,
			@RequestParam("thfactor") String thfactor, @RequestParam("thIscloud") String thIscloud,
			@RequestParam("thNum") String thNum, @RequestParam("thJour") String thJour,
			@RequestParam("thPage") String thPage, @RequestParam("thAbout") String thAbout) throws ParseException {

		logger.info("updateAllThInfo++" + usId + "++" + thId + "++" + thName + "++" + thName + "++" + thCate + "++"
				+ Cdate + "++" + thLevel + "++" + thfactor + "++" + thIscloud + "++" + thNum + "++" + thJour + "++"
				+ thPage + "++" + thAbout);
		int sta = this.thesisService.upThesisInfo(new Thesis(thId, usId, thName, thCate,
				thesisService.getUserNameById(usId), (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(Cdate)), thLevel,
				thfactor, thIscloud, thNum, thJour, thPage, thAbout, new Date()));
		Map<String, String> result = new HashMap<String, String>();
		result.put("status", String.valueOf(sta));
		result.put("info", "修改论文信息成功！");
		result.put("urlNext", "/thesis/getAllThInfo");
		return result;
	}

	@RequestMapping(value = "/findThesisInfo", method = RequestMethod.GET)
	private void findThesisInfo(@RequestParam("date") String bigThda, @RequestParam("Cdate") String smlThda,
			@RequestParam("thCate") String thCate, @RequestParam("thle") String thle,
			@RequestParam("thIsCl") String thIsCl, @RequestParam("date1") String bigThUp,
			@RequestParam("Cdate1") String smlThUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		logger.info("findThesisInfo++" + bigThda + "++" + thCate);
		this.setThesisList(this.thesisService.findThInfo(bigThda, smlThda, thCate, thle, thIsCl, bigThUp, smlThUp));
		try {
			request.getRequestDispatcher("/thesis/getPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findThesisInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
        logger.info("/thesis/getPage");
	}

	@RequestMapping("/getPage")
	public String getPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getPage++" + pageSize + "++" + pa);
		if (this.getThesisList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Thesis> page1 = new PageUtil<Thesis>(this.getThesisList(), pa, pageSize);
			model.addAttribute("ThList", page1.getPagedList());
			/*for (Thesis thesis : page1.getPagedList()) {
				System.out.println(thesis.toString());
			}*/
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "admin/ad_thesis";
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
					FileUtils.readFileToByteArray(this.downloadService.getGuiNaWorkBookStreamTh("thesis", this.getThesisList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadFind_ResponseEntity_error");
		}
		return entity;
	}

	public List<Thesis> getThesisList() {
		return ThesisList;
	}

	public void setThesisList(List<Thesis> thesisList) {
		ThesisList = thesisList;
	}

}

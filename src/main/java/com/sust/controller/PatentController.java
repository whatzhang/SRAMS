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
import com.sust.entity.Patent;
import com.sust.other.PageUtil;
import com.sust.service.DownloadService;
import com.sust.service.PatentService;

@Controller
@RequestMapping("/patent")
public class PatentController {

	private static final Log logger = LogFactory.getLog(PatentController.class);

	@Resource
	private PatentService patentService;
	@Resource
	private DownloadService downloadService;
	private List<Patent> PatentList = null;

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
	
	@RequestMapping(value = "/findUserPatentInfo", method = RequestMethod.GET)
	private void findUserBookInfo(@RequestParam("PaCate") String PaCate, @RequestParam("date7") String bigPada,
			@RequestParam("Cdate7") String smlPada, @RequestParam("date8") String bigPaUp,
			@RequestParam("Cdate8") String smlPaUp, Model model, HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {

		logger.info("findUserPatentInfo++" + smlPada + "++" + PaCate);
		this.setPatentList(this.patentService.findUserPatentInfo(((Login)session.getAttribute("login")).getUsId(),PaCate, bigPada, smlPada, bigPaUp, smlPaUp));
		try {
			request.getRequestDispatcher("/patent/getUserPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findPatentInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getUserPage")
	public String getUserPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getUserPage++" + pageSize + "++" + pa);
		if (this.getPatentList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Patent> page1 = new PageUtil<Patent>(this.getPatentList(), pa, pageSize);
			model.addAttribute("paList", page1.getPagedList());
			/*for (Patent thesis : page1.getPagedList()) {
				System.out.println(thesis.toString());
			}*/
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "users/patent";
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
					FileUtils.readFileToByteArray(this.downloadService.getGuiNaWorkBookStreamPa("patent", this.getPatentList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadUserFind_ResponseEntity_error");
		}
		return entity;
	}

	/**
	 * admin数据处理
	 */
	@RequestMapping(value = "/getAllPaInfo")
	private String getAllPaInfo(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getAllPaInfo++" + pageSize + "++" + pa);
		PageHelper.startPage(pa, pageSize);
		List<Patent> thList = this.patentService.getAllPaInfo();
		PageInfo<Patent> page = new PageInfo<Patent>(thList);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("PatentList", thList);
		return "admin/ad_patent";
	}
	
	@RequestMapping(value = "/findPatentInfo", method = RequestMethod.GET)
	private void findPatentInfo(@RequestParam("PaCate") String PaCate, @RequestParam("date7") String bigPada,
			@RequestParam("Cdate7") String smlPada, @RequestParam("date8") String bigPaUp,
			@RequestParam("Cdate8") String smlPaUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		logger.info("findPatentInfo++" + PaCate );
		this.setPatentList(this.patentService.findThInfo(PaCate, bigPada, smlPada, bigPaUp, smlPaUp));
		try {
			request.getRequestDispatcher("/patent/getPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findPatentInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getPage")
	public String getPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getPage++" + pageSize + "++" + pa);
		if (this.getPatentList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Patent> page1 = new PageUtil<Patent>(this.getPatentList(), pa, pageSize);
			model.addAttribute("PaList", page1.getPagedList());
			/*for (Patent patent : page1.getPagedList()) {
				System.out.println(patent.toString());
			}*/
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "admin/ad_patent";
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
					FileUtils.readFileToByteArray(this.downloadService.getGuiNaWorkBookStreamPa("patent", this.getPatentList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadFind_ResponseEntity_error");
		}
		return entity;
	}
	
	public List<Patent> getPatentList() {
		return PatentList;
	}

	public void setPatentList(List<Patent> patentList) {
		PatentList = patentList;
	}
	
}

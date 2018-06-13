package com.sust.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sust.entity.Book;
import com.sust.entity.Charts;
import com.sust.entity.Patent;
import com.sust.entity.Praise;
import com.sust.entity.Project;
import com.sust.entity.Race;
import com.sust.entity.Thesis;
import com.sust.other.MyUtils;
import com.sust.other.PageUtil;
import com.sust.service.BookService;
import com.sust.service.DownloadService;
import com.sust.service.PatentService;
import com.sust.service.PraiseService;
import com.sust.service.ProjectService;
import com.sust.service.RaceService;
import com.sust.service.StatisticService;
import com.sust.service.ThesisService;

@Controller
@RequestMapping("/CountData")
public class StatisticController {

	private static final Log logger = LogFactory.getLog(StatisticController.class);
	@Resource
	private RaceService raceservice;
	@Resource
	private ThesisService thesisService;
	@Resource
	private PatentService patentService;
	@Resource
	private PraiseService praiseService;
	@Resource
	private ProjectService projectService;
	@Resource
	private BookService bookService;
	@Resource
	private DownloadService downloadService;
	@Resource
	private StatisticService statisticService;

	private List<Thesis> ThesisList = null;
	private List<Patent> PatentList = null;
	private List<Praise> PraiseList = null;
	private List<Project> ProjectList = null;
	private List<Book> BookList = null;
	private List<Race> RaceList = null;
	

	@RequestMapping("/getMenuInit")
	public String getMenuInit(Model model) {
		return "users/menu";
	}
	@RequestMapping("/getAdminMenuInit")
	public String getAdminMenuInit(Model model) {
		
		return "admin/ad_menu";
	}
	
	/**
	 * 统计模块
	 */
	@RequestMapping("/toStatisticInit")
	public String toStatisticInit(Model model) {
		Charts chart = this.statisticService.getChartInfo();
		model.addAttribute("typeName", MyUtils.getData(chart.getTypeName()));
		model.addAttribute("allNumber", MyUtils.getAllNum(chart.getTypeName(),chart.getAllNumber(),6));
		model.addAttribute("academyName", MyUtils.getData(chart.getAcademyName()));
		model.addAttribute("yearName", MyUtils.getData(chart.getYearName()));
		model.addAttribute("thCateName",MyUtils.getData(chart.getThCate()));
		model.addAttribute("paCateName",MyUtils.getData(chart.getPaCate()));
		model.addAttribute("prCateName",MyUtils.getData(chart.getPrCate()));
		model.addAttribute("proCateName",MyUtils.getData(chart.getProCate()));
		model.addAttribute("boCateName",MyUtils.getData(chart.getBoCate()));
		model.addAttribute("SexName",MyUtils.getData(chart.getSex()));
		model.addAttribute("AgeName",MyUtils.getData(chart.getAge()));
		
		model.addAttribute("SexNanNumber", chart.getSexNanNumber());
		model.addAttribute("SexNvNumber", chart.getSexNvNumber());
		
		model.addAttribute("academy1", chart.getAcademy1());
		model.addAttribute("academy2", chart.getAcademy2());
		model.addAttribute("academy3", chart.getAcademy3());
		model.addAttribute("academy4", chart.getAcademy4());
		model.addAttribute("academy5", chart.getAcademy5());
		model.addAttribute("academy6", chart.getAcademy6());
		
		model.addAttribute("thYear", chart.getThYear());
		model.addAttribute("paYear", chart.getPaYear());
		model.addAttribute("prYear", chart.getPrYear());
		model.addAttribute("proYear", chart.getProYear());
		model.addAttribute("boYear", chart.getBoYear());
		model.addAttribute("raYear", chart.getRaYear());
		
		model.addAttribute("thCateNum",  MyUtils.getAllNum(chart.getThCate(),chart.getThCateNum(),4));
		
		model.addAttribute("paCateNum",  MyUtils.getAllNum(chart.getPaCate(),chart.getPaCateNum(),4));
		
		model.addAttribute("prCateNum",  MyUtils.getAllNum(chart.getPrCate(),chart.getPrCateNum(),3));
		
		model.addAttribute("proCateNum",  MyUtils.getAllNum(chart.getProCate(),chart.getProCateNum(),4));
		model.addAttribute("proMoney",  MyUtils.getAllNum(chart.getPrMoney(),chart.getPrMoneyNum(),3));
		
		model.addAttribute("boCateNum",  MyUtils.getAllNum(chart.getBoCate(),chart.getBoCateNum(),4));
		model.addAttribute("boFant",  MyUtils.getAllNum(chart.getBoFont(),chart.getBoFontNum(),3));
		
		model.addAttribute("raCateName",MyUtils.getData(chart.getRaCate()));
		model.addAttribute("raCateNum",  MyUtils.getAllNum(chart.getRaCate(),chart.getRaCateNum(),4));
		
		model.addAttribute("SexNameNum", MyUtils.getAllNum(chart.getSex(),chart.getSexNum(),2));
		model.addAttribute("AgeNameNum", MyUtils.getAllNum(chart.getAge(),chart.getAgeNum(),5));
		return "admin/st_all";
	}
	
	/**
	 * 归纳信息模块
	 * 
	 */
	@RequestMapping("/getCountDataInit")
	public String getCountDataInit(Model model) {
		model.addAttribute("flog", "none");
		return "admin/st_gui";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/GuiNaThesis")
	public void GuiNaThesis(@RequestParam("flg") String flg, @RequestParam("xuyuan") String xuyuan,
			@RequestParam("sex") String sex, @RequestParam("duty") String duty, @RequestParam("bigAge") String bigAge,
			@RequestParam("smlAge") String smlAge, @RequestParam("major") String major,
			@RequestParam("bigThda") String bigThda, @RequestParam("smlThda") String smlThda,
			@RequestParam("thCate") String thCate, @RequestParam("thle") String thle,
			@RequestParam("thIsCl") String thIsCl, @RequestParam("bigThUp") String bigThUp,
			@RequestParam("smlThUp") String smlThUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String str;
		logger.info("begin++" + flg);
		Map<String, Object> map = this.thesisService.GuiNaThesis(flg, xuyuan, sex, duty, bigAge, smlAge, major, bigThda,
				smlThda, thCate, thle, thIsCl, bigThUp, smlThUp);
		if (!map.isEmpty()) {
			if (map.get("flg").equals(null)) {
				str = "没有满足归纳条件的信息！";
			} else {
				this.setThesisList((List<Thesis>) map.get("list"));
				try {
					request.getRequestDispatcher("/CountData/getPage?flog=thesis").forward(request, response);
				} catch (ServletException | IOException e) {
					logger.error("GuiNaThesis_getRequestDispatcher_error");
					e.printStackTrace();
				}
				str = "归纳信息成功！";
			}
		} else {
			str = "归纳信息失败，请重试！";
		}
		logger.info("end++" + str);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/GuiNaPatent")
	@ResponseBody
	public void GuiNaPatent(@RequestParam("flg") String flg, @RequestParam("xuyuan") String xuyuan,
			@RequestParam("sex") String sex, @RequestParam("duty") String duty, @RequestParam("bigAge") String bigAge,
			@RequestParam("smlAge") String smlAge, @RequestParam("major") String major,
			@RequestParam("PaCate") String PaCate, @RequestParam("bigPada") String bigPada,
			@RequestParam("smlPada") String smlPada, @RequestParam("bigPaUp") String bigPaUp,
			@RequestParam("smlPaUp") String smlPaUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String str;
		logger.info("begin++" + flg);
		Map<String, Object> map = this.patentService.GuiNaPatent(flg, xuyuan, sex, duty, bigAge, smlAge, major, PaCate,
				bigPada, smlPada, bigPaUp, smlPaUp);
		if (!map.isEmpty()) {
			if (map.get("flg").equals(null)) {
				str = "没有满足归纳条件的信息！";
			} else {
				this.setPatentList((List<Patent>) map.get("list"));
				try {
					request.getRequestDispatcher("/CountData/getPage?flog=patent").forward(request, response);
				} catch (ServletException | IOException e) {
					logger.error("GuiNaPatent_getRequestDispatcher_error");
					e.printStackTrace();
				}
				str = "归纳信息成功！";
			}
		} else {
			str = "归纳信息失败，请重试！";
		}
		logger.info("end++" + str);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/GuiNaPraise")
	@ResponseBody
	public void GuiNaPraise(@RequestParam("flg") String flg, @RequestParam("xuyuan") String xuyuan,
			@RequestParam("sex") String sex, @RequestParam("duty") String duty, @RequestParam("bigAge") String bigAge,
			@RequestParam("smlAge") String smlAge, @RequestParam("major") String major,
			@RequestParam("PrCate") String PrCate, @RequestParam("bigPrda") String bigPrda,
			@RequestParam("smlPrda") String smlPrda, @RequestParam("bigPrUp") String bigPrUp,
			@RequestParam("smlPrUp") String smlPrUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String str;
		logger.info("begin++" + flg);
		Map<String, Object> map = this.praiseService.GuiNaPraise(flg, xuyuan, sex, duty, bigAge, smlAge, major, PrCate,
				bigPrda, smlPrda, bigPrUp, smlPrUp);
		if (!map.isEmpty()) {
			if (map.get("flg").equals(null)) {
				str = "没有满足归纳条件的信息！";
			} else {
				this.setPraiseList((List<Praise>) map.get("list"));
				try {
					request.getRequestDispatcher("/CountData/getPage?flog=praise").forward(request, response);
				} catch (ServletException | IOException e) {
					logger.error("GuiNaPraise_getRequestDispatcher_error");
					e.printStackTrace();
				}
				str = "归纳信息成功！";
			}
		} else {
			str = "归纳信息失败，请重试！";
		}
		logger.info("end++" + str);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/GuiNaProject")
	@ResponseBody
	public void GuiNaProject(@RequestParam("flg") String flg, @RequestParam("xuyuan") String xuyuan,
			@RequestParam("sex") String sex, @RequestParam("duty") String duty, @RequestParam("bigAge") String bigAge,
			@RequestParam("smlAge") String smlAge, @RequestParam("major") String major,
			@RequestParam("ProCate") String ProCate, @RequestParam("bigProda") String bigProda,
			@RequestParam("smlProda") String smlProda, @RequestParam("bigMoney") String bigMoney,
			@RequestParam("smlMoney") String smlMoney, @RequestParam("bigProUp") String bigProUp,
			@RequestParam("smlProUp") String smlProUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String str;
		logger.info("begin++" + flg);
		Map<String, Object> map = this.projectService.GuiNaProject(flg, xuyuan, sex, duty, bigAge, smlAge, major,
				ProCate, bigProda, smlProda, bigMoney, smlMoney, bigProUp, smlProUp);
		if (!map.isEmpty()) {
			if (map.get("flg").equals(null)) {
				str = "没有满足归纳条件的信息！";
			} else {
				this.setProjectList((List<Project>) map.get("list"));
				try {
					request.getRequestDispatcher("/CountData/getPage?flog=project").forward(request, response);
				} catch (ServletException | IOException e) {
					logger.error("GuiNaProject_getRequestDispatcher_error");
					e.printStackTrace();
				}
				str = "归纳信息成功！";
			}
		} else {
			str = "归纳信息失败，请重试！";
		}
		logger.info("end++" + str);
	}
    /**
     * 归纳教材
     * @param flg
     * @param xuyuan
     * @param sex
     * @param duty
     * @param bigAge
     * @param smlAge
     * @param major
     * @param BoCate
     * @param bigBoda
     * @param smlBoda
     * @param bigFont
     * @param smlFont
     * @param bigBoUp
     * @param smlBoUp
     * @param model
     * @param request
     * @param response
     */
	@SuppressWarnings("unchecked")
	@RequestMapping("/GuiNaBook")
	@ResponseBody
	public void GuiNaBook(@RequestParam("flg") String flg, @RequestParam("xuyuan") String xuyuan,
			@RequestParam("sex") String sex, @RequestParam("duty") String duty, @RequestParam("bigAge") String bigAge,
			@RequestParam("smlAge") String smlAge, @RequestParam("major") String major,
			@RequestParam("BoCate") String BoCate, @RequestParam("bigBoda") String bigBoda,
			@RequestParam("smlBoda") String smlBoda, @RequestParam("bigFont") String bigFont,
			@RequestParam("smlFont") String smlFont, @RequestParam("bigBoUp") String bigBoUp,
			@RequestParam("smlBoUp") String smlBoUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String str;
		logger.info("begin++" + flg);
		Map<String, Object> map = this.bookService.GuiNaBook(flg, xuyuan, sex, duty, bigAge, smlAge, major, BoCate,
				bigBoda, smlBoda, bigFont, smlFont, bigBoUp, smlBoUp);
		if (!map.isEmpty()) {
			if (map.get("flg").equals(null)) {
				str = "没有满足归纳条件的信息！";
			} else {
				this.setBookList((List<Book>) map.get("list"));
				try {
					request.getRequestDispatcher("/CountData/getPage?flog=book").forward(request, response);
				} catch (ServletException | IOException e) {
					logger.error("GuiNaBook_getRequestDispatcher_error");
					e.printStackTrace();
				}
				str = "归纳信息成功！";
			}
		} else {
			str = "归纳信息失败，请重试！";
		}
		logger.info("end++" + str);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/GuiNaRace")
	@ResponseBody
	public void GuiNaRace(@RequestParam("flg") String flg, @RequestParam("xuyuan") String xuyuan,
			@RequestParam("sex") String sex, @RequestParam("duty") String duty, @RequestParam("bigAge") String bigAge,
			@RequestParam("smlAge") String smlAge, @RequestParam("major") String major,
			@RequestParam("RaCate") String RaCate, @RequestParam("RaTuan") String RaTuan,
			@RequestParam("bigRada") String bigRada, @RequestParam("smlRada") String smlRada,
			@RequestParam("bigRaUp") String bigRaUp, @RequestParam("smlRaUp") String smlRaUp, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		String str;
		logger.info("begin++" + flg);
		Map<String, Object> map = this.raceservice.GuiNaRace(flg, xuyuan, sex, duty, bigAge, smlAge, major, RaCate,
				RaTuan, bigRada, smlRada, bigRaUp, smlRaUp);
		if (!map.isEmpty()) {
			if (map.get("flg").equals(null)) {
				str = "没有满足归纳条件的信息！";
			} else {
				this.setRaceList((List<Race>) map.get("list"));
				try {
					request.getRequestDispatcher("/CountData/getPage?flog=race").forward(request, response);
				} catch (ServletException | IOException e) {
					logger.error("GuiNaRace_getRequestDispatcher_error");
					e.printStackTrace();
				}
				str = "归纳信息成功！";
			}
		} else {
			str = "归纳信息失败，请重试！";
		}
		logger.info("end++" + str);
	}

	@RequestMapping("/getPage")
	public String getPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, @RequestParam("flog") String flog,
			Model model) {

		logger.info("getPage++" + flog + "++" + pageSize + "++" + pa);
		if ("thesis".equals(flog)) {
			PageUtil<Thesis> page = new PageUtil<Thesis>(this.getThesisList(), pa, pageSize);
			model.addAttribute("ThesisList", page.getPagedList());
			model.addAttribute("ps", pageSize);
			model.addAttribute("page", page);
			model.addAttribute("flog", "thesis");
		} else if ("patent".equals(flog)) {
			PageUtil<Patent> page = new PageUtil<Patent>(this.getPatentList(), pa, pageSize);
			model.addAttribute("PatentList", page.getPagedList());
			model.addAttribute("ps", pageSize);
			model.addAttribute("page", page);
			model.addAttribute("flog", "patent");
		} else if ("praise".equals(flog)) {
			PageUtil<Praise> page = new PageUtil<Praise>(this.getPraiseList(), pa, pageSize);
			model.addAttribute("PraiseList", page.getPagedList());
			model.addAttribute("ps", pageSize);
			model.addAttribute("page", page);
			model.addAttribute("flog", "praise");
		} else if ("project".equals(flog)) {
			PageUtil<Project> page = new PageUtil<Project>(this.getProjectList(), pa, pageSize);
			model.addAttribute("ProjectList", page.getPagedList());
			model.addAttribute("ps", pageSize);
			model.addAttribute("page", page);
			model.addAttribute("flog", "project");
		} else if ("book".equals(flog)) {
			PageUtil<Book> page = new PageUtil<Book>(this.getBookList(), pa, pageSize);
			model.addAttribute("BookList", page.getPagedList());
			model.addAttribute("ps", pageSize);
			model.addAttribute("page", page);
			model.addAttribute("flog", "book");
		} else if ("race".equals(flog)) {
			PageUtil<Race> page = new PageUtil<Race>(this.getRaceList(), pa, pageSize);
			model.addAttribute("RaceList", page.getPagedList());
			model.addAttribute("ps", pageSize);
			model.addAttribute("page", page);
			model.addAttribute("flog", "race");
		} else {
			logger.warn("无此选项！");
		}
		return "admin/st_gui";
	}

	@RequestMapping("/downloadGuiNaExcl")
	public ResponseEntity<byte[]> downloadGuiNaExcl(@RequestParam("type") String type, HttpSession session) {

		logger.info("downloadGuiNaExcl+" + type);
		HttpHeaders headers = new HttpHeaders();
		String FileName = type + "Excl" + ".xls";
		try {
			FileName = new String(FileName.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			logger.error("downloadGuiNaExcl_error");
		}
		headers.setContentDispositionFormData("attachment", FileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		ResponseEntity<byte[]> entity = null;
		try {
			File file = null;
			switch (type) {
			case "thesis":
				file = this.downloadService.getGuiNaWorkBookStreamTh(type, this.getThesisList(), session);
				break;
			case "patent":
				file = this.downloadService.getGuiNaWorkBookStreamPa(type, this.getPatentList(), session);
				break;
			case "praise":
				file = this.downloadService.getGuiNaWorkBookStreamPr(type, this.getPraiseList(), session);
				break;
			case "project":
				file = this.downloadService.getGuiNaWorkBookStreamPro(type, this.getProjectList(), session);
				break;
			case "book":
				file = this.downloadService.getGuiNaWorkBookStreamBo(type, this.getBookList(), session);
				break;
			case "race":
				file = this.downloadService.getGuiNaWorkBookStreamRa(type, this.getRaceList(), session);
				break;
			default:
				break;
			}
			entity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadGuiNaExcl_ResponseEntity_error");
		}
		return entity;
	}

	/**
	 * 下载归纳信息文件
	 * 
	 * @param type
	 * @param session
	 * @return
	 */
	@RequestMapping("/downloadGuiNaFile")
	public ResponseEntity<byte[]> downloadGuiNaFile(@RequestParam("type") String type, HttpSession session) {

		logger.info("downloadGuiNaFile+" + type);
		HttpHeaders headers = new HttpHeaders();
		String FileName = type + "Excl" + ".xls";
		try {
			FileName = new String(FileName.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			logger.error("downloadGuiNaFile_error");
		}
		headers.setContentDispositionFormData("attachment", FileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		ResponseEntity<byte[]> entity = null;
		try {
			File file = null;
			switch (type) {
			case "thesis":
				file = this.downloadService.getGuiNaWorkBookStreamTh(type, this.getThesisList(), session);
				break;
			case "patent":
				file = this.downloadService.getGuiNaWorkBookStreamPa(type, this.getPatentList(), session);
				break;
			case "praise":
				file = this.downloadService.getGuiNaWorkBookStreamPr(type, this.getPraiseList(), session);
				break;
			case "project":
				file = this.downloadService.getGuiNaWorkBookStreamPro(type, this.getProjectList(), session);
				break;
			case "book":
				this.downloadService.getGuiNaWorkBookStreamBo(type, this.getBookList(), session);
				break;
			case "race":
				this.downloadService.getGuiNaWorkBookStreamRa(type, this.getRaceList(), session);
				break;
			default:
				break;
			}
			entity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadGuiNaFile_ResponseEntity_error");
		}
		return entity;
	}

	public List<Thesis> getThesisList() {
		return ThesisList;
	}

	public void setThesisList(List<Thesis> thesisList) {
		ThesisList = thesisList;
	}

	public List<Patent> getPatentList() {
		return PatentList;
	}

	public void setPatentList(List<Patent> patentList) {
		PatentList = patentList;
	}

	public List<Praise> getPraiseList() {
		return PraiseList;
	}

	public void setPraiseList(List<Praise> praiseList) {
		PraiseList = praiseList;
	}

	public List<Project> getProjectList() {
		return ProjectList;
	}

	public void setProjectList(List<Project> projectList) {
		ProjectList = projectList;
	}

	public List<Book> getBookList() {
		return BookList;
	}

	public void setBookList(List<Book> bookList) {
		BookList = bookList;
	}

	public List<Race> getRaceList() {
		return RaceList;
	}

	public void setRaceList(List<Race> raceList) {
		RaceList = raceList;
	}
}

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
import com.sust.entity.Book;
import com.sust.entity.Login;
import com.sust.other.PageUtil;
import com.sust.service.BookService;
import com.sust.service.DownloadService;

@Controller
@RequestMapping("/book")
public class BookController {

	private static final Log logger = LogFactory.getLog(BookController.class);
	@Resource
	private BookService bookService;
	@Resource
	private DownloadService downloadService;
	private List<Book> BookList = null;


	@RequestMapping("/getUserBoList")
	private String getUserBoList(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("getUserBoList++" + usId);
		PageHelper.startPage(pa, pageSize);
		List<Book> list = bookService.getUserBoList(usId);
		PageInfo<Book> page = new PageInfo<Book>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("BookList", list);
		return "users/book";
	}

	@RequestMapping(value = "/getBoInfo")
	@ResponseBody
	public Book getBoInfo(@RequestParam("boId") int boId) {

		logger.info("getBoInfo++" + boId);
		return this.bookService.getBoInfoByboId(boId);
	}

	@RequestMapping(value = "/DeleteBoInfo", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo DeletePaInfo(@RequestParam("deId") int deId, @RequestParam("fg") String fg, HttpSession session) {

		logger.info("DeleteBoInfo++" + deId + "++" + fg);
		return new AllInfo(this.bookService.DeleteBoInfoById(deId, fg, "book", session));
	}

	@RequestMapping(value = "/addBoInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo addBoInfo(@RequestParam("usId") Integer usId, @RequestParam("boName") String boName,
			@RequestParam("boCategory") String boCategory, @RequestParam("boDate") String boDate,
			@RequestParam("boEditor") String boEditor, @RequestParam("boEditor2") String boEditor2,
			@RequestParam("boFont") Integer boFont, @RequestParam("boPublish") String boPublish,
			@RequestParam("boAbout") String boAbout) throws ParseException {

		logger.info("addBoInfo++" + usId + "++" + boName + "++" + boCategory + "++" + boDate + "++" + boEditor + "++"
				+ boEditor2 + "++" + boFont + "++" + boPublish + "++" + boAbout);
		try {
			this.bookService.addBoInfo(
					new Book(usId, boName, boCategory, (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(boDate)),
							boEditor, boEditor2, boFont, boPublish, boAbout, new Date()));
		} catch (Exception e) {
			return new AllInfo("添加失败，请重试！");
		}
		return new AllInfo("添加成功");
	}

	@RequestMapping(value = "/upBoInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo upBoInfo(@RequestParam("boId") Integer boId, @RequestParam("usId") Integer usId,
			@RequestParam("boName") String boName, @RequestParam("boCategory") String boCategory,
			@RequestParam("boDate") String boDate, @RequestParam("boEditor") String boEditor,
			@RequestParam("boEditor2") String boEditor2, @RequestParam("boFont") Integer boFont,
			@RequestParam("boPublish") String boPublish, @RequestParam("boAbout") String boAbout)
					throws ParseException {

		logger.info("upBoInfo++" + usId + "++" + boId + "++" + boName + "++" + boCategory + "++" + boDate + "++"
				+ boEditor + "++" + boEditor2 + "++" + boFont + "++" + boPublish + "++" + boAbout);
		try {
			this.bookService.upBoInfo(
					new Book(boId, usId, boName, boCategory, (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(boDate)),
							boEditor, boEditor2, boFont, boPublish, boAbout, new Date()));
		} catch (Exception e) {
			return new AllInfo("信息更新失败，请重试！");
		}
		return new AllInfo("信息更新成功");
	}
	
	@RequestMapping(value = "/findUserBookInfo", method = RequestMethod.GET)
	private void findUserBookInfo(@RequestParam("date8") String bigThda, @RequestParam("Cdate8") String smlThda,
			@RequestParam("BoCate") String BoCate, @RequestParam("bigFont") String bigFont,
			@RequestParam("smlFont") String smlFont, @RequestParam("date9") String bigThUp,
			@RequestParam("Cdate9") String smlThUp, Model model, HttpServletRequest request,HttpSession session,
			HttpServletResponse response) {

		logger.info("findUserBookInfo++" + bigThda + "++" + BoCate);
		this.setBookList(this.bookService.findUserBookInfo(((Login)session.getAttribute("login")).getUsId(),bigThda, smlThda, BoCate, bigFont,smlFont, bigThUp, smlThUp));
		try {
			request.getRequestDispatcher("/book/getUserPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findBookInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getUserPage")
	public String getUserPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getUserPage++" + pageSize + "++" + pa);
		if (this.getBookList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Book> page1 = new PageUtil<Book>(this.getBookList(), pa, pageSize);
			model.addAttribute("BoList", page1.getPagedList());
			/*for (Book thesis : page1.getPagedList()) {
				System.out.println(thesis.toString());
			}*/
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "users/book";
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
					FileUtils.readFileToByteArray(this.downloadService.getGuiNaWorkBookStreamBo("book", this.getBookList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadUserFind_ResponseEntity_error");
		}
		return entity;
	}

	/**
	 * admin数据处理
	 */
	@RequestMapping("/getAllBoList")
	private String getAllBoList(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {

		logger.info("getAllBoList++" + pageSize + "++" + pa);
		PageHelper.startPage(pa, pageSize);
		List<Book> list = bookService.getAllBoList();
		PageInfo<Book> page = new PageInfo<Book>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("BookList", list);
		return "admin/ad_book";
	}
	
	@RequestMapping(value = "/findBookInfo", method = RequestMethod.GET)
	private void findBookInfo(@RequestParam("date8") String bigThda, @RequestParam("Cdate8") String smlThda,
			@RequestParam("BoCate") String BoCate, @RequestParam("bigFont") String bigFont,
			@RequestParam("smlFont") String smlFont, @RequestParam("date9") String bigThUp,
			@RequestParam("Cdate9") String smlThUp, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		logger.info("findBookInfo++" + bigThda + "++" + BoCate);
		this.setBookList(this.bookService.findBoInfo(bigThda, smlThda, BoCate, bigFont,smlFont, bigThUp, smlThUp));
		try {
			request.getRequestDispatcher("/book/getPage").forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("findBookInfo_getRequestDispatcher_error");
			e.printStackTrace();
		}
	}

	@RequestMapping("/getPage")
	public String getPage(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {

		logger.info("getPage++" + pageSize + "++" + pa);
		if (this.getBookList().size() > 0) {
			model.addAttribute("isFind", "yes");
			PageUtil<Book> page1 = new PageUtil<Book>(this.getBookList(), pa, pageSize);
			model.addAttribute("BoList", page1.getPagedList());
			/*for (Book thesis : page1.getPagedList()) {
				System.out.println(thesis.toString());
			}*/
			model.addAttribute("ps1", pageSize);
			model.addAttribute("page1", page1);
		} else {
			model.addAttribute("isFind", "no");
		}
		model.addAttribute("isShow", "yes");
		return "admin/ad_book";
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
					FileUtils.readFileToByteArray(this.downloadService.getGuiNaWorkBookStreamBo("book", this.getBookList(), session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadFind_ResponseEntity_error");
		}
		return entity;
	}

	public List<Book> getBookList() {
		return BookList;
	}

	public void setBookList(List<Book> bookList) {
		BookList = bookList;
	}
}

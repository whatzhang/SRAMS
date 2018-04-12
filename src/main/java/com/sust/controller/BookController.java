package com.sust.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

import com.sust.entity.AllInfo;
import com.sust.entity.Book;
import com.sust.entity.Login;
import com.sust.service.BookService;


@Controller
@RequestMapping("/book")
public class BookController {

	private static final Log logger = LogFactory.getLog(BookController.class);
	@Resource
	private BookService bookService;
	
	@RequestMapping("/getUserBoList")
	private String getUserBoList(Model model, HttpSession session){
		
		Integer usId = ((Login)session.getAttribute("login")).getUsId();
		logger.info("getUserBoList++"+usId);
		model.addAttribute("BookList", bookService.getUserBoList(usId)); 
		return  "users/book";
	}
	
	@RequestMapping(value="/getBoInfo")
	@ResponseBody
	public Book getBoInfo(@RequestParam("boId") int boId){
		
		logger.info("getBoInfo++"+boId);
		return  this.bookService.getBoInfoByboId(boId);
	}
	
	@RequestMapping(value="/DeletePaInfo" , method = RequestMethod.POST)
	@ResponseBody
	public AllInfo DeletePaInfo(@RequestParam("boId") int boId){
		
		logger.info("DeleteBoInfo++"+boId);
		return  new AllInfo(String.valueOf(this.bookService.DeleteBoInfoById(boId)));
	}
	
	@RequestMapping(value="/addBoInfo" , method = RequestMethod.GET)
	@ResponseBody
	public AllInfo addBoInfo( @RequestParam("usId") Integer usId, 
            				  @RequestParam("boName") String boName, 
            				  @RequestParam("boCategory") String boCategory,
            				  @RequestParam("boDate") String boDate, 
            				  @RequestParam("boEditor") String boEditor, 
            				  @RequestParam("boEditor2") String boEditor2, 
            				  @RequestParam("boFont") Integer boFont,
            				  @RequestParam("boPublish") String boPublish, 
            				  @RequestParam("boAbout") String boAbout) throws ParseException{
		
		logger.info("addBoInfo++"+usId+"++"+boName+"++"+boCategory+"++"+boDate+"++"+boEditor+"++"+boEditor2+"++"+boFont+"++"+boPublish+"++"+boAbout);
		int re = this.bookService.addBoInfo(new Book(usId, boName, boCategory,(Date)(new SimpleDateFormat("yyyy-MM-dd").parse(boDate)), boEditor, boEditor2, boFont,
				boPublish, boAbout, new Date(System.currentTimeMillis())));
		return  new AllInfo(String.valueOf(re));
	}
	
	@RequestMapping(value="/upBoInfo" , method = RequestMethod.GET)
	@ResponseBody
	public AllInfo upBoInfo(@RequestParam("boId") Integer boId, 
			                @RequestParam("usId") Integer usId, 
			                @RequestParam("boName") String boName, 
			                @RequestParam("boCategory") String boCategory,
			                @RequestParam("boDate") String boDate, 
			                @RequestParam("boEditor") String boEditor, 
			                @RequestParam("boEditor2") String boEditor2, 
			                @RequestParam("boFont") Integer boFont,
			                @RequestParam("boPublish") String boPublish, 
			                @RequestParam("boAbout") String boAbout) throws ParseException{
		
		logger.info("upBoInfo++"+usId+"++"+boId+"++"+boName+"++"+boCategory+"++"+boDate+"++"+boEditor+"++"+boEditor2+"++"+boFont+"++"+boPublish+"++"+boAbout);
		int re = this.bookService.upBoInfo(new Book(boId, usId, boName, boCategory,(Date)(new SimpleDateFormat("yyyy-MM-dd").parse(boDate)), boEditor, boEditor2, boFont,
				boPublish, boAbout, new Date(System.currentTimeMillis())));
		return  new AllInfo(String.valueOf(re));
	}
}

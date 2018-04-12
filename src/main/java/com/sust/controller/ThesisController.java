package com.sust.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.sust.entity.Login;
import com.sust.entity.Thesis;
import com.sust.service.ThesisService;

@Controller
@RequestMapping("/thesis")
public class ThesisController{
	
	private static final Log logger = LogFactory.getLog(ThesisController.class);
	@Resource
	private ThesisService thesisService;
	

	@RequestMapping(value = "/getThInfo")
	private String getThesisInfo(Model model, HttpServletRequest request){
		
		Integer usId = ((Login)request.getSession().getAttribute("login")).getUsId();
		logger.info("getThesisInfo++"+usId);
		List<Thesis> thList = this.thesisService.getThesisInfo(usId);
		model.addAttribute("list", thList);
		return  "users/thesis";
	}
	
	@RequestMapping(value="/getShowInfo" , method = RequestMethod.POST)
	@ResponseBody
	public Thesis getShowInfo(@RequestParam("thId") int id){
		
		logger.info("getShowInfo++"+id);
		return  this.thesisService.getThInfoByThid(id);
	}
	
	@RequestMapping(value = "/DeleteThInfo", method = RequestMethod.POST)
	@ResponseBody
	private Map<String,String> DeleteThInfo(@RequestParam("deId") int deId){
		
		logger.info("DeleteThInfo++"+deId);
		int sta = this.thesisService.deleteThesisById(deId);
		Map<String,String> result = new HashMap<String, String>();  
		result.put("status", String.valueOf(sta));
	    result.put("info", "删除论文信息成功！");  
	    result.put("urlNext", "/thesis/getThInfo");  
		return  result;
	}
	
	@RequestMapping(value="/getThInfoUp" , method = RequestMethod.POST)
	@ResponseBody
	private Thesis getThInfoUp(@RequestParam("upId") int upId){
		
		logger.info("getThInfoUp++"+upId);
		return  this.thesisService.getThInfoByThid(upId);
	}
	
	@RequestMapping(value="/addThesisInfo" , method = RequestMethod.GET)
	@ResponseBody
	public Map<String,String> addThesisInfo(@RequestParam("usId") int usId,
		                    	@RequestParam("thName") String thName,
			                    @RequestParam("thCate") String thCate,
			                    @RequestParam("Cdate") String Cdate,
			                    @RequestParam("thLevel") String thLevel,
			                    @RequestParam("thfactor") String thfactor,
			                    @RequestParam("thIscloud") String thIscloud,
			                    @RequestParam("thNum") String thNum,
			                    @RequestParam("thJour") String thJour,
			                    @RequestParam("thPage") String thPage,
			                    @RequestParam("thAbout") String thAbout) throws ParseException{
		
		logger.info("addThesisInfo++"+usId+"++"+thName+"++"+ thName + "++" + thCate + "++" + Cdate + "++" + thLevel + "++" + thfactor + "++" + thIscloud + "++" + thNum + "++" + thJour + "++" + thPage + "++" + thAbout);
		int sta = this.thesisService.addThesis(new Thesis(usId, thName, thCate,
				thesisService.getUserNameById(usId), (Date)(new SimpleDateFormat("yyyy-MM-dd").parse(Cdate)), thLevel, thfactor,
				thIscloud, thNum, thJour,
				thPage, thAbout, new Date(System.currentTimeMillis())));
		Map<String,String> result = new HashMap<String, String>();  
		result.put("status", String.valueOf(sta));
	    result.put("info", "添加论文信息成功！");  
	    result.put("urlNext", "/thesis/getThInfo");  
		return  result;
	}
	
	@RequestMapping(value="/updateThInfo" , method = RequestMethod.GET)
	@ResponseBody
	public Map<String,String> updateThInfo(@RequestParam("usId") int usId,
							   @RequestParam("thId") int thId,
					           @RequestParam("thName") String thName,
					           @RequestParam("thCate") String thCate,
					           @RequestParam("Cdate") String Cdate,
					           @RequestParam("thLevel") String thLevel,
					           @RequestParam("thfactor") String thfactor,
					           @RequestParam("thIscloud") String thIscloud,
					           @RequestParam("thNum") String thNum,
					           @RequestParam("thJour") String thJour,
					           @RequestParam("thPage") String thPage,
					           @RequestParam("thAbout") String thAbout) throws ParseException{
		
		logger.info("updateThInfo++"+usId+"++"+thId+"++"+thName+"++"+ thName + "++" + thCate + "++" + Cdate + "++" + thLevel + "++" + thfactor + "++" + thIscloud + "++" + thNum + "++" + thJour + "++" + thPage + "++" + thAbout);
		int sta = this.thesisService.upThesisInfo(new Thesis(thId, usId, thName, thCate,
				thesisService.getUserNameById(usId), (Date)(new SimpleDateFormat("yyyy-MM-dd").parse(Cdate)), thLevel, thfactor,
				thIscloud, thNum, thJour,
				thPage, thAbout, new Date(System.currentTimeMillis())));
		Map<String,String> result = new HashMap<String, String>();  
		result.put("status", String.valueOf(sta));
	    result.put("info", "修改论文信息成功！");  
	    result.put("urlNext", "/thesis/getThInfo");  
		return  result;
	}
	
}

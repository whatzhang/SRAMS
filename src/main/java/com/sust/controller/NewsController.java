package com.sust.controller;

import java.util.List;

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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sust.entity.AllInfo;
import com.sust.entity.Login;
import com.sust.entity.Message;
import com.sust.service.MeStatusService;
import com.sust.service.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController {

	private static final Log logger = LogFactory.getLog(NewsController.class);

	@Resource
	private NewsService newsservice;
	@Resource
	private MeStatusService meStatusService;

	@RequestMapping("/getUserNews")
	private String getThesisInfo(Model model, HttpServletRequest request) {

		Integer usId = ((Login) request.getSession().getAttribute("login")).getUsId();
		logger.info("getThesisInfo++" + usId);
		model.addAttribute("DelMe", newsservice.getUserMeDel(usId));
		model.addAttribute("ReadMe", newsservice.getUserMeRead(usId));
		model.addAttribute("NoReadMe", newsservice.getUserMeNoRead(usId));
		return "users/news";
	}

	@RequestMapping(value = "/getNewsById", method = RequestMethod.POST)
	@ResponseBody
	public Message getNewsById(@RequestParam("meId") int id) {

		logger.info("getNewsById++" + id);
		return this.newsservice.getNewsById(id);
	}

	@RequestMapping(value = "/getUserNameById", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo getUserNameById(@RequestParam("usId") int id) {

		logger.info("getUserNameById++" + id + "++" + this.newsservice.getUserNameById(id));
		return new AllInfo(this.newsservice.getUserNameById(id));
	}

	@RequestMapping(value = "/setRead", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo setRead(@RequestParam("meId") int meId, HttpSession session) {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("setRead++" + meId + "++" + usId);
		return new AllInfo(this.meStatusService.setReadStatus(meId, usId));
	}

	@RequestMapping(value = "/setNoRead", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo setNoRead(@RequestParam("meId") int meId, HttpSession session) {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("setNoRead++" + meId + "++" + usId);
		return new AllInfo(this.meStatusService.setNoReadStatus(meId, usId));
	}

	@RequestMapping(value = "/setDel", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo setDel(@RequestParam("meId") int meId, HttpSession session) {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("setDel++" + meId + "++" + usId);
		return new AllInfo(this.meStatusService.setDelStatus(meId, usId));
	}

	@RequestMapping(value = "/deleteReadNews", method = RequestMethod.POST)
	@ResponseBody
	private AllInfo deleteReadNews(HttpSession session) {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("deleteReadNews++" + usId);
		return new AllInfo(this.newsservice.deleteReadNews(usId));
	}
	/**
	 * admin消息处理 
	 */
	@RequestMapping("/getAdminNews")
	private String getAdminNews(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model) {
		
		PageHelper.startPage(pa, pageSize);
		List<Message> list = this.newsservice.getAllMessages();
		PageInfo<Message> page = new PageInfo<Message>(list);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("MeList", list);
		model.addAttribute("nowNews", this.newsservice.getNowMessages());
		return "admin/ad_newsInfo";
	}
	
	@RequestMapping(value = "/getReadNum", method = RequestMethod.POST)
	@ResponseBody
	private AllInfo getReadNum(@RequestParam("meId") int meId) {

		logger.info("getReadNum++" + meId);
		return new AllInfo(this.newsservice.getNoReadNum(meId),this.newsservice.getReadedNum(meId),this.newsservice.getDelNum(meId));
	}
	
	@RequestMapping(value = "/updataMessage", method = RequestMethod.POST)
	@ResponseBody
	private AllInfo getReadNum(@RequestParam("meId") Integer meId,
								@RequestParam("meTitle") String meTitle,
								@RequestParam("meSend") String meSend,
								@RequestParam("meReceive") String meReceive,
								@RequestParam("meDate") String meDate,
								@RequestParam("meAbout") String meAbout) {
		logger.info("updataMessage++" + meId+"++"+meTitle+"++"+meSend+"++"+meReceive+"++"+meDate+"++"+meAbout);
		return new AllInfo(this.newsservice.updataMessage(meId,meTitle,meSend,meReceive,meDate,meAbout));
	}
	
	@RequestMapping(value = "/deleteMessage", method = RequestMethod.POST)
	@ResponseBody
	private AllInfo getReadNum(@RequestParam("meId") Integer meId) {
		logger.info("deleteMessage++" + meId);
		return new AllInfo(this.newsservice.deleteMessage(meId));
	}
}

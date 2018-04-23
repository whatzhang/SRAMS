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
import com.sust.entity.Login;
import com.sust.entity.Users;
import com.sust.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {

	private static final Log logger = LogFactory.getLog(UserController.class);

	@Resource
	private UserService userService;

	@RequestMapping("/UserInfo")
	public String getUserInfo(@RequestParam(value = "type", required = false) String type, HttpSession session,
			Model model) {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("getUserInfo++" + usId + "++" + type);
		model.addAttribute("user", this.userService.getUserInfo(usId));
		model.addAttribute("type", type);
		return "users/userInfo";
	}

	@RequestMapping(value = "/upUserInfo", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo upUserInfo(@RequestParam("usName") String usName, @RequestParam("usAge") String usAge,
			@RequestParam("usSex") String usSex, @RequestParam("usBirthday") String usBirthday,
			@RequestParam("usNum") String usNum, @RequestParam("usDuty") String usDuty,
			@RequestParam("usMajor") String usMajor, @RequestParam("usAddress") String usAddress,
			@RequestParam("usMail") String usMail, @RequestParam("usPhone") String usPhone,
			@RequestParam("usAcademy") String usAcademy, @RequestParam("usQuestion1") String usQuestion1,
			@RequestParam("usKey1") String usKey1, @RequestParam("usQuestion1") String usQuestion2,
			@RequestParam("usKey1") String usKey2, HttpSession session) throws ParseException {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("upUserInfo++" + usId + "++" + usName + "++" + usAge + "++" + usSex + "++" + usBirthday + "++"
				+ usNum + "++" + usDuty + "++" + usMajor + "++" + usAddress + "++" + usMail + "++" + usPhone + "++"
				+ usAcademy + "++" + usQuestion1 + "++" + usKey1 + "++" + usQuestion2 + "++" + usKey2);
		int re = this.userService.upUserInfo(new Users(usId, usName, usAge, Byte.parseByte(usSex),
				(Date) (new SimpleDateFormat("yyyy-MM-dd").parse(usBirthday)), usNum, usDuty, usMajor, usAddress,
				usMail, usPhone, usAcademy, usQuestion1, usKey1, usQuestion2, usKey2));
		return new AllInfo(String.valueOf(re));
	}
}

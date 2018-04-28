package com.sust.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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

	@RequestMapping(value = "/getUsidByPartName", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getUsidByPartName(@RequestParam("Name") String usName) throws ParseException {

		logger.info("getUsidByPartName++" + usName);
		List<String> result = this.userService.getUsidByPartName(usName);
		for (int i = 0; i < result.size(); i++) {
			System.out.println(result.get(i));
		}
		return result;
	}
	
	@RequestMapping("/getAllUsersInfo")
	public String getAllUsersInfo(Model model) {

		PageHelper.startPage(1, 10);
		List<Users> usersList = this.userService.getAllUsersInfo();
		PageInfo<Users> page1 = new PageInfo<Users>(usersList);
		PageHelper.startPage(1, 10);
		List<Login> loginList = this.userService.getAllLoginInfo();
		PageInfo<Login> page = new PageInfo<Login>(loginList);
		model.addAttribute("usersList", usersList);
		model.addAttribute("loginList", loginList);
		model.addAttribute("ps", 10);
		model.addAttribute("ps1", 10);
		model.addAttribute("page", page);
		model.addAttribute("page1", page1);
		return "admin/ad_userInfo";
	}
	
	@RequestMapping("/getAllUsers")
	public String getAllUsers(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {

		PageHelper.startPage(1, 10);
		List<Login> loginList = this.userService.getAllLoginInfo();
		PageInfo<Login> page = new PageInfo<Login>(loginList);
		PageHelper.startPage(pa, pageSize);
		List<Users> usersList = this.userService.getAllUsersInfo();
		PageInfo<Users> page1 = new PageInfo<Users>(usersList);
		model.addAttribute("ps", 10);
		model.addAttribute("page", page);
		model.addAttribute("ps1", pageSize);
		model.addAttribute("page1", page1);
		model.addAttribute("usersList", usersList);
		model.addAttribute("loginList", loginList);
		return "admin/ad_userInfo";
	}
	
	@RequestMapping("/getAllLogin")
	public String getAllLogin(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "page", defaultValue = "1") Integer pa, Model model, HttpSession session) {

		PageHelper.startPage(1, 10);
		List<Users> usersList = this.userService.getAllUsersInfo();
		PageInfo<Users> page1 = new PageInfo<Users>(usersList);
		PageHelper.startPage(pa, pageSize);
		List<Login> loginList = this.userService.getAllLoginInfo();
		PageInfo<Login> page = new PageInfo<Login>(loginList);
		model.addAttribute("ps", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("ps1", 10);
		model.addAttribute("page1", page1);
		model.addAttribute("loginList", loginList);
		model.addAttribute("usersList", usersList);
		return "admin/ad_userInfo";
	}
	
	@RequestMapping(value = "/getUserInfoById", method = RequestMethod.POST)
	@ResponseBody
	public Users getUserInfoById(@RequestParam("usId") Integer usId) throws ParseException {

		logger.info("getUserInfoById++" + usId);
		return this.userService.getUserInfo(usId);
	}
	
	@RequestMapping(value = "/upUserInfoById", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo upUserInfoById(@RequestParam("usId") Integer usId,@RequestParam("usName") String usName, @RequestParam("usAge") String usAge,
			@RequestParam("usSex") String usSex, @RequestParam("usBirthday") String usBirthday,
			@RequestParam("usNum") String usNum, @RequestParam("usDuty") String usDuty,
			@RequestParam("usMajor") String usMajor, @RequestParam("usAddress") String usAddress,
			@RequestParam("usMail") String usMail, @RequestParam("usPhone") String usPhone,
			@RequestParam("usAcademy") String usAcademy, @RequestParam("usQuestion1") String usQuestion1,
			@RequestParam("usKey1") String usKey1, @RequestParam("usQuestion1") String usQuestion2,
			@RequestParam("usKey1") String usKey2, HttpSession session) throws ParseException {

		logger.info("upUserInfoById++" + usId + "++" + usName + "++" + usAge + "++" + usSex + "++" + usBirthday + "++"
				+ usNum + "++" + usDuty + "++" + usMajor + "++" + usAddress + "++" + usMail + "++" + usPhone + "++"
				+ usAcademy + "++" + usQuestion1 + "++" + usKey1 + "++" + usQuestion2 + "++" + usKey2);
		int re = this.userService.upUserInfo(new Users(usId, usName, usAge, Byte.parseByte(usSex),
				(Date) (new SimpleDateFormat("yyyy-MM-dd").parse(usBirthday)), usNum, usDuty, usMajor, usAddress,
				usMail, usPhone, usAcademy, usQuestion1, usKey1, usQuestion2, usKey2));
		return new AllInfo(String.valueOf(re));
	}
	
	@RequestMapping(value = "/addUserDataInfo", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo addUserDataInfo(@RequestParam("loName") String loName,@RequestParam("usName") String usName, @RequestParam("usAge") String usAge,
			@RequestParam("usSex") String usSex, @RequestParam("usBirthday") String usBirthday,
			@RequestParam("usNum") String usNum, @RequestParam("usDuty") String usDuty,
			@RequestParam("usMajor") String usMajor, @RequestParam("usAddress") String usAddress,
			@RequestParam("usMail") String usMail, @RequestParam("usPhone") String usPhone,
			@RequestParam("usAcademy") String usAcademy, @RequestParam("usQuestion1") String usQuestion1,
			@RequestParam("usKey1") String usKey1, @RequestParam("usQuestion1") String usQuestion2,
			@RequestParam("usKey1") String usKey2, HttpSession session) throws ParseException {

		logger.info("upUserInfoById++" + loName + "++" + usName + "++" + usAge + "++" + usSex + "++" + usBirthday + "++"
				+ usNum + "++" + usDuty + "++" + usMajor + "++" + usAddress + "++" + usMail + "++" + usPhone + "++"
				+ usAcademy + "++" + usQuestion1 + "++" + usKey1 + "++" + usQuestion2 + "++" + usKey2);
		String re =this.userService.addUserInfo(new Users(this.userService.getUsIdByName(loName), usName, usAge, Byte.parseByte(usSex),
				(Date) (new SimpleDateFormat("yyyy-MM-dd").parse(usBirthday)), usNum, usDuty, usMajor, usAddress,
				usMail, usPhone, usAcademy, usQuestion1, usKey1, usQuestion2, usKey2));
		return new AllInfo(re);
	}
	
	@RequestMapping(value = "/DeleteUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo DeleteUserInfo(@RequestParam("usId") Integer usId,@RequestParam("fg") String fg) throws ParseException {

		logger.info("DeleteUserInfo++" + usId +"++"+fg);
		return new AllInfo(this.userService.DeleteUserInfo(usId,fg));
	}
}

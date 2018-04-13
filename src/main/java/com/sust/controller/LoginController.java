package com.sust.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.sust.entity.AllInfo;
import com.sust.entity.Login;
import com.sust.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {

	private static final Log logger = LogFactory.getLog(LoginController.class);

	@Resource
	private LoginService loginService;

	@RequestMapping("/index")
	private String toIndex(HttpServletRequest request, Model model) throws Exception {

		String result = "login";
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String type = request.getParameter("radio");
		logger.info("toIndex" + account + "+++" + password + "+++" + type);

		String info = loginService.getLoginInfo(account, password, type);

		if (info.equals("yes")) {
			Login login = loginService.getLogin(type, account, password);
			request.getSession().setAttribute("login", login);
			// 初始化页面
			Map<String, String> index = new HashMap<String, String>();
			if (login.getLoType().equals("user")) {
				index = loginService.getInitInfo(account, type);
				model.addAttribute("index", index);
				result = "users/user_index";
			} else if (login.getLoType().equals("admin") || login.getLoType().equals("super")) {
				model.addAttribute("login", login);
				result = "admin/admin_index";
			}
		} else {
			result = "login";
			model.addAttribute("loginInfo", info);
		}
		return result;
	}

	@RequestMapping("/register")
	public String toRegister(@RequestParam("sr_login") String account, @RequestParam("sr_pass2") String pass,
			@RequestParam("us_name") String name, @RequestParam("us_age") String age,
			@RequestParam("us_sex") String sex, @RequestParam("us_brith") String brith,
			@RequestParam("us_num") String num, @RequestParam("us_duty") String duty,
			@RequestParam("us_major") String major, @RequestParam("us_address") String address,
			@RequestParam("us_phone") String phone, @RequestParam("us_mail") String mail,
			@RequestParam("us_academy") String academy, @RequestParam("us_qu1") String qu1,
			@RequestParam("us_key1") String key1, @RequestParam("us_qu2") String qu2,
			@RequestParam("us_key2") String key2, Model model) {
		logger.info("LoginController++" + account + "+" + pass + "+" + name + "+" + age + "+" + sex + "+" + brith + "+"
				+ num + "+" + duty + "+" + major + "+" + address + "+" + phone + "+" + mail + "+" + academy + "+" + qu1
				+ "+" + key1 + "+" + qu2 + "+" + key2);
		if (loginService.saveNewInfo(account, pass, "user", name, age, sex, brith, num, duty, major, address, phone,
				mail, academy, qu1, key1, qu2, key2).equals("success")) {
			return "login";
		} else {
			model.addAttribute("registerInfo", "注册失败,请重新注册！");
			return "users/register";
		}
	}

	@RequestMapping("/findPass")
	public String findPass(HttpServletRequest request, Model model) {

		String account = request.getParameter("acc");
		logger.info("findPass++" + account);
		List<String> key = loginService.findQuKey(account);
		if (key.get(0).equals("success")) {
			model.addAttribute("what", key.get(0));
			model.addAttribute("qu1", key.get(1));
			model.addAttribute("key1", key.get(2));
			model.addAttribute("qu2", key.get(3));
			model.addAttribute("key2", key.get(4));
			model.addAttribute("id", key.get(5));
			return "users/forgetPass";
		} else {
			model.addAttribute("loginInfo", "无此用户！");
			return "login";
		}
	}

	@RequestMapping("/forgetPass")
	public String forgetPass(HttpServletRequest request, Model model) throws IOException {

		String quk1 = request.getParameter("kk1").trim();
		String quk2 = request.getParameter("kk2").trim();
		String key1 = request.getParameter("key1").trim();
		String key2 = request.getParameter("key2").trim();
		String qu1 = request.getParameter("qu1").trim();
		String qu2 = request.getParameter("qu2").trim();
		String id = request.getParameter("id").trim();

		logger.info(
				"forgetPass++" + quk1 + "++" + quk2 + "++" + key1 + "++" + key2 + "++" + qu1 + "++" + qu2 + "+" + id);

		if (key1.equals(quk1) && key2.equals(quk2)) {
			String pa = loginService.getPass(id);
			request.setAttribute("pass", pa);
			return "login";
		} else {
			model.addAttribute("qu1", qu1);
			model.addAttribute("qu2", qu2);
			model.addAttribute("info", "fail");
			return "users/forgetPass";
		}
	}

	@RequestMapping("Layout")
	public String Layout(HttpServletRequest request) {

		request.getSession().invalidate();
		return "login";
	}

	@RequestMapping(value = "/upPass", method = RequestMethod.POST)
	@ResponseBody
	public AllInfo upPass(@RequestParam("Pass") String pass, HttpSession session) {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		return new AllInfo(String.valueOf(this.loginService.upDataPass(usId, pass)));
	}

}

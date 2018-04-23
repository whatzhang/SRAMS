package com.sust.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.sust.dao.LoginMapper;
import com.sust.dao.ThesisMapper;
import com.sust.dao.UsersMapper;
import com.sust.entity.Login;
import com.sust.entity.Thesis;
import com.sust.entity.Users;
import com.sust.service.LoginService;

/**
 * @author zys0916 测试基本sqlCURD实现
 */
public class SqlTest {

	private LoginService loginService;
	public String account = "SUPER";
	public String password = "super";
	public String type = "super";
	private LoginMapper loginMapper;
	private UsersMapper usersMapper;
	private ThesisMapper thesisMapper;

	@Test
	public void test() {

		String info = loginService.getLoginInfo(account, password, type);
		if (info.equals("yes")) {
			Login login;
			try {
				login = loginService.getLogin(type, account, password);
				System.out.println("success" + login);
			} catch (Exception e) {
				System.out.println("fail");
			}
		} else {
			System.out.println("fail");
		}
	}

	// 测试register
	@Test
	public void loginSql() {

		// loginService.saveNewInfo("aaa","aa","user","aa","12","1","2013-2-4","121212","sss","aaa","aaa","asas","asasasa","aaaa","aaaa","aaaa","aaaa","aaaa");

		Integer id;
		String result = "fail";
		try {
			id = usersMapper.insertUserInfo(new Users("aaass", "11", Byte.parseByte("1"),
					(new SimpleDateFormat("yyyy-MM-dd")).parse("2100-2-3"), "12121211", "sss", "aaa", "aaa", "asas",
					"asasasa", "aaaa", "aaaa", "aaaa", "aaaa", "aaaa"));
			if (id > -1) {
				System.out.println(id + "+++" + loginMapper.insert(new Login(id, "aaass", "aaa", "user")));
				result = "success";
			} else {
				result = "fail";
			}
		} catch (Exception e) {

			System.out.println("usersMapper类型转换出错！");
			e.printStackTrace();
		}
		System.out.println(result);
	}

	// 测试忘记密码
	@Test
	public void forgetPass() {

		Login uu = loginMapper.selectByPrimaryKey((Integer) Integer.parseInt("9"));
		System.out.println(uu.toString());
		System.out.println(uu.getLoPass());
	}

	@Test
	public void countInit() {
		Map<String, String> map = loginService.getInitInfo("ADMIN1", "admin", 0, true);
		for (Iterator<String> i = map.keySet().iterator(); i.hasNext();) {
			Object obj = i.next();
			System.out.println(obj);// 循环输出key
			System.out.println("key=" + obj + " value=" + map.get(obj));
		}
	}

	@Test
	public void selectThesis() {

		List<Thesis> listThesis = thesisMapper.selectByUsId(3);
		for (Thesis thesis : listThesis) {
			System.out.println(thesis.toString());
		}
	}

	@Test
	public void dateTest() {

		try {
			System.out.println(new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss:SSS")
					.parse(new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss:SSS").format(new Date())));
			System.out.println(
					new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss:SSS").format(new Date(System.currentTimeMillis())));
			System.out.println(new Date(System.currentTimeMillis()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

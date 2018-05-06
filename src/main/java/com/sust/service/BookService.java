package com.sust.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.sust.entity.Book;

public interface BookService {

	List<Book> getUserBoList(Integer usId);

	Book getBoInfoByboId(int boId);

	String DeleteBoInfoById(int boId, String fg, String type, HttpSession session);

	int addBoInfo(Book book);

	String getUserNameById(Integer usId);

	int upBoInfo(Book book);

	List<Book> getAllBoList();

	Map<String, Object> GuiNaBook(String flg, String xuyuan, String sex, String duty, String bigAge, String smlAge,
			String major, String boCate, String bigBoda, String smlBoda, String bigFont, String smlFont, String bigBoUp,
			String smlBoUp);

	List<Book> findBoInfo(String bigThda, String smlThda, String boCate, String bigFont, String smlFont, String bigThUp,
			String smlThUp);

}

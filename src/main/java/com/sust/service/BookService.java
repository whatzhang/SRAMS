package com.sust.service;

import java.util.List;

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

}

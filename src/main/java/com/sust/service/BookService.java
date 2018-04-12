package com.sust.service;

import java.util.List;

import com.sust.entity.Book;

public interface BookService {

	List<Book> getUserBoList(Integer usId);

	Book getBoInfoByboId(int boId);

	int DeleteBoInfoById(int boId);

	int addBoInfo(Book book);

	String getUserNameById(Integer usId);

	int upBoInfo(Book book);

}

package com.sust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sust.dao.BookMapper;
import com.sust.entity.Book;

@Service
public class BookServiceImpl implements com.sust.service.BookService {

	@Resource
	private BookMapper bookMapper;
	
	@Override
	public List<Book> getUserBoList(Integer usId) {

		return this.bookMapper.selectBookList(usId);
	}

	@Override
	public Book getBoInfoByboId(int boId) {
		
		return this.bookMapper.selectByPrimaryKey(boId);
	}

	@Override
	public int DeleteBoInfoById(int boId) {
		
		return this.bookMapper.deleteByPrimaryKey(boId);
	}

	@Override
	public int addBoInfo(Book book) {
		
		return this.bookMapper.insertSelective(book);
	}

	@Override
	public String getUserNameById(Integer usId) {
		
		return this.bookMapper.selectUserNameById(usId);
	}

	@Override
	public int upBoInfo(Book book) {
		
		return this.bookMapper.updateByPrimaryKey(book);
	}

}

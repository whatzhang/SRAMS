package com.sust.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sust.entity.Book;

@Repository
public interface BookMapper {
    int deleteByPrimaryKey(Integer boId);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer boId);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

	String selectUserNameById(Integer usId);

	List<Book> selectBookList(Integer usId);
}
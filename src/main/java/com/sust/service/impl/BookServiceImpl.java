package com.sust.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sust.dao.BookMapper;
import com.sust.entity.Book;
import com.sust.entity.MyConfig;
import com.sust.other.MyUtils;

@Service
public class BookServiceImpl implements com.sust.service.BookService {

	@Resource
	private BookMapper bookMapper;
	@Autowired
	private MyConfig config;

	@Override
	public List<Book> getUserBoList(Integer usId) {

		return this.bookMapper.selectBookList(usId);
	}

	@Override
	public Book getBoInfoByboId(int boId) {

		return this.bookMapper.selectByPrimaryKey(boId);
	}

	@Override
	public String DeleteBoInfoById(int deId, String fg, String type, HttpSession session) {

		String result = "";
		if ("yes".equals(fg)) {
			String dir = session.getServletContext().getRealPath(config.UPLOADE_URL) + File.separatorChar + type
					+ File.separatorChar;
			if (MyUtils.CreatDir(new File(dir))) {
				String re = MyUtils.deleteFile(dir,
						new SimpleDateFormat("yyyyMMddhhmmssSSS").format(this.bookMapper.selectUpTimeByKey(deId)));
				this.bookMapper.deleteByPrimaryKey(deId);
				if (!re.equals("NO_SUCH_FILE")) {
					result = "删除文件和信息成功！";
				} else {
					result = "没有此文件文件，请及时上传！";
				}
			} else {
				result = "没有此文件文件，请及时上传！";
			}
		} else {
			this.bookMapper.deleteByPrimaryKey(deId);
			result = "删除信息成功！";
		}
		return result;
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

		return this.bookMapper.updateByPrimaryKeySelective(book);
	}

	@Override
	public List<Book> getAllBoList() {

		return this.bookMapper.selectAllBoList();
	}

}

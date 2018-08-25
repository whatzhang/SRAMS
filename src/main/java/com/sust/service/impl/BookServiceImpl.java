package com.sust.service.impl;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sust.dao.BookMapper;
import com.sust.entity.Book;
import com.sust.entity.MyConfig;
import com.sust.other.MyUtils;

@Service
public class BookServiceImpl implements com.sust.service.BookService {

	private static final Log logger = LogFactory.getLog(BookServiceImpl.class);
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

	@Override
	public Map<String, Object> GuiNaBook(String flg, String xuyuan, String sex, String duty, String bigAge,
			String smlAge, String major, String boCate, String bigBoda, String smlBoda, String bigFont, String smlFont,
			String bigBoUp, String smlBoUp) {
		List<Book> list = null;
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			list =  this.bookMapper.selectGuiNaBook(Integer.valueOf(flg),(xuyuan != "" || xuyuan != null )? xuyuan:"", 
					(sex == "" || sex == null )?null:Byte.valueOf(sex),
					(duty == "" || duty == null )?"":duty, (bigAge == "" || bigAge == null )?null:Integer.valueOf(bigAge),
					(smlAge == "" || smlAge == null )?null:Integer.valueOf(smlAge), (major == "" || major == null )?"":major,
					(bigBoda == "" || bigBoda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(bigBoda)),
					(smlBoda == "" || smlBoda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(smlBoda)),
					(boCate == "" || boCate == null )?"":boCate,
					(bigFont == "" || bigFont == null )?null:Integer.valueOf(bigFont), (smlFont == "" || smlFont == null )?null:Integer.valueOf(smlFont),
				    (bigBoUp == "" || bigBoUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(bigBoUp)),
					(smlBoUp == "" || smlBoUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(smlBoUp)));
			if(list == null){
				result.put("flg", null);
				result.put("list", null);
			}else{
				result.put("flg", "yes");
				result.put("list", list);
			}
		} catch (NumberFormatException e) {
			logger.error("GuiNaBook_NumberFormatException");
			return null;
		} catch (ParseException e) {
			logger.error("GuiNaBook_ParseException");
			return null;
		}
		return result;
	}

	@Override
	public List<Book> findBoInfo(String bigBoda, String smlBoda, String boCate, String bigFont, String smlFont,
			String bigBoUp, String smlBoUp) {
		try {
			return this.bookMapper.selectGuiNaBook(0,"",null,"",null,null,"",
					(bigBoda == "" || bigBoda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(bigBoda)),
					(smlBoda == "" || smlBoda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(smlBoda)),
					(boCate == "" || boCate == null )?"":boCate,
					(bigFont == "" || bigFont == null )?null:Integer.valueOf(bigFont), (smlFont == "" || smlFont == null )?null:Integer.valueOf(smlFont),
				    (bigBoUp == "" || bigBoUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(bigBoUp)),
					(smlBoUp == "" || smlBoUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(smlBoUp)));
		} catch (NumberFormatException e) {
			logger.error("GuiNaBook_NumberFormatException");
			return null;
		} catch (ParseException e) {
			logger.error("GuiNaBook_ParseException");
			return null;
		}
	}

	@Override
	public List<Book> findUserBookInfo(Integer usId, String bigBoda, String smlBoda, String boCate, String bigFont, String smlFont,
			String bigBoUp, String smlBoUp) {
		try {
			return this.bookMapper.selectBookFind(usId,
					(bigBoda == "" || bigBoda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(bigBoda)),
					(smlBoda == "" || smlBoda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(smlBoda)),
					(boCate == "" || boCate == null )?"":boCate,
					(bigFont == "" || bigFont == null )?null:Integer.valueOf(bigFont), (smlFont == "" || smlFont == null )?null:Integer.valueOf(smlFont),
				    (bigBoUp == "" || bigBoUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(bigBoUp)),
					(smlBoUp == "" || smlBoUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(smlBoUp)));
		} catch (NumberFormatException e) {
			logger.error("GuiNaBook_NumberFormatException");
			return null;
		} catch (ParseException e) {
			logger.error("GuiNaBook_ParseException");
			return null;
		}
	}

}

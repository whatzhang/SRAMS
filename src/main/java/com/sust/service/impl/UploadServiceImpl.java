package com.sust.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sust.dao.BookMapper;
import com.sust.dao.PatentMapper;
import com.sust.dao.PraiseMapper;
import com.sust.dao.ProjectMapper;
import com.sust.dao.RaceMapper;
import com.sust.dao.ThesisMapper;
import com.sust.other.MyUtils;
import com.sust.service.UploadService;

@Service
public class UploadServiceImpl implements UploadService {

	private static final Log logger = LogFactory.getLog(UploadServiceImpl.class);
	@Resource
	private BookMapper bookMapper;
	@Resource
	private PatentMapper patentMapper;
	@Resource
	private ProjectMapper projectMapper;
	@Resource
	private PraiseMapper praiseMapper;
	@Resource
	private RaceMapper raceMapper;
	@Resource
	private ThesisMapper thesisMapper;

	@Override
	public String UploadUserTypeFile(Integer id, CommonsMultipartFile file, String type, String realPath) {
		if (id == null) {
			return "fail";
		} else {
			String dir = realPath + File.separatorChar + type + File.separatorChar;
			String oldName = file.getOriginalFilename();
			// 删除旧文件
			MyUtils.isExists(dir, getOldFileName(type, id));
			String path = dir + getFileName(type, id, new Date(System.currentTimeMillis()))
					+ oldName.substring(oldName.lastIndexOf('.'));
			logger.info("UploadUserTypeFile++" + id + "++" + type + "++" + file.getOriginalFilename() + "++" + path);
			File newFile = new File(path);
			try {
				file.transferTo(newFile);
			} catch (IllegalStateException | IOException e) {
				logger.error("UploadUserTypeFile_error");
				return "fail";
			}
			return "success";
		}
	}

	private String getOldFileName(String type, Integer id) {
		Date da = new Date();
		switch (type) {
		case "patent":
			da = this.patentMapper.selectUpTimeByKey(id);
			break;
		case "book":
			da = this.bookMapper.selectUpTimeByKey(id);
			break;
		case "praise":
			da = this.praiseMapper.selectUpTimeByKey(id);
			break;
		case "project":
			da = this.projectMapper.selectUpTimeByKey(id);
			break;
		case "race":
			da = this.raceMapper.selectUpTimeByKey(id);
			break;
		case "thesis":
			da = this.thesisMapper.selectUpTimeByKey(id);
			break;
		default:
			break;
		}
		return new SimpleDateFormat("yyyyMMddhhmmssSSS").format(da);
	}

	private String getFileName(String type, Integer id, Date date) {
		logger.info(type + "++" + id + "++" + new SimpleDateFormat("yyyyMMddhhmmssSSS").format(date));
		switch (type) {
		case "patent":
			this.patentMapper.updateUpTime(date, id);
			break;
		case "book":
			this.bookMapper.updateUpTime(date, id);
			break;
		case "praise":
			this.praiseMapper.updateUpTime(date, id);
			break;
		case "project":
			this.projectMapper.updateUpTime(date, id);
			break;
		case "race":
			this.raceMapper.updateUpTime(date, id);
			break;
		case "thesis":
			this.thesisMapper.updateUpTime(date, id);
			break;
		default:
			break;
		}
		return new SimpleDateFormat("yyyyMMddhhmmssSSS").format(date);
	}

}

package com.sust.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sust.dao.BookMapper;
import com.sust.dao.PatentMapper;
import com.sust.dao.PraiseMapper;
import com.sust.dao.ProjectMapper;
import com.sust.dao.RaceMapper;
import com.sust.dao.ThesisMapper;
import com.sust.entity.MyConfig;
import com.sust.other.MyUtils;
import com.sust.service.DownloadService;

@Service
public class DownloadServiceImpl implements DownloadService {

	private static final Log logger = LogFactory.getLog(DownloadServiceImpl.class);
	@Autowired
	private MyConfig config;
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
	public List<String> getDownloadFile(HttpSession session, String type, String id) {

		List<String> reList = new ArrayList<String>();
		String name = getFileName(type, Integer.valueOf(id));
		String dir = session.getServletContext().getRealPath(config.UPLOADE_URL)+ File.separatorChar + type + File.separatorChar;
		if (MyUtils.CreatDir(new File(dir))) {
			String finName = MyUtils.findName(dir, name);
			if(!finName.equals("NO_SUCH_FILE")){
				
				reList.add(finName);
				reList.add(dir + finName);
				logger.info(reList.get(0) + "++" + reList.get(1));
			}else{
				reList.add("NO_SUCH_FILE");
			}
		} else {
			reList.add("NO_SUCH_FILE");
		}
		return reList;
	}

	private String getFileName(String type, Integer id) {
		Date da = new Date();
		String name = "";
		switch (type) {
		case "patent":
			da = this.patentMapper.selectUpTimeByKey(id);
			name = this.patentMapper.selectNameById(id);
			break;
		case "book":
			da = this.bookMapper.selectUpTimeByKey(id);
			name = this.bookMapper.selectNameById(id);
			break;
		case "praise":
			da = this.praiseMapper.selectUpTimeByKey(id);
			name = this.praiseMapper.selectNameById(id);
			break;
		case "project":
			da = this.projectMapper.selectUpTimeByKey(id);
			name = this.projectMapper.selectNameById(id);
			break;
		case "race":
			da = this.raceMapper.selectUpTimeByKey(id);
			name = this.raceMapper.selectNameById(id);
			break;
		case "thesis":
			da = this.thesisMapper.selectUpTimeByKey(id);
			name = this.thesisMapper.selectNameByid(id);
			break;
		default:
			break;
		}
		return name + new SimpleDateFormat("yyyyMMddhhmmssSSS").format(da);
	}

}

package com.sust.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sust.dao.BookMapper;
import com.sust.dao.PatentMapper;
import com.sust.dao.PraiseMapper;
import com.sust.dao.ProjectMapper;
import com.sust.dao.RaceMapper;
import com.sust.dao.ThesisMapper;
import com.sust.entity.MyConfig;
import com.sust.other.ExclUtils;
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
		String name = getFileUpTime(type, Integer.valueOf(id));
		String dir = session.getServletContext().getRealPath(config.UPLOADE_URL) + File.separatorChar + type
				+ File.separatorChar;
		if (MyUtils.CreatDir(new File(dir))) {
			String finName = MyUtils.findName(dir, name);
			if (!finName.equals("NO_SUCH_FILE")) {

				reList.add(0, finName);
				reList.add(1, dir + finName);
				logger.info(reList.get(0) + "++" + reList.get(1));
			} else {
				reList.add("NO_SUCH_FILE");
			}
		} else {
			reList.add("NO_SUCH_FILE");
		}
		return reList;
	}

	private String getFileUpTime(String type, Integer id) {
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

	@SuppressWarnings("unused")
	private String getTypeName(String type, Integer id) {
		String name = "";
		switch (type) {
		case "patent":
			name = this.patentMapper.selectNameById(id);
			break;
		case "book":
			name = this.bookMapper.selectNameById(id);
			break;
		case "praise":
			name = this.praiseMapper.selectNameById(id);
			break;
		case "project":
			name = this.projectMapper.selectNameById(id);
			break;
		case "race":
			name = this.raceMapper.selectNameById(id);
			break;
		case "thesis":
			name = this.thesisMapper.selectNameByid(id);
			break;
		default:
			break;
		}
		return name;
	}

	@Override
	public String DeleteUnusedFile(HttpSession session, int id, String type) {

		String dir = session.getServletContext().getRealPath(config.UPLOADE_URL) + File.separatorChar + type
				+ File.separatorChar;
		if (MyUtils.CreatDir(new File(dir))) {
			String re = MyUtils.deleteFile(dir, getFileUpTime(type, id));
			if (!re.equals("NO_SUCH_FILE")) {
				return "删除成功！";
			} else {
				return "没有此文件文件，请及时上传！";
			}
		} else {
			return "没有此文件文件，请及时上传！";
		}
	}

	@Override
	public File getWorkBookStream(int usId, String type, HttpSession session) {

		File excelFile = new File(session.getServletContext().getRealPath(config.UPLOADE_URL) + File.separatorChar
				+ "temp" + File.separatorChar + "temp.xls");
		FileOutputStream os = null;

		try {
			os = new FileOutputStream(excelFile);
			getUserTypeInfoList(type, usId).write(os);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return excelFile;
	}

	private Workbook getUserTypeInfoList(String type, Integer id) {

		List<Map<String, Object>> map = new ArrayList<Map<String, Object>>();
		Workbook wb = new HSSFWorkbook();
		switch (type) {
		case "patent":
			map = ExclUtils.createExcelPatent(this.patentMapper.selectByUsId(id));
			String columnNames[] = { "序号", "专利名称", "专利类别", "专利拥有着", "申请日期", "授权时间", "专利序号", "专利内容", "文件上传时间" };// 列名
			String keys[] = { "paId", "paName", "paCategory", "paAuthor", "paPlease", "paDate", "paNumber", "paAbout",
					"paUptime" };// map中的key
			wb = ExclUtils.createWorkBook(map, keys, columnNames);
			break;
		case "book":
			map = ExclUtils.createExcelBook(this.bookMapper.selectBookList(id));
			String columnNames1[] = { "序号", "教材名称", "教材类别", "出版日期", "教材主编", "教材参编", "教材字数", "出版社", "教材简介", "文件上传日期" };// 列名
			String keys1[] = { "boId", "boName", "boCategory", "boDate", "boEditor", "boEditor2", "boFont", "boPublish",
					"boAbout", "boUptime" };// map中的key
			wb = ExclUtils.createWorkBook(map, keys1, columnNames1);
			break;
		case "praise":
			map = ExclUtils.createExcelPraise(this.praiseMapper.selectUserPraiseInfo(id));
			String columnNames2[] = { "序号", "获奖名称", "获奖类别", "获奖日期", "颁奖机构", "获奖人", "获奖简介", "文件上传日期" };// 列名
			String keys2[] = { "prId", "prName", "prCategory", "prDate", "prUnit", "prAuthor", "prAbout", "prUptime" };// map中的key
			wb = ExclUtils.createWorkBook(map, keys2, columnNames2);
			break;
		case "project":
			map = ExclUtils.createExcelProject(this.projectMapper.selectProjectList(id));
			String columnNames3[] = { "序号", "项目名称", "项目类别", "立项时间", "立项金额", "项目领导", "团队成员", "项目简介", "文件上传日期" };// 列名
			String keys3[] = { "proId", "proName", "proCategory", "proDate", "proCash", "proLeader", "proTeam",
					"proAbout", "proUptime" };// map中的key
			wb = ExclUtils.createWorkBook(map, keys3, columnNames3);
			break;
		case "race":
			map = ExclUtils.createExcelRace(this.raceMapper.selectUserRaceList(id));
			String columnNames4[] = { "序号", "竞赛名称", "竞赛类别", "个人/团体", "获奖人", "获奖等级", "指导老师", "竞赛日期", "竞赛简介", "文件上传日期" };// 列名
			String keys4[] = { "raId", "raName", "raCategory", "raType", "raAuthor", "raLevel", "raTeacher", "raDate",
					"raAbout", "raUptime" };// map中的key
			wb = ExclUtils.createWorkBook(map, keys4, columnNames4);
			break;
		case "thesis":
			map = ExclUtils.createExcelThesis(this.thesisMapper.selectByUsId(id));
			String columnNames5[] = { "序号", "论文名称", "论文类别", "论文作者", "发表日期", "论文等级", "影响因子", "是否收录", "论文编号", "发表期刊",
					"期刊页面", "论文简介", "文件上传日期" };// 列名
			String keys5[] = { "thId", "thName", "thCategory", "thAuthor", "thDate", "thLevel", "thFactor",
					"thIncluded", "thNumber", "thJournal", "thPage", "thAbout", "thUptime" };// map中的key
			wb = ExclUtils.createWorkBook(map, keys5, columnNames5);
			break;
		default:
			break;
		}
		return wb;
	}

}

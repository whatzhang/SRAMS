package com.sust.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.sust.dao.BookMapper;
import com.sust.dao.LoginMapper;
import com.sust.dao.PatentMapper;
import com.sust.dao.PraiseMapper;
import com.sust.dao.ProjectMapper;
import com.sust.dao.RaceMapper;
import com.sust.dao.ThesisMapper;
import com.sust.dao.UsersMapper;
import com.sust.entity.Charts;
import com.sust.service.StatisticService;

@Service
public class StatisticServiceImpl implements StatisticService {

	private static final Log logger = LogFactory.getLog(StatisticServiceImpl.class);
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
	@Resource
	private UsersMapper usersMapper;
	@Resource
	private LoginMapper loginMapper;
	private int year = Calendar.getInstance().get(Calendar.YEAR);
	
	@Override
	public Charts getChartInfo() {
		Charts charts = new Charts();
		/*总统计数据*/
		charts.setAllNumber(getAllNumber());
		
		charts.setSexNanNumber(getSexNanNumber());
		charts.setSexNvNumber(getSexNvNumber());
		
		charts.setAcademy1(getXueYuanNum1());
		charts.setAcademy2(getXueYuanNum2());
		charts.setAcademy3(getXueYuanNum3());
		charts.setAcademy4(getXueYuanNum4());
		charts.setAcademy5(getXueYuanNum5());
		charts.setAcademy6(getXueYuanNum6());
		
		charts.setYearName(getYearName());
		charts.setThYear(getThYear());
		charts.setPaYear(getPaYear());
		charts.setPrYear(getPrYear());
		charts.setProYear(getProYear());
		charts.setBoYear(getBoYear());
		charts.setRaYear(getRaYear());
		/* 论文 */
		charts.setThCateNum(getThCateNum());
		//专利
		charts.setPaCateNum(getPaCateNum());
		//获奖
		charts.setPrCateNum(getPrCateNum());
		//项目
		charts.setProCateNum(getProCateNum());
		charts.setPrMoneyNum(getPrMoneyNum());
		//教材
		charts.setBoCateNum(getboCateNum());
		charts.setBoFontNum(getFontNum());
		//竞赛
		charts.setRaCateNum(getRaCateNum());
		//用户
		charts.setSexNum(getSexNum());
		charts.setAgeNum(getAgeNum());
		
		
		return charts;
	}

	private List<String> getSexNum() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.usersMapper.selectSexUser(Byte.valueOf("1"))));
		re.add(String.valueOf(this.usersMapper.selectSexUser(Byte.valueOf("0"))));
		return re;
	}

	private List<String> getAgeNum() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.usersMapper.selectAge(null,20)));
		re.add(String.valueOf(this.usersMapper.selectAge(20,30)));
		re.add(String.valueOf(this.usersMapper.selectAge(30,40)));
		re.add(String.valueOf(this.usersMapper.selectAge(40,50)));
		re.add(String.valueOf(this.usersMapper.selectAge(50,null)));
		logger.info(re.toString());
		return re;
	}

	private List<String> getFontNum() {
		//"<100",">100,<200",">200"
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.bookMapper.selectCateNumByFont(null,100)));
		re.add(String.valueOf(this.bookMapper.selectCateNumByFont(100,200)));
		re.add(String.valueOf(this.bookMapper.selectCateNumByFont(200,null)));
		logger.info(re.toString());
		return re;
	}

	private List<String> getboCateNum() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.bookMapper.selectCateNum("类别一")));
		re.add(String.valueOf(this.bookMapper.selectCateNum("类别二")));
		re.add(String.valueOf(this.bookMapper.selectCateNum("类别三")));
		re.add(String.valueOf(this.bookMapper.selectCateNum("其他")));
		logger.info(re.toString());
		return re;
	}

	private List<String> getPrMoneyNum() {
		//"<5000",">5000,<10000",">10000"
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.projectMapper.selectCateNumByCash(null,5000)));
		re.add(String.valueOf(this.projectMapper.selectCateNumByCash(5000,10000)));
		re.add(String.valueOf(this.projectMapper.selectCateNumByCash(10000,null)));
		logger.info(re.toString());
		return re;
	}

	private List<String> getProCateNum() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.projectMapper.selectCateNum("类别一")));
		re.add(String.valueOf(this.projectMapper.selectCateNum("类别二")));
		re.add(String.valueOf(this.projectMapper.selectCateNum("类别三")));
		re.add(String.valueOf(this.projectMapper.selectCateNum("其他")));
		logger.info(re.toString());
		return re;
	}

	private List<String> getPrCateNum() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.praiseMapper.selectCateNum("个人")));
		re.add(String.valueOf(this.praiseMapper.selectCateNum("团体")));
		re.add(String.valueOf(this.praiseMapper.selectCateNum("其他")));
		logger.info(re.toString());
		return re;
	}

	private List<String> getPaCateNum() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.patentMapper.selectCateNum("类别一")));
		re.add(String.valueOf(this.patentMapper.selectCateNum("类别二")));
		re.add(String.valueOf(this.patentMapper.selectCateNum("类别三")));
		re.add(String.valueOf(this.patentMapper.selectCateNum("其他")));
		logger.info(re.toString());
		return re;
	}

	private List<String> getThCateNum() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.thesisMapper.selectCateNum("类别一")));
		re.add(String.valueOf(this.thesisMapper.selectCateNum("类别二")));
		re.add(String.valueOf(this.thesisMapper.selectCateNum("类别三")));
		re.add(String.valueOf(this.thesisMapper.selectCateNum("其他")));
		logger.info(re.toString());
		return re;
	}
	
	private List<String> getRaCateNum() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.raceMapper.selectCateNum("类别一")));
		re.add(String.valueOf(this.raceMapper.selectCateNum("类别二")));
		re.add(String.valueOf(this.raceMapper.selectCateNum("类别三")));
		re.add(String.valueOf(this.raceMapper.selectCateNum("其他")));
		logger.info(re.toString());
		return re;
	}

	private List<String> getYearName() {
		List<String> re = new ArrayList<String>();
		for (int i = year - 11; i <= year; i++) {
			re.add(String.valueOf(i));
		}
		return re;
	}

	private List<String> getRaYear() {
		List<String> re = new ArrayList<String>();
		for (int i = year - 11; i <= year; i++) {
			re.add(String.valueOf(this.raceMapper.selectTimeNum(i)));
		}
		return re;
	}

	private List<String> getBoYear() {
		List<String> re = new ArrayList<String>();
		for (int i = year - 11; i <= year; i++) {
			re.add(String.valueOf(this.bookMapper.selectTimeNum(i)));
		}
		return re;
	}

	private List<String> getProYear() {
		List<String> re = new ArrayList<String>();
		for (int i = year - 11; i <= year; i++) {
			re.add(String.valueOf(this.projectMapper.selectTimeNum(i)));
		}
		return re;
	}

	private List<String> getPrYear() {
		List<String> re = new ArrayList<String>();
		for (int i = year - 11; i <= year; i++) {
			re.add(String.valueOf(this.praiseMapper.selectTimeNum(i)));
		}
		return re;
	}

	private List<String> getPaYear() {
		List<String> re = new ArrayList<String>();
		for (int i = year - 11; i <= year; i++) {
			re.add(String.valueOf(this.patentMapper.selectTimeNum(i)));
		}
		return re;
	}

	private List<String> getThYear() {
		List<String> re = new ArrayList<String>();
		for (int i = year - 11; i <= year; i++) {
			re.add(String.valueOf(this.thesisMapper.selectTimeNum(i)));
		}
		return re;
	}

	private List<String> getXueYuanNum6() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院1")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院2")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院3")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院4")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院5")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院6")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院7")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院8")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院9")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院10")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院11")));
		re.add(String.valueOf(this.raceMapper.selectXueYuanNum("学院12")));
		logger.info(re.toString());
		return re;
	}

	private List<String> getXueYuanNum5() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院1")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院2")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院3")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院4")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院5")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院6")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院7")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院8")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院9")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院10")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院11")));
		re.add(String.valueOf(this.bookMapper.selectXueYuanNum("学院12")));
		logger.info(re.toString());
		return re;
	}

	private List<String> getXueYuanNum4() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院1")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院2")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院3")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院4")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院5")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院6")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院7")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院8")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院9")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院10")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院11")));
		re.add(String.valueOf(this.projectMapper.selectXueYuanNum("学院12")));
		logger.info(re.toString());
		return re;
	}

	private List<String> getXueYuanNum3() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院1")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院2")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院3")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院4")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院5")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院6")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院7")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院8")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院9")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院10")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院11")));
		re.add(String.valueOf(this.praiseMapper.selectXueYuanNum("学院12")));
		logger.info(re.toString());
		return re;
	}

	private List<String> getXueYuanNum2() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院1")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院2")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院3")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院4")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院5")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院6")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院7")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院8")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院9")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院10")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院11")));
		re.add(String.valueOf(this.patentMapper.selectXueYuanNum("学院12")));
		logger.info(re.toString());
		return re;
	}
	private List<String> getXueYuanNum1() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院1")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院2")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院3")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院4")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院5")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院6")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院7")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院8")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院9")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院10")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院11")));
		re.add(String.valueOf(this.thesisMapper.selectXueYuanNum("学院12")));
		logger.info(re.toString());
		return re;
	}

	private List<String> getSexNvNumber() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.thesisMapper.selectSexNumber(Byte.valueOf("0"))));
		re.add(String.valueOf(this.patentMapper.selectSexNumber(Byte.valueOf("0"))));
		re.add(String.valueOf(this.praiseMapper.selectSexNumber(Byte.valueOf("0"))));
		re.add(String.valueOf(this.projectMapper.selectSexNumber(Byte.valueOf("0"))));
		re.add(String.valueOf(this.bookMapper.selectSexNumber(Byte.valueOf("0"))));
		re.add(String.valueOf(this.raceMapper.selectSexNumber(Byte.valueOf("0"))));
		logger.info(re.toString());
		return re;
	}

	private List<String> getSexNanNumber() {
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.thesisMapper.selectSexNumber(Byte.valueOf("1"))));
		re.add(String.valueOf(this.patentMapper.selectSexNumber(Byte.valueOf("1"))));
		re.add(String.valueOf(this.praiseMapper.selectSexNumber(Byte.valueOf("1"))));
		re.add(String.valueOf(this.projectMapper.selectSexNumber(Byte.valueOf("1"))));
		re.add(String.valueOf(this.bookMapper.selectSexNumber(Byte.valueOf("1"))));
		re.add(String.valueOf(this.raceMapper.selectSexNumber(Byte.valueOf("1"))));
		logger.info(re.toString());
		return re;
	}

	private List<String> getAllNumber() {
		
		List<String> re = new ArrayList<String>();
		re.add(String.valueOf(this.loginMapper.selectAllThNum()));
		re.add(String.valueOf(this.loginMapper.selectAllPaNum()));
		re.add(String.valueOf(this.loginMapper.selectAllPrNum()));
		re.add(String.valueOf(this.loginMapper.selectAllProNum()));
		re.add(String.valueOf(this.loginMapper.selectAllBoNum()));
		re.add(String.valueOf(this.loginMapper.selectAllRaNum()));
		return re;
	}

}

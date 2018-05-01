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

import com.sust.dao.RaceMapper;
import com.sust.entity.MyConfig;
import com.sust.entity.Race;
import com.sust.other.MyUtils;
import com.sust.service.RaceService;

@Service
public class RaceServiceImpl implements RaceService {

	private static final Log logger = LogFactory.getLog(RaceServiceImpl.class);
	@Resource
	private RaceMapper raceMapper;
	@Autowired
	private MyConfig config;

	@Override
	public List<Race> getUserRace(Integer usId) {

		return this.raceMapper.selectUserRaceList(usId);
	}

	@Override
	public Race getRaInfoByraId(int raId) {

		return this.raceMapper.selectByPrimaryKey(raId);
	}

	@Override
	public String DeleteRaInfoByThid(int deId, String fg, String type, HttpSession session) {

		String result = "";
		if ("yes".equals(fg)) {
			String dir = session.getServletContext().getRealPath(config.UPLOADE_URL) + File.separatorChar + type
					+ File.separatorChar;
			if (MyUtils.CreatDir(new File(dir))) {
				String re = MyUtils.deleteFile(dir,
						new SimpleDateFormat("yyyyMMddhhmmssSSS").format(this.raceMapper.selectUpTimeByKey(deId)));
				this.raceMapper.deleteByPrimaryKey(deId);
				if (!re.equals("NO_SUCH_FILE")) {
					result = "删除文件成功！";
				} else {
					result = "没有此文件文件，请及时上传！";
				}
			} else {
				result = "没有此文件文件，请及时上传！";
			}
		} else {
			this.raceMapper.deleteByPrimaryKey(deId);
			result = "删除信息成功！";
		}
		return result;
	}

	@Override
	public String getUserNameById(Integer usId) {

		return this.raceMapper.selectUserNameById(usId);
	}

	@Override
	public int addRaInfo(Race race) {

		return this.raceMapper.insertSelective(race);
	}

	@Override
	public int upRaInfo(Race race) {

		return this.raceMapper.updateByPrimaryKey(race);
	}

	@Override
	public List<Race> getAllRaceInfo() {

		return this.raceMapper.selectAllRaceInfo();
	}

	@Override
	public Map<String, Object> GuiNaRace(String flg, String xuyuan, String sex, String duty, String bigAge,
			String smlAge, String major, String raCate, String raTuan, String bigRada, String smlRada, String bigRaUp,
			String smlRaUp) {
		List<Race> list = null;
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			list =  this.raceMapper.selectGuiNaRace(Integer.valueOf(flg),(xuyuan != "" || xuyuan != null )? xuyuan:"", 
					(sex == "" || sex == null )?null:Byte.valueOf(sex),
					(duty == "" || duty == null )?"":duty, (bigAge == "" || bigAge == null )?null:Integer.valueOf(bigAge),
					(smlAge == "" || smlAge == null )?null:Integer.valueOf(smlAge), (major == "" || major == null )?"":major,
					(bigRada == "" || bigRada == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(bigRada)),
					(smlRada == "" || smlRada == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(smlRada)),
					(raCate == "" || raCate == null )?"":raCate,(raTuan == "" || raTuan == null )?"":raTuan, 
				    (bigRaUp == "" || bigRaUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(bigRaUp)),
					(smlRaUp == "" || smlRaUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(smlRaUp)));
			if(list == null){
				result.put("flg", null);
				result.put("list", null);
			}else{
				result.put("flg", "yes");
				result.put("list", list);
			}
		} catch (NumberFormatException e) {
			logger.error("GuiNaRace_NumberFormatException");
			return null;
		} catch (ParseException e) {
			logger.error("GuiNaRace_ParseException");
			return null;
		}
		return result;
	}

}

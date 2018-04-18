package com.sust.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sust.dao.RaceMapper;
import com.sust.entity.MyConfig;
import com.sust.entity.Race;
import com.sust.other.MyUtils;
import com.sust.service.RaceService;

@Service
public class RaceServiceImpl implements RaceService {

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

}

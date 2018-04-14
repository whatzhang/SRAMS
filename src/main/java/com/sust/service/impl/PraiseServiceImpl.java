package com.sust.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sust.dao.PraiseMapper;
import com.sust.entity.MyConfig;
import com.sust.entity.Praise;
import com.sust.other.MyUtils;
import com.sust.service.PraiseService;

@Service
public class PraiseServiceImpl implements PraiseService {

	@Resource
	private PraiseMapper praiseMapper;
	@Autowired
	private MyConfig config;
	@Override
	public List<Praise> getUserPraiseInfo(Integer usId) {

		return this.praiseMapper.selectUserPraiseInfo(usId);
	}

	@Override
	public Praise getRaInfoByraId(int prId) {

		return this.praiseMapper.selectByPrimaryKey(Integer.valueOf(prId));
	}

	@Override
	public String DeletePrInfo(int deId, String fg, String type, HttpSession session) {

		String result = "";
		if ("yes".equals(fg)) {
			String dir = session.getServletContext().getRealPath(config.UPLOADE_URL) + File.separatorChar + type
					+ File.separatorChar;
			if (MyUtils.CreatDir(new File(dir))) {
				String re = MyUtils.deleteFile(dir, new SimpleDateFormat("yyyyMMddhhmmssSSS").format(this.praiseMapper.selectUpTimeByKey(deId)));
				this.praiseMapper.deleteByPrimaryKey(deId);
				if (!re.equals("NO_SUCH_FILE")) {
					result = "删除文件和信息成功！";
				} else {
					result = "没有此文件文件，请及时上传！";
				}
			} else {
				result = "没有此文件文件，请及时上传！";
			}
		} else {
			this.praiseMapper.deleteByPrimaryKey(deId);
			result = "删除信息成功！";
		}
		return result;
	}

	@Override
	public int addPrInfo(Praise praise) {

		return this.praiseMapper.insertSelective(praise);
	}

	@Override
	public String getUserNameById(Integer usId) {

		return this.praiseMapper.selectUserNameById(usId);
	}

	@Override
	public int upPrInfo(Praise praise) {

		return this.praiseMapper.updateByPrimaryKey(praise);
	}

}

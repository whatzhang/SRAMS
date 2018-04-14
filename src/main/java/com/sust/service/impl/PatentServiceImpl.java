package com.sust.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sust.dao.PatentMapper;
import com.sust.entity.MyConfig;
import com.sust.entity.Patent;
import com.sust.other.MyUtils;
import com.sust.service.PatentService;

@Service
public class PatentServiceImpl implements PatentService {

	@Resource
	private PatentMapper petentMapper;
	@Autowired
	private MyConfig config;
	@Override
	public List<Patent> getUserPatent(Integer usId) {
		return this.petentMapper.selectByUsId(usId);
	}

	@Override
	public Patent getPaInfoByraId(int paId) {
		return this.petentMapper.selectByPrimaryKey(paId);
	}

	@Override
	public String DeletePaInfoById(int deId, String fg, String type, HttpSession session) {

		String result = "";
		if ("yes".equals(fg)) {
			String dir = session.getServletContext().getRealPath(config.UPLOADE_URL) + File.separatorChar + type
					+ File.separatorChar;
			if (MyUtils.CreatDir(new File(dir))) {
				String re = MyUtils.deleteFile(dir, new SimpleDateFormat("yyyyMMddhhmmssSSS").format(this.petentMapper.selectUpTimeByKey(deId)));
				this.petentMapper.deleteByPrimaryKey(deId);
				if (!re.equals("NO_SUCH_FILE")) {
					result = "删除文件和信息成功！";
				} else {
					result = "没有此文件文件，请及时上传！";
				}
			} else {
				result = "没有此文件文件，请及时上传！";
			}
		} else {
			this.petentMapper.deleteByPrimaryKey(deId);
			result = "删除信息成功！";
		}
		return result;
	}

	@Override
	public int addPaInfo(Patent patent) {
		return this.petentMapper.insertSelective(patent);
	}

	@Override
	public String getUserNameById(Integer usId) {
		return this.petentMapper.selectgetUserNameById(usId);
	}

	@Override
	public int upPaInfo(Patent patent) {
		return this.petentMapper.updateByPrimaryKey(patent);
	}

}

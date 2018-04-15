package com.sust.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sust.dao.ThesisMapper;
import com.sust.entity.MyConfig;
import com.sust.entity.Thesis;
import com.sust.other.MyUtils;
import com.sust.service.ThesisService;

@Service
public class ThesisServiceImpl implements ThesisService {

	@Resource
	private ThesisMapper thesisMapper;
	@Autowired
	private MyConfig config;

	@Override
	public List<Thesis> getThesisInfo(Integer usId) {

		return this.thesisMapper.selectByUsId(usId);
	}

	@Override
	public Thesis getThInfoByThid(int id) {

		return this.thesisMapper.selectByPrimaryKey(id);
	}

	@Override
	public String deleteThesisById(int deId, String fg, String type, HttpSession session) {

		String result = "";
		if ("yes".equals(fg)) {
			String dir = session.getServletContext().getRealPath(config.UPLOADE_URL) + File.separatorChar + type
					+ File.separatorChar;
			if (MyUtils.CreatDir(new File(dir))) {
				String re = MyUtils.deleteFile(dir,
						new SimpleDateFormat("yyyyMMddhhmmssSSS").format(this.thesisMapper.selectUpTimeByKey(deId)));
				this.thesisMapper.deleteByPrimaryKey(deId);
				if (!re.equals("NO_SUCH_FILE")) {
					result = "删除文件成功！";
				} else {
					result = "没有此文件文件，请及时上传！";
				}
			} else {
				result = "没有此文件文件，请及时上传！";
			}
		} else {
			this.thesisMapper.deleteByPrimaryKey(deId);
			result = "删除信息成功！";
		}
		return result;
	}

	@Override
	public int addThesis(Thesis thesis) {

		System.out.println(thesis.toString());

		return this.thesisMapper.insertSelective(thesis);
	}

	@Override
	public String getUserNameById(int usId) {

		return this.thesisMapper.selectUserNameById(usId);
	}

	@Override
	public int upThesisInfo(Thesis thesis) {

		return this.thesisMapper.updateByPrimaryKey(thesis);
	}
}

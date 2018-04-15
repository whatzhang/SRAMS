package com.sust.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sust.dao.ProjectMapper;
import com.sust.entity.MyConfig;
import com.sust.entity.Project;
import com.sust.other.MyUtils;
import com.sust.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectMapper projectMapper;
	@Autowired
	private MyConfig config;

	@Override
	public int upProInfo(Project project) {

		return this.projectMapper.updateByPrimaryKeySelective(project);
	}

	@Override
	public int addProInfo(Project project) {

		return this.projectMapper.insertSelective(project);
	}

	@Override
	public String DeleteProInfoById(int deId, String fg, String type, HttpSession session) {

		String result = "";
		if ("yes".equals(fg)) {
			String dir = session.getServletContext().getRealPath(config.UPLOADE_URL) + File.separatorChar + type
					+ File.separatorChar;
			if (MyUtils.CreatDir(new File(dir))) {
				String re = MyUtils.deleteFile(dir,
						new SimpleDateFormat("yyyyMMddhhmmssSSS").format(this.projectMapper.selectUpTimeByKey(deId)));
				this.projectMapper.deleteByPrimaryKey(deId);
				if (!re.equals("NO_SUCH_FILE")) {
					result = "删除文件成功！";
				} else {
					result = "没有此文件文件，请及时上传！";
				}
			} else {
				result = "没有此文件文件，请及时上传！";
			}
		} else {
			this.projectMapper.deleteByPrimaryKey(deId);
			result = "删除信息成功！";
		}
		return result;
	}

	@Override
	public Project getProInfoByProId(int proId) {

		return this.projectMapper.selectByPrimaryKey(Integer.valueOf(proId));
	}

	@Override
	public List<Project> getUserProList(Integer usId) {

		return this.projectMapper.selectProjectList(usId);
	}

}

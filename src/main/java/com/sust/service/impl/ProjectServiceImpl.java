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

import com.sust.dao.ProjectMapper;
import com.sust.entity.MyConfig;
import com.sust.entity.Project;
import com.sust.other.MyUtils;
import com.sust.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {

	private static final Log logger = LogFactory.getLog(ProjectServiceImpl.class);
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

	@Override
	public List<Project> getAllProList() {

		return this.projectMapper.selectAllProjectList();
	}

	@Override
	public Map<String, Object> GuiNaProject(String flg, String xuyuan, String sex, String duty, String bigAge,
			String smlAge, String major, String proCate, String bigProda, String smlProda, String bigMoney,
			String smlMoney, String bigProUp, String smlProUp) {
		List<Project> list = null;
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			list =  this.projectMapper.selectGuiNaThesis(Integer.valueOf(flg),(xuyuan != "" || xuyuan != null )? xuyuan:"", 
					(sex == "" || sex == null )?null:Byte.valueOf(sex),
					(duty == "" || duty == null )?"":duty, (bigAge == "" || bigAge == null )?null:Integer.valueOf(bigAge),
					(smlAge == "" || smlAge == null )?null:Integer.valueOf(smlAge), (major == "" || major == null )?"":major,
					(bigProda == "" || bigProda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(bigProda)),
					(smlProda == "" || smlProda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(smlProda)),
					(proCate == "" || proCate == null )?"":proCate,
					(bigMoney == "" || bigMoney == null )?null:Integer.valueOf(bigMoney), (smlMoney == "" || smlMoney == null )?null:Integer.valueOf(smlMoney),
				    (bigProUp == "" || bigProUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(bigProUp)),
					(smlProUp == "" || smlProUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(smlProUp)));
			if(list == null){
				result.put("flg", null);
				result.put("list", null);
			}else{
				result.put("flg", "yes");
				result.put("list", list);
			}
		} catch (NumberFormatException e) {
			logger.error("GuiNaProject_NumberFormatException");
			return null;
		} catch (ParseException e) {
			logger.error("GuiNaProject_ParseException");
			return null;
		}
		return result;
	}

	@Override
	public List<Project> findProInfo(String bigProda, String smlProda, String proCate, String bigMoney, String smlMoney,
			String bigProUp, String smlProUp) {
		try {
			return this.projectMapper.selectGuiNaThesis(0,"",null,"",null,null,"",
					(bigProda == "" || bigProda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(bigProda)),
							(smlProda == "" || smlProda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(smlProda)),
							(proCate == "" || proCate == null )?"":proCate,
							(bigMoney == "" || bigMoney == null )?null:Integer.valueOf(bigMoney), (smlMoney == "" || smlMoney == null )?null:Integer.valueOf(smlMoney),
						    (bigProUp == "" || bigProUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(bigProUp)),
							(smlProUp == "" || smlProUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(smlProUp)));
		} catch (NumberFormatException e) {
			logger.error("findProInfo_NumberFormatException");
			return null;
		} catch (ParseException e) {
			logger.error("findProInfo_ParseException");
			return null;
		}
	}

}

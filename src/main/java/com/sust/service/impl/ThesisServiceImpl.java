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

import com.sust.dao.ThesisMapper;
import com.sust.entity.MyConfig;
import com.sust.entity.Thesis;
import com.sust.other.MyUtils;
import com.sust.service.ThesisService;

@Service
public class ThesisServiceImpl implements ThesisService {

	private static final Log logger = LogFactory.getLog(ThesisServiceImpl.class);
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

	@Override
	public List<Thesis> getAllThInfo() {

		return this.thesisMapper.selectAllThesis();
	}

	@Override
	public Map<String,Object> GuiNaThesis(String flg,String xuyuan, String sex, String duty, String bigAge, String smlAge, String major,
			String bigThda, String smlThda, String thCate, String thle, String thIsCl, String bigThUp, String smlThUp) {
		List<Thesis> list = null;
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			list =  this.thesisMapper.selectGuiNaThesis(Integer.valueOf(flg),(xuyuan != "" || xuyuan != null )? xuyuan:"", 
					(sex == "" || sex == null )?null:Byte.valueOf(sex),
					(duty == "" || duty == null )?"":duty, (bigAge == "" || bigAge == null )?null:Integer.valueOf(bigAge),
					(smlAge == "" || smlAge == null )?null:Integer.valueOf(smlAge), (major == "" || major == null )?"":major,
					(bigThda == "" || bigThda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(bigThda)),
					(smlThda == "" || smlThda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(smlThda)),
					(thCate == "" || thCate == null )?"":thCate,
					(thle == "" || thle == null )?"":thle, (thIsCl == "" || thIsCl == null )?"":thIsCl,
				    (bigThUp == "" || bigThUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(bigThUp)),
					(smlThUp == "" || smlThUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(smlThUp)));
			if(list == null){
				result.put("flg", null);
				result.put("list", null);
			}else{
				result.put("flg", "yes");
				result.put("list", list);
			}
		} catch (NumberFormatException e) {
			logger.error("GuiNaThesis_NumberFormatException");
			return null;
		} catch (ParseException e) {
			logger.error("GuiNaThesis_ParseException");
			return null;
		}
		return result;
	}
}

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

import com.sust.dao.PatentMapper;
import com.sust.entity.MyConfig;
import com.sust.entity.Patent;
import com.sust.other.MyUtils;
import com.sust.service.PatentService;

@Service
public class PatentServiceImpl implements PatentService {

	private static final Log logger = LogFactory.getLog(PatentServiceImpl.class);
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
				String re = MyUtils.deleteFile(dir,
						new SimpleDateFormat("yyyyMMddhhmmssSSS").format(this.petentMapper.selectUpTimeByKey(deId)));
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

	@Override
	public List<Patent> getAllPaInfo() {

		return this.petentMapper.selectAllPaInfo();
	}

	@Override
	public Map<String, Object> GuiNaPatent(String flg, String xuyuan, String sex, String duty, String bigAge,
			String smlAge, String major, String paCate, String bigPada, String smlPada, String bigPaUp,
			String smlPaUp) {
		
		List<Patent> list = null;
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			list =  this.petentMapper.selectGuiNaPetent(Integer.valueOf(flg),(xuyuan != "" || xuyuan != null )? xuyuan:"", 
					(sex == "" || sex == null )?null:Byte.valueOf(sex),
					(duty == "" || duty == null )?"":duty, (bigAge == "" || bigAge == null )?null:Integer.valueOf(bigAge),
					(smlAge == "" || smlAge == null )?null:Integer.valueOf(smlAge), (major == "" || major == null )?"":major,
					(bigPada == "" || bigPada == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(bigPada)),
					(smlPada == "" || smlPada == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(smlPada)),
					(paCate == "" || paCate == null )?"":paCate,
				    (bigPaUp == "" || bigPaUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(bigPaUp)),
					(smlPaUp == "" || smlPaUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(smlPaUp)));
			if(list == null){
				result.put("flg", null);
				result.put("list", null);
			}else{
				result.put("flg", "yes");
				result.put("list", list);
			}
		} catch (NumberFormatException e) {
			logger.error("GuiNaPatent_NumberFormatException");
			return null;
		} catch (ParseException e) {
			logger.error("GuiNaPatent_ParseException");
			return null;
		}
		return result;
	}

	@Override
	public List<Patent> findThInfo(String paCate, String bigPada, String smlPada, String bigPaUp, String smlPaUp) {
		try {
			return this.petentMapper.selectGuiNaPetent(Integer.valueOf("0"),"",null,"",null,null,"",
					(bigPada == "" || bigPada == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(bigPada)),
							(smlPada == "" || smlPada == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(smlPada)),
							(paCate == "" || paCate == null )?"":paCate,
						    (bigPaUp == "" || bigPaUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(bigPaUp)),
							(smlPaUp == "" || smlPaUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(smlPaUp)));
		 } catch (NumberFormatException e) {
			logger.error("findThInfo_NumberFormatException");
			return null;
		} catch (ParseException e) {
			logger.error("findThInfo_ParseException");
			return null;
		}
	}

}

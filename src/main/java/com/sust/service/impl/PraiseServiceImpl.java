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

import com.sust.dao.PraiseMapper;
import com.sust.entity.MyConfig;
import com.sust.entity.Praise;
import com.sust.other.MyUtils;
import com.sust.service.PraiseService;

@Service
public class PraiseServiceImpl implements PraiseService {

	private static final Log logger = LogFactory.getLog(PraiseServiceImpl.class);
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
				String re = MyUtils.deleteFile(dir,
						new SimpleDateFormat("yyyyMMddhhmmssSSS").format(this.praiseMapper.selectUpTimeByKey(deId)));
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

	@Override
	public List<Praise> getAllPraiseInfo() {

		return this.praiseMapper.selectAllPraiseInfo();
	}

	@Override
	public Map<String, Object> GuiNaPraise(String flg, String xuyuan, String sex, String duty, String bigAge,
			String smlAge, String major, String prCate, String bigPrda, String smlPrda, String bigPrUp,
			String smlPrUp) {
		List<Praise> list = null;
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			list =  this.praiseMapper.selectGuiNaPraise(Integer.valueOf(flg),(xuyuan != "" || xuyuan != null )? xuyuan:"", 
					(sex == "" || sex == null )?null:Byte.valueOf(sex),
					(duty == "" || duty == null )?"":duty, (bigAge == "" || bigAge == null )?null:Integer.valueOf(bigAge),
					(smlAge == "" || smlAge == null )?null:Integer.valueOf(smlAge), (major == "" || major == null )?"":major,
					(bigPrda == "" || bigPrda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(bigPrda)),
					(smlPrda == "" || smlPrda == null )? null: (Date) (new SimpleDateFormat("yyyy-MM-dd").parse(smlPrda)),
					(prCate == "" || prCate == null )?"":prCate,
				    (bigPrUp == "" || bigPrUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(bigPrUp)),
					(smlPrUp == "" || smlPrUp == null )? null: (new SimpleDateFormat("yyyy-MM-dd").parse(smlPrUp)));
			if(list == null){
				result.put("flg", null);
				result.put("list", null);
			}else{
				result.put("flg", "yes");
				result.put("list", list);
			}
		} catch (NumberFormatException e) {
			logger.error("GuiNaPraise_NumberFormatException");
			return null;
		} catch (ParseException e) {
			logger.error("GuiNaPraise_ParseException");
			return null;
		}
		return result;
	}

}

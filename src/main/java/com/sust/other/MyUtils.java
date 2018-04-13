package com.sust.other;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public final class MyUtils {

	private static final Log logger = LogFactory.getLog(MyUtils.class);
	private final static int[] li_SecPosValue = { 1601, 1637, 1833, 2078, 2274, 2302, 2433, 2594, 2787, 3106, 3212,
			3472, 3635, 3722, 3730, 3858, 4027, 4086, 4390, 4558, 4684, 4925, 5249, 5590 };
	private final static String[] lc_FirstLetter = { "a", "b", "c", "d", "e", "f", "g", "h", "j", "k", "l", "m", "n",
			"o", "p", "q", "r", "s", "t", "w", "x", "y", "z" };

	/**
	 * 获取文件列表
	 * 
	 * @param path
	 *            文件目录路径
	 */
	public static List<String> getDowenIfo(String path) {
		List<String> filelist = new ArrayList<String>();
		try {
			File dir = new File(path);
			File[] files = dir.listFiles(); // 该文件目录下文件全部放入数组
			if (files != null) {
				for (int i = 0; i < files.length; i++) {
					String fileName = files[i].getName();
					if (files[i].isFile()) {
						filelist.add(fileName);
					}
				}
			}
		} catch (Exception e) {
			logger.error("获取文件列表失败！", e);
		}
		return filelist;
	}

	/**
	 * 取得给定汉字串的首字母串,即声母串
	 * 
	 * @param str
	 *            给定汉字串
	 * @return 声母串
	 */
	public static String getAllFirstLetter(String str) {
		if (str == null || str.trim().length() == 0) {
			return "";
		}

		String _str = "";
		for (int i = 0; i < str.length(); i++) {
			_str = _str + getFirstLetter(str.substring(i, i + 1));
		}
		return _str;
	}

	/**
	 * 取得给定汉字的首字母,即声母
	 * 
	 * @param chinese
	 *            给定的汉字
	 * @return 给定汉字的声母
	 */
	public static String getFirstLetter(String chinese) {
		if (chinese == null || chinese.trim().length() == 0) {
			return "";
		}
		chinese = conversionStr(chinese, "GB2312", "ISO8859-1");
		if (chinese.length() > 1) // 判断是不是汉字
		{
			int li_SectorCode = (int) chinese.charAt(0); // 汉字区码
			int li_PositionCode = (int) chinese.charAt(1); // 汉字位码
			li_SectorCode = li_SectorCode - 160;
			li_PositionCode = li_PositionCode - 160;
			int li_SecPosCode = li_SectorCode * 100 + li_PositionCode; // 汉字区位码
			if (li_SecPosCode > 1600 && li_SecPosCode < 5590) {
				for (int i = 0; i < 23; i++) {
					if (li_SecPosCode >= li_SecPosValue[i] && li_SecPosCode < li_SecPosValue[i + 1]) {
						chinese = lc_FirstLetter[i];
						break;
					}
				}
			} else // 非汉字字符,如图形符号或ASCII码
			{
				chinese = conversionStr(chinese, "ISO8859-1", "GB2312");
				chinese = chinese.substring(0, 1);
			}
		}
		return chinese;
	}

	/**
	 * 字符串编码转换
	 * 
	 * @param str
	 *            要转换编码的字符串
	 * @param charsetName
	 *            原来的编码
	 * @param toCharsetName
	 *            转换后的编码
	 * @return 经过编码转换后的字符串
	 */
	private static String conversionStr(String str, String charsetName, String toCharsetName) {
		try {
			str = new String(str.getBytes(charsetName), toCharsetName);
		} catch (UnsupportedEncodingException ex) {
			logger.error("字符串编码转换异常：", ex);
		}
		return str;
	}

	/**
	 * list转Json类型
	 * 
	 * @param list
	 * @return
	 */
	public String toStr(List<String> list) {

		return JSONArray.fromObject(list).toString();
	}

	/**
	 * 判断文件路径是否存在
	 * 
	 * @param dir
	 * @return
	 */
	public static boolean CreatDir(File dir) {

		if (!dir.exists()) {
			dir.mkdir();
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 判断文件是否存在,存在则删除
	 * 
	 * @param path
	 * @param fileName
	 * @return
	 */
	public static void isExists(String dir, String fileName) {

		logger.info(dir + "++" + fileName);
		File file = new File(dir);
		CreatDir(file);
		String[] fileList = file.list();
		if (fileList != null && fileList.length != 0) {
			for (int i = 0; i < fileList.length; i++) {
				logger.info("isExists++" + fileList[i] + "++" + fileName + "++"
						+ fileList[i].substring(0, fileList[i].lastIndexOf('.')) + "++" + (dir + fileList[i]));
				if ((fileList[i].substring(0,fileList[i].lastIndexOf('.'))).equals(fileName)) {
					new File(dir + File.separatorChar + fileList[i]).delete();
					break;
				}
			}
		}
	}

	public static String findName(String dir, String name) {

		String reString = "";
		File file = new File(dir);
		String[] fileList = file.list();
		logger.info(dir+"++"+name);
		if (fileList != null && fileList.length != 0) {
			for (int i = 0; i < fileList.length; i++) {

				reString = fileList[i].substring(0,fileList[i].lastIndexOf('.'));
				logger.info(reString+"++"+dir+"++"+name);
				if(reString.equals(name)){
					reString = fileList[i];
					break;
				}else{
					reString = "NO_SUCH_FILE";
				}
			}
		}
		return reString;
	}
}

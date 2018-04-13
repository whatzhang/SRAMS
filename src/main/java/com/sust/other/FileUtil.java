package com.sust.other;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import com.sust.controller.ThesisController;

public class FileUtil {

	private static final Logger logger = Logger.getLogger(ThesisController.class);

	public List<String> getDowenIfo(String path) {
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

}

package com.sust.test;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;

import com.sust.other.MyUtils;
import com.sust.other.ZipUtil;

public class UtilTest {

	// http://localhost:8080/SRAMS/download/downloadTypeFile?type=thesis&id=413
	@Test
	public void fileIsExist() {

		// MyUtils.isExists("C:\\Users\\zys0916\\Desktop\\bean\\CC",
		// "20180413115806470");
		System.out.println(MyUtils.findName("C:\\Users\\Zhang\\Desktop\\tt", "er"));
		List<String> ll = new ArrayList<String>();
		ll.add("ddd");
		ll.add("fff");

		System.out.println(ll.get(0) + "++" + ll.get(1));

	}
	
	@Test
	public void listName(){
		 List<String> listName = Arrays.asList("论文","专利","获奖","项目","教材","竞赛");
		 System.out.println(MyUtils.getData(listName));
	}
	
	@Test
	public void ZipTest(){
		ArrayList<File> list = new ArrayList<File>();
		list.add(new File("C:/Users/Zhang/Desktop/毕业设计/资料/IMG_20171211_170207.jpg"));
		list.add(new File("C:/Users/Zhang/Desktop/毕业设计/资料/郝宏飞-开题报告.docx"));
		list.add(new File("C:/Users/Zhang/Desktop/毕业设计/资料/李俊杰-开题报告.docx"));
		ZipUtil.zipFiles(list, "C:/Users/Zhang/Desktop/毕业设计/资料/aa.zip");
	}
	
	@Test
	public void UnZipTest(){
		
		//ZipUtil.UnzipFile("C:/Users/Zhang/Desktop/毕业设计/资料/aa.zip", "C:/Users/Zhang/Desktop/毕业设计/资料/ss/", null);
		ZipUtil.zipFolder("C:/Users/Zhang/Desktop/毕业设计/资料/", "C:/Users/Zhang/Desktop/毕业设计/资料/all.zip");
	}
}

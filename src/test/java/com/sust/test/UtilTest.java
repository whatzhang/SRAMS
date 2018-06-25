package com.sust.test;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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
		 List<String> listName1 = Arrays.asList("12","23","343","44","55","564");
		 System.out.println(MyUtils.getData(listName));
		 System.out.println(listName1.toString());
		 System.out.println(MyUtils.getAllNum(listName,listName1,6));
		 
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
		
		ZipUtil.UnzipFile("C:/Users/Zhang/Desktop/毕业设计/资料/aa.zip", "C:/Users/Zhang/Desktop/毕业设计/资料/ss/", null);
		ZipUtil.zipFolder("C:/Users/Zhang/Desktop/毕业设计/资料/", "C:/Users/Zhang/Desktop/毕业设计/资料/all.zip");
	}
	
	@Test
	public void MapToString(){
		
		/*Map<String , String> aaMap = new HashMap<String, String>();
		aaMap.put("value", "aa");
		aaMap.put("name", "aaa");
		aaMap.put("value", "bb");
		aaMap.put("nmae", "bbb");
		//{value:335, name:'男'},
        //{value:120, name:'女'}
		System.out.println(aaMap.toString());
		System.out.println(aaMap.toString());*/
		//System.out.println(Calendar.getInstance().get(Calendar.YEAR));
		
		String str = "论文添加";
		List<String> info = Arrays.asList("论", "文", "专", "利", "获", "奖", "项", "目", "教", "材", "竞", "赛");
		 labe:for (int i = 0; i < str.length(); i++) {
			for (int j = 0; j < info.size(); j++) {
				if (String.valueOf(str.charAt(i)).equals(info.get(j))) {

					System.out.println("QQQQQQQQQ"+String.valueOf(str.charAt(i)) +"++"+ info.get(j));
					break labe;
				}
				System.out.println(String.valueOf(str.charAt(i)) +"++"+ info.get(j));
			}
		}
		
	}
	
}

package com.sust.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.sust.other.MyUtils;

public class UtilTest {

	//http://localhost:8080/SRAMS/download/downloadTypeFile?type=thesis&id=413
	@Test
	public void fileIsExist() {

		//MyUtils.isExists("C:\\Users\\zys0916\\Desktop\\bean\\CC", "20180413115806470");
		System.out.println(MyUtils.findName("C:\\Users\\Zhang\\Desktop\\tt", "er"));
		List<String> ll = new ArrayList<String>();
		ll.add("ddd");
		ll.add("fff");
		
		System.out.println(ll.get(0)+"++"+ll.get(1));
	
	}
}

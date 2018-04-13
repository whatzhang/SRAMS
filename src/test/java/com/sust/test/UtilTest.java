package com.sust.test;

import org.junit.Test;

import com.sust.other.MyUtils;

public class UtilTest {

	@Test
	public void fileIsExist() {

		MyUtils.isExists("C:\\Users\\zys0916\\Desktop\\bean\\CC", "20180413115806470");
	}
}

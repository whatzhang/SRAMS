package com.sust.entity;

import java.util.Arrays;
import java.util.List;

public class Charts {

	//信息类别
	private List<String> typeName = Arrays.asList("论文","专利","获奖","项目","教材","竞赛");
	//科研数量占比
	private List<String> allNumber = Arrays.asList("376","396","391","396","87","391");
	//男女科研种类数量
	private List<String> sexNanNumber = Arrays.asList("176","196","191","396","187","391");
	private List<String> sexNvNumber = Arrays.asList("276","96","391","196","87","191");
	//不同学院科研数量
	private List<String> academyName = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
	private List<String> academy1 = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
	private List<String> academy2 = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
	private List<String> academy3 = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
	private List<String> academy4 = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
	private List<String> academy5 = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
	private List<String> academy6 = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
	
	//一定时间内数据趋势
	private List<String> yearName = Arrays.asList("1","2","3","4","5","6","7","8","9","10");
	private List<String> thYear = Arrays.asList("1","2","3","4","5","6","7","8","9","10");
	private List<String> paYear = Arrays.asList("1","2","3","4","5","6","7","8","9","10");
	private List<String> prYear = Arrays.asList("1","2","3","4","5","6","7","8","9","10");
	private List<String> proYear = Arrays.asList("1","2","3","4","5","6","7","8","9","10");
	private List<String> boYear = Arrays.asList("1","2","3","4","5","6","7","8","9","10");
	private List<String> raYear = Arrays.asList("1","2","3","4","5","6","7","8","9","10");
	/* 论文 */
	//不同学院论文数量
	//不同类别数量占比
	private List<String> thCate = Arrays.asList("1","2","3","5");//自改
	private List<String> thCateNum = Arrays.asList("1","2","3","5");
	/* 专利 */
	//不同学院论文数量
	//不同类别数量占比
	private List<String> paCate = Arrays.asList("1","2","3","5");
	private List<String> paCateNum = Arrays.asList("1","2","3","5");
	/* 获奖 */
	//不同学院获奖数量
	//不同类别数量占比
	private List<String> prCate = Arrays.asList("个人","团体","其他");
	private List<String> prCateNum = Arrays.asList("1","2","3");
	//时间趋势 prYear
	/* 项目 */
	//不同类别数量占比
	private List<String> proCate = Arrays.asList("1","2","3","4");
	private List<String> proCateNum = Arrays.asList("1","2","3","4");
	//不同学院项目数量 proYear
	//项目金额
	private List<String> prMoney = Arrays.asList("<5000",">5000,<10000",">10000");
	private List<String> prMoneyNum = Arrays.asList("1000","2550","1300");
	/* 教材 */
	//不同类别数量占比
	private List<String> boCate = Arrays.asList("1","2","3","4");
	private List<String> boCateNum = Arrays.asList("1","2","3","4");
	//时间趋势 boYear
	//教材字数
	private List<String> boFont = Arrays.asList("<100",">100,<200",">200");
	private List<String> boFontNum = Arrays.asList("210","122","278");
	/* 竞赛 */
	//不同类别数量占比
	private List<String> raCate = Arrays.asList("1","2","3","4");
	private List<String> raCateNum = Arrays.asList("1","2","3","4");
	//时间趋势 raYear	
	/* 用户 */	
	//男女比例
	private List<String> sex = Arrays.asList("男","女");
	private List<String> sexNum = Arrays.asList("1","2");
	//年龄比例
	private List<String> age = Arrays.asList("Age<20", "20<Age<30", "30<Age<40", "40<Age<50", "Age>50");
	private List<String> ageNum = Arrays.asList("1","2","3","4","5");	
	
	
	public List<String> getTypeName() {
		return typeName;
	}

	public void setTypeName(List<String> typeName) {
		this.typeName = typeName;
	}

	public List<String> getAllNumber() {
		return allNumber;
	}

	public void setAllNumber(List<String> allNumber) {
		this.allNumber = allNumber;
	}

	public List<String> getSexNanNumber() {
		return sexNanNumber;
	}

	public void setSexNanNumber(List<String> sexNanNumber) {
		this.sexNanNumber = sexNanNumber;
	}

	public List<String> getSexNvNumber() {
		return sexNvNumber;
	}

	public void setSexNvNumber(List<String> sexNvNumber) {
		this.sexNvNumber = sexNvNumber;
	}

	public List<String> getAcademyName() {
		return academyName;
	}

	public void setAcademyName(List<String> academyName) {
		this.academyName = academyName;
	}

	public List<String> getAcademy1() {
		return academy1;
	}

	public void setAcademy1(List<String> academy1) {
		this.academy1 = academy1;
	}

	public List<String> getAcademy2() {
		return academy2;
	}

	public void setAcademy2(List<String> academy2) {
		this.academy2 = academy2;
	}

	public List<String> getAcademy3() {
		return academy3;
	}

	public void setAcademy3(List<String> academy3) {
		this.academy3 = academy3;
	}

	public List<String> getAcademy4() {
		return academy4;
	}

	public void setAcademy4(List<String> academy4) {
		this.academy4 = academy4;
	}

	public List<String> getAcademy5() {
		return academy5;
	}

	public void setAcademy5(List<String> academy5) {
		this.academy5 = academy5;
	}

	public List<String> getAcademy6() {
		return academy6;
	}

	public void setAcademy6(List<String> academy6) {
		this.academy6 = academy6;
	}

	public List<String> getYearName() {
		return yearName;
	}

	public void setYearName(List<String> yearName) {
		this.yearName = yearName;
	}

	public List<String> getThYear() {
		return thYear;
	}

	public void setThYear(List<String> thYear) {
		this.thYear = thYear;
	}

	public List<String> getPaYear() {
		return paYear;
	}

	public void setPaYear(List<String> paYear) {
		this.paYear = paYear;
	}

	public List<String> getPrYear() {
		return prYear;
	}

	public void setPrYear(List<String> prYear) {
		this.prYear = prYear;
	}

	public List<String> getProYear() {
		return proYear;
	}

	public void setProYear(List<String> proYear) {
		this.proYear = proYear;
	}

	public List<String> getBoYear() {
		return boYear;
	}

	public void setBoYear(List<String> boYear) {
		this.boYear = boYear;
	}

	public List<String> getRaYear() {
		return raYear;
	}

	public void setRaYear(List<String> raYear) {
		this.raYear = raYear;
	}

	public List<String> getThCate() {
		return thCate;
	}

	public void setThCate(List<String> thCate) {
		this.thCate = thCate;
	}

	public List<String> getThCateNum() {
		return thCateNum;
	}

	public void setThCateNum(List<String> thCateNum) {
		this.thCateNum = thCateNum;
	}

	public List<String> getPaCate() {
		return paCate;
	}

	public void setPaCate(List<String> paCate) {
		this.paCate = paCate;
	}

	public List<String> getPaCateNum() {
		return paCateNum;
	}

	public void setPaCateNum(List<String> paCateNum) {
		this.paCateNum = paCateNum;
	}

	public List<String> getPrCate() {
		return prCate;
	}

	public void setPrCate(List<String> prCate) {
		this.prCate = prCate;
	}

	public List<String> getPrCateNum() {
		return prCateNum;
	}

	public void setPrCateNum(List<String> prCateNum) {
		this.prCateNum = prCateNum;
	}

	public List<String> getProCate() {
		return proCate;
	}

	public void setProCate(List<String> proCate) {
		this.proCate = proCate;
	}

	public List<String> getProCateNum() {
		return proCateNum;
	}

	public void setProCateNum(List<String> proCateNum) {
		this.proCateNum = proCateNum;
	}

	public List<String> getPrMoney() {
		return prMoney;
	}

	public void setPrMoney(List<String> prMoney) {
		this.prMoney = prMoney;
	}

	public List<String> getPrMoneyNum() {
		return prMoneyNum;
	}

	public void setPrMoneyNum(List<String> prMoneyNum) {
		this.prMoneyNum = prMoneyNum;
	}

	public List<String> getBoCate() {
		return boCate;
	}

	public void setBoCate(List<String> boCate) {
		this.boCate = boCate;
	}

	public List<String> getBoCateNum() {
		return boCateNum;
	}

	public void setBoCateNum(List<String> boCateNum) {
		this.boCateNum = boCateNum;
	}

	public List<String> getBoFont() {
		return boFont;
	}

	public void setBoFont(List<String> boFont) {
		this.boFont = boFont;
	}

	public List<String> getBoFontNum() {
		return boFontNum;
	}

	public void setBoFontNum(List<String> boFontNum) {
		this.boFontNum = boFontNum;
	}

	public List<String> getRaCate() {
		return raCate;
	}

	public void setRaCate(List<String> raCate) {
		this.raCate = raCate;
	}

	public List<String> getRaCateNum() {
		return raCateNum;
	}

	public void setRaCateNum(List<String> raCateNum) {
		this.raCateNum = raCateNum;
	}

	public List<String> getSex() {
		return sex;
	}

	public void setSex(List<String> sex) {
		this.sex = sex;
	}

	public List<String> getSexNum() {
		return sexNum;
	}

	public void setSexNum(List<String> sexNum) {
		this.sexNum = sexNum;
	}

	public List<String> getAge() {
		return age;
	}

	public void setAge(List<String> age) {
		this.age = age;
	}

	public List<String> getAgeNum() {
		return ageNum;
	}

	public void setAgeNum(List<String> ageNum) {
		this.ageNum = ageNum;
	}	
}

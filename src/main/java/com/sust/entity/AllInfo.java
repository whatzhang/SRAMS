package com.sust.entity;

public class AllInfo {

	public String string1;
	public String string2;
	public String string3;
	public String string4;
	public String string5;
	
	public AllInfo(){
		
	}
	
	public AllInfo(String string1, String string2, String string3, String string4, String string5) {
		super();
		this.string1 = string1;
		this.string2 = string2;
		this.string3 = string3;
		this.string4 = string4;
		this.string5 = string5;
	}
	public AllInfo(String string1) {
		this.string1 = string1;
		this.string2 = "";
		this.string3 = "";
		this.string4 = "";
		this.string5 = "";
	}
	public AllInfo(String string1, String string2) {
		this.string1 = string1;
		this.string2 = string2;
		this.string3 = "";
		this.string4 = "";
		this.string5 = "";
	}
	public AllInfo(String string1, String string2, String string3) {
		this.string1 = string1;
		this.string2 = string2;
		this.string3 = string3;
		this.string4 = "";
		this.string5 = "";
	}
	public AllInfo(String string1, String string2, String string3, String string4) {
		this.string1 = string1;
		this.string2 = string2;
		this.string3 = string3;
		this.string4 = string4;
		this.string5 = "";
	}

	public String getString1() {
		return string1;
	}
	public void setString1(String string1) {
		this.string1 = string1;
	}
	public String getString2() {
		return string2;
	}
	public void setString2(String string2) {
		this.string2 = string2;
	}
	public String getString3() {
		return string3;
	}
	public void setString3(String string3) {
		this.string3 = string3;
	}
	public String getString4() {
		return string4;
	}
	public void setString4(String string4) {
		this.string4 = string4;
	}
	public String getString5() {
		return string5;
	}
	public void setString5(String string5) {
		this.string5 = string5;
	}

	@Override
	public String toString() {
		return "AllInfo [string1=" + string1 + ", string2=" + string2 + ", string3=" + string3 + ", string4=" + string4
				+ ", string5=" + string5 + ", getString1()=" + getString1() + ", getString2()=" + getString2()
				+ ", getString3()=" + getString3() + ", getString4()=" + getString4() + ", getString5()=" + getString5()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}

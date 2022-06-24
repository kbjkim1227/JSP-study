package com.saeyan.javabeans;

public class MemberBean {
	private String name;
	private String userid;
	public String getName() {
		return name;
	}
	//getter, settet
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public MemberBean(String name, String userid) {
		super();
		this.name = name;
		this.userid = userid;
	}
	// 매개 변수가 없는 생성자
		public MemberBean() {
		super();
	}

	@Override
	public String toString() {
		return "MemberBean [name=" + name + ", userid=" + userid + "]";
	}

}

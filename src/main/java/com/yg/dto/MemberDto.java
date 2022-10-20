package com.yg.dto;

public class MemberDto {
	private int member_id;
	private String name;
	private String id;
	private int pw;
	private String joindate;
	private int manager;
	public MemberDto() {}
	public MemberDto(String id, int pw) {
		this.id = id;
		this.pw = pw;
	}
	public MemberDto(String name, String id, int pw) {
		this.name = name;
		this.id = id;
		this.pw = pw;
	}
	public MemberDto(int member_id, String name, String id, int pw, String joindate, int manager) {
		super();
		this.member_id = member_id;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.joindate = joindate;
		this.manager = manager;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPw() {
		return pw;
	}
	public void setPw(int pw) {
		this.pw = pw;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	
	
}

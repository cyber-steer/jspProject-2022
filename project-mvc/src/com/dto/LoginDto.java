package com.dto;

/**
 * 패키지명 : com.dit
 * 파일명 : LoginDto.java
 * 작성자 : 장성익
 * Github : https://github.com/cyber-steer
 * 변경이력 :
 * 	2022-05-03/ 최초작성/ 장성익
 * 프로그램 설명 : 
 * 	DB데이터를 담아 전달하는 객체
 *====================================================*/
public class LoginDto {
	private String id;
	private String name;
	private String pwd;

	
	public LoginDto() {
	}
	public LoginDto(String id, String name, String pwd) {
		this.id = id;
		this.name = name;
		this.pwd = pwd;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}

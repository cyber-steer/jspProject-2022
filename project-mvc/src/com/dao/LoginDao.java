package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.dto.LoginDto;

/**
 * 패키지명 : com.dit
 * 파일명 : LoginDao.java
 * 작성자 : 장성익
 * Github : https://github.com/cyber-steer
 * 변경이력 :
 * 	2022-05-03/최초 작성/장성익
 * 프로그램 설명 : 
 * 	login 테이블과 연동하는 프로그램
 * 	- insert()
 *====================================================*/
public class LoginDao{
	
	// DBCP에서 Connection 얻어오기
	private Connection getConnection()  throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds =(DataSource) envCtx.lookup("jdbc/jsp");
		Connection con = ds.getConnection();
		return con;
	}
	
	// login 테이블에 사용자 정보 입력
	public void insert(LoginDto dto) {
		String sql = "INSERT INTO login(name,id,pwd) VALUES(?,?, ?);";
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		){
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// login 테이블에 사용자 정보 업데이트
	public void update(LoginDto dto) {
		String sql = "update login set name=?, pwd=? where id=?;";
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		){
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getId());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// login 테이블에 사용자 정보 삭제
	public void delete(String id) {
		String sql = "DELETE FROM login WHERE id=?;";
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);//프리페얼드스테이트먼트
		){
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// login 테이블에서 사용자 정보 검색
	public ArrayList<LoginDto> select() {
		ArrayList<LoginDto> dtos = new ArrayList<LoginDto>();
		String sql = "SELECT id,pwd,name FROM login;";
		try (
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			while(rs.next()) {
				LoginDto dto = new LoginDto();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	public LoginDto select(String id) {
		LoginDto dto= null;
		String sql = "SELECT id,pwd,name FROM login where id='"+id+"';";
		try (
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			if(rs.next()) {
				dto = new LoginDto();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public boolean checkUser(String id, String pwd) {
		String sql = "select pwd from login where id=?;";
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			){
				pstmt.setString(1, id);
				try (ResultSet rs = pstmt.executeQuery();){
					if(rs.next()) {
						if(rs.getString("pwd").equals(pwd))
							return true;
						else return false;
					}
					else {
						return false;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return false;
	}
}

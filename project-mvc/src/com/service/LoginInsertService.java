package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.LoginDao;
import com.dto.LoginDto;

public class LoginInsertService implements LoginService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		
		LoginDto dto = new LoginDto(id, name, pwd);
		LoginDao dao = new LoginDao();
		dao.insert(dto);
	}

}

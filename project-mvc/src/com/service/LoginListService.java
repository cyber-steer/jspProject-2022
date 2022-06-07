package com.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.LoginDao;
import com.dto.LoginDto;

public class LoginListService implements LoginService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. DAO를 생성
		LoginDao dao = new LoginDao();
		// 2. DAO에서 필요한 메소드 실행
		ArrayList<LoginDto> dtos =  dao.select();
		
		// 3. 반환된 데이터는 requestScope에 저장한다
		request.setAttribute("dtos", dtos);

	}

}
